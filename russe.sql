--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plperl; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plperl WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plperl; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plperl IS 'PL/Perl procedural language';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pairs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pairs (
    id integer NOT NULL,
    word1 text NOT NULL,
    word2 text NOT NULL
);


--
-- Name: responses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE responses (
    id integer NOT NULL,
    uniqid character varying(13) NOT NULL,
    pair_id integer NOT NULL,
    score smallint NOT NULL,
    remote_addr inet,
    user_agent text,
    "timestamp" timestamp without time zone
);


--
-- Name: pair_scores; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW pair_scores AS
    SELECT pairs.id AS pair_id, count(responses.pair_id) AS count, avg(responses.score) AS mean, stddev_samp(responses.score) AS stddev FROM (pairs LEFT JOIN responses ON ((responses.pair_id = pairs.id))) GROUP BY pairs.id ORDER BY stddev_samp(responses.score) DESC, count(responses.pair_id), random();


--
-- Name: pairs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pairs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pairs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pairs_id_seq OWNED BY pairs.id;


--
-- Name: responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE responses_id_seq OWNED BY responses.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pairs ALTER COLUMN id SET DEFAULT nextval('pairs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY responses ALTER COLUMN id SET DEFAULT nextval('responses_id_seq'::regclass);


--
-- Name: pairs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pairs
    ADD CONSTRAINT pairs_pkey PRIMARY KEY (id);


--
-- Name: responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY responses
    ADD CONSTRAINT responses_pkey PRIMARY KEY (id);


--
-- Name: responses_pair_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY responses
    ADD CONSTRAINT responses_pair_id_fk FOREIGN KEY (pair_id) REFERENCES pairs(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

