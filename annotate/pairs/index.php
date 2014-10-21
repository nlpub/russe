<?php

function shutup(&$pdo) {
  if ($pdo) $pdo = null;
}

header('Content-Type: text/plain; charset=utf-8');

error_reporting(0);

if (!($_SERVER['REQUEST_METHOD'] === 'GET'))
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

$sql = 'SELECT * FROM pairs JOIN pair_scores ON pair_scores.pair_id = pairs.id LIMIT 15;';
$data = array();

foreach ($pdo->query($sql) as $row) {
  array_push($data, array('id'    => $row['id'],
                          'word1' => $row['word1'],
                          'word2' => $row['word2']));
}

header('Content-Type: application/json', true);
die(json_encode($data));
