<?php

function shutup(&$pdo) {
  if ($pdo) $pdo = null;
}

function is_void($str){
  return (!isset($str) || trim($str) === '');
}

function valid_id($id) {
  return !is_void($id) && (preg_match('/\A\d+\z/u', $id) > 0);
}

function valid_score($score) {
  return !is_void($score) && (preg_match('/\A[0-4]\z/u', $score) > 0);
}

header('Content-Type: text/plain; charset=utf-8');

error_reporting(0);

if (!($_SERVER['REQUEST_METHOD'] === 'POST'))
{
    header('Refresh: 5; URL=../');
    http_response_code(500);
    die('Проходите мимо: ' . $_SERVER['REQUEST_METHOD']);
}

$ini = parse_ini_file(realpath('../../russe.ini'), true);

try {
  $pdo = new PDO('pgsql:host='   . $ini['pgsql']['host'] . ';' .
                       'port='   . $ini['pgsql']['port'] . ';' .
                       'dbname=' . $ini['pgsql']['database'],
                                   $ini['pgsql']['user'],
                                   $ini['pgsql']['password']);

  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
  header('Refresh: 5; URL=../');
  http_response_code(500);
  die("Ошибка подключения к PostgreSQL: " . $e->getMessage());
}

register_shutdown_function('shutup', &$pdo);

$uniqid = uniqid();
$remote_addr = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];

$data = array();

foreach ($_POST['pair'] as $id => $pair) {
  $score = $pair['score'];

  if (!valid_id($id) || !valid_score($score)) {
    header('Refresh: 5; URL=../');
    http_response_code(500);
    die('Проверка данных провалилась.');
  }

  array_push($data, array('pair_id' => $id, 'score' => (int) $score));
}

/*
DELETE FROM responses;
ALTER SEQUENCE responses_id_seq RESTART;
UPDATE responses SET id = DEFAULT;
*/

try {
  $pdo->beginTransaction();

  $stmt = $pdo->prepare("INSERT INTO responses (uniqid, pair_id, score, remote_addr, user_agent, timestamp) VALUES (?, ?, ?, ?, ?, localtimestamp)");

  $stmt->bindParam(1, $uniqid);
  $stmt->bindParam(4, $remote_addr);
  $stmt->bindParam(5, $user_agent);

  foreach ($data as $datum) {
    $stmt->bindParam(2, $datum['pair_id']);
    $stmt->bindParam(3, $datum['score']);
    $stmt->execute();
  }

  $stmt = null;

  $pdo->commit();
} catch (Exception $e) {
  $pdo->rollBack();
  http_response_code(500);
  die('Ошибка: ' . $e->getMessage());
}

header('Refresh: 5; URL=../../');
die('Спасибо! Сейчас вы будете перенаправлены на главную страницу.');
