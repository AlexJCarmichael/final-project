--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: char_equips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE char_equips (
    id integer NOT NULL,
    character_id integer,
    equipment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: char_equips_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE char_equips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: char_equips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE char_equips_id_seq OWNED BY char_equips.id;


--
-- Name: char_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE char_skills (
    id integer NOT NULL,
    character_id integer,
    skill_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: char_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE char_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: char_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE char_skills_id_seq OWNED BY char_skills.id;


--
-- Name: char_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE char_stats (
    id integer NOT NULL,
    character_id integer,
    stat_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: char_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE char_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: char_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE char_stats_id_seq OWNED BY char_stats.id;


--
-- Name: characters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE characters (
    id integer NOT NULL,
    name character varying NOT NULL,
    sheet_template_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bio text,
    player_id integer,
    npc boolean,
    level character varying DEFAULT '1'::character varying,
    currency character varying DEFAULT '0'::character varying
);


--
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE characters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE characters_id_seq OWNED BY characters.id;


--
-- Name: chat_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE chat_sessions (
    id integer NOT NULL,
    game_session_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: chat_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE chat_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE chat_sessions_id_seq OWNED BY chat_sessions.id;


--
-- Name: equipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE equipment (
    id integer NOT NULL,
    name character varying NOT NULL,
    damage character varying,
    category character varying NOT NULL,
    sub_category character varying,
    armor character varying,
    weight character varying,
    reach character varying,
    effects character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE equipment_id_seq OWNED BY equipment.id;


--
-- Name: friends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE friends (
    id integer NOT NULL,
    user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    status character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: friends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friends_id_seq OWNED BY friends.id;


--
-- Name: game_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE game_sessions (
    id integer NOT NULL,
    session_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    game_time timestamp without time zone
);


--
-- Name: game_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE game_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: game_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE game_sessions_id_seq OWNED BY game_sessions.id;


--
-- Name: game_sheets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE game_sheets (
    id integer NOT NULL,
    sheet_template_id integer,
    game_session_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: game_sheets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE game_sheets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: game_sheets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE game_sheets_id_seq OWNED BY game_sheets.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE messages (
    id integer NOT NULL,
    body character varying,
    user_id integer,
    chatable_id integer,
    chatable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE players (
    id integer NOT NULL,
    user_id integer,
    game_session_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: refile_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refile_attachments (
    id integer NOT NULL,
    namespace character varying NOT NULL
);


--
-- Name: refile_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refile_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refile_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refile_attachments_id_seq OWNED BY refile_attachments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: session_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE session_items (
    id integer NOT NULL,
    game_session_id integer,
    equipment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: session_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE session_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE session_items_id_seq OWNED BY session_items.id;


--
-- Name: sheet_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sheet_skills (
    id integer NOT NULL,
    sheet_template_id integer,
    skill_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sheet_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sheet_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sheet_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sheet_skills_id_seq OWNED BY sheet_skills.id;


--
-- Name: sheet_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sheet_stats (
    id integer NOT NULL,
    sheet_template_id integer,
    stat_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sheet_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sheet_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sheet_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sheet_stats_id_seq OWNED BY sheet_stats.id;


--
-- Name: sheet_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sheet_templates (
    id integer NOT NULL,
    user_id integer,
    game_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sheet_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sheet_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sheet_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sheet_templates_id_seq OWNED BY sheet_templates.id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skills (
    id integer NOT NULL,
    name character varying NOT NULL,
    rank integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE skills_id_seq OWNED BY skills.id;


--
-- Name: stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stats (
    id integer NOT NULL,
    name character varying NOT NULL,
    rank integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stats_id_seq OWNED BY stats.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_name character varying NOT NULL,
    name character varying NOT NULL,
    phone_number character varying,
    email character varying NOT NULL,
    encrypted_password character varying(128) NOT NULL,
    confirmation_token character varying(128),
    remember_token character varying(128) NOT NULL,
    profile_image_id character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_equips ALTER COLUMN id SET DEFAULT nextval('char_equips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_skills ALTER COLUMN id SET DEFAULT nextval('char_skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_stats ALTER COLUMN id SET DEFAULT nextval('char_stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY characters ALTER COLUMN id SET DEFAULT nextval('characters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY chat_sessions ALTER COLUMN id SET DEFAULT nextval('chat_sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY equipment ALTER COLUMN id SET DEFAULT nextval('equipment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friends ALTER COLUMN id SET DEFAULT nextval('friends_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY game_sessions ALTER COLUMN id SET DEFAULT nextval('game_sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY game_sheets ALTER COLUMN id SET DEFAULT nextval('game_sheets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refile_attachments ALTER COLUMN id SET DEFAULT nextval('refile_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY session_items ALTER COLUMN id SET DEFAULT nextval('session_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_skills ALTER COLUMN id SET DEFAULT nextval('sheet_skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_stats ALTER COLUMN id SET DEFAULT nextval('sheet_stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_templates ALTER COLUMN id SET DEFAULT nextval('sheet_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY skills ALTER COLUMN id SET DEFAULT nextval('skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stats ALTER COLUMN id SET DEFAULT nextval('stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: char_equips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_equips
    ADD CONSTRAINT char_equips_pkey PRIMARY KEY (id);


--
-- Name: char_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_skills
    ADD CONSTRAINT char_skills_pkey PRIMARY KEY (id);


--
-- Name: char_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_stats
    ADD CONSTRAINT char_stats_pkey PRIMARY KEY (id);


--
-- Name: characters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- Name: chat_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chat_sessions
    ADD CONSTRAINT chat_sessions_pkey PRIMARY KEY (id);


--
-- Name: equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: friends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (id);


--
-- Name: game_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY game_sessions
    ADD CONSTRAINT game_sessions_pkey PRIMARY KEY (id);


--
-- Name: game_sheets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY game_sheets
    ADD CONSTRAINT game_sheets_pkey PRIMARY KEY (id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: refile_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refile_attachments
    ADD CONSTRAINT refile_attachments_pkey PRIMARY KEY (id);


--
-- Name: session_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY session_items
    ADD CONSTRAINT session_items_pkey PRIMARY KEY (id);


--
-- Name: sheet_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_skills
    ADD CONSTRAINT sheet_skills_pkey PRIMARY KEY (id);


--
-- Name: sheet_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_stats
    ADD CONSTRAINT sheet_stats_pkey PRIMARY KEY (id);


--
-- Name: sheet_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_templates
    ADD CONSTRAINT sheet_templates_pkey PRIMARY KEY (id);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_char_equips_on_character_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_char_equips_on_character_id ON char_equips USING btree (character_id);


--
-- Name: index_char_equips_on_equipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_char_equips_on_equipment_id ON char_equips USING btree (equipment_id);


--
-- Name: index_char_skills_on_character_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_char_skills_on_character_id ON char_skills USING btree (character_id);


--
-- Name: index_char_skills_on_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_char_skills_on_skill_id ON char_skills USING btree (skill_id);


--
-- Name: index_char_stats_on_character_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_char_stats_on_character_id ON char_stats USING btree (character_id);


--
-- Name: index_char_stats_on_stat_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_char_stats_on_stat_id ON char_stats USING btree (stat_id);


--
-- Name: index_characters_on_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_characters_on_player_id ON characters USING btree (player_id);


--
-- Name: index_characters_on_sheet_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_characters_on_sheet_template_id ON characters USING btree (sheet_template_id);


--
-- Name: index_chat_sessions_on_game_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chat_sessions_on_game_session_id ON chat_sessions USING btree (game_session_id);


--
-- Name: index_friends_on_to_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friends_on_to_user_id ON friends USING btree (to_user_id);


--
-- Name: index_friends_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friends_on_user_id ON friends USING btree (user_id);


--
-- Name: index_game_sessions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_game_sessions_on_user_id ON game_sessions USING btree (user_id);


--
-- Name: index_game_sheets_on_game_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_game_sheets_on_game_session_id ON game_sheets USING btree (game_session_id);


--
-- Name: index_game_sheets_on_sheet_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_game_sheets_on_sheet_template_id ON game_sheets USING btree (sheet_template_id);


--
-- Name: index_messages_on_chatable_type_and_chatable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_chatable_type_and_chatable_id ON messages USING btree (chatable_type, chatable_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_user_id ON messages USING btree (user_id);


--
-- Name: index_players_on_game_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_players_on_game_session_id ON players USING btree (game_session_id);


--
-- Name: index_players_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_players_on_user_id ON players USING btree (user_id);


--
-- Name: index_refile_attachments_on_namespace; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refile_attachments_on_namespace ON refile_attachments USING btree (namespace);


--
-- Name: index_session_items_on_equipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_session_items_on_equipment_id ON session_items USING btree (equipment_id);


--
-- Name: index_session_items_on_game_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_session_items_on_game_session_id ON session_items USING btree (game_session_id);


--
-- Name: index_sheet_skills_on_sheet_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sheet_skills_on_sheet_template_id ON sheet_skills USING btree (sheet_template_id);


--
-- Name: index_sheet_skills_on_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sheet_skills_on_skill_id ON sheet_skills USING btree (skill_id);


--
-- Name: index_sheet_stats_on_sheet_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sheet_stats_on_sheet_template_id ON sheet_stats USING btree (sheet_template_id);


--
-- Name: index_sheet_stats_on_stat_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sheet_stats_on_stat_id ON sheet_stats USING btree (stat_id);


--
-- Name: index_sheet_templates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sheet_templates_on_user_id ON sheet_templates USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_02026c55aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_equips
    ADD CONSTRAINT fk_rails_02026c55aa FOREIGN KEY (character_id) REFERENCES characters(id);


--
-- Name: fk_rails_224cac07ce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY players
    ADD CONSTRAINT fk_rails_224cac07ce FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_273a25a7a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_273a25a7a6 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_295b7955f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_stats
    ADD CONSTRAINT fk_rails_295b7955f1 FOREIGN KEY (sheet_template_id) REFERENCES sheet_templates(id);


--
-- Name: fk_rails_3bcd78b0c9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY session_items
    ADD CONSTRAINT fk_rails_3bcd78b0c9 FOREIGN KEY (game_session_id) REFERENCES game_sessions(id);


--
-- Name: fk_rails_3fc5504579; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_skills
    ADD CONSTRAINT fk_rails_3fc5504579 FOREIGN KEY (character_id) REFERENCES characters(id);


--
-- Name: fk_rails_41fd4e184f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_stats
    ADD CONSTRAINT fk_rails_41fd4e184f FOREIGN KEY (stat_id) REFERENCES stats(id);


--
-- Name: fk_rails_44818d81f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY session_items
    ADD CONSTRAINT fk_rails_44818d81f7 FOREIGN KEY (equipment_id) REFERENCES equipment(id);


--
-- Name: fk_rails_5036d2c385; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_skills
    ADD CONSTRAINT fk_rails_5036d2c385 FOREIGN KEY (skill_id) REFERENCES skills(id);


--
-- Name: fk_rails_5b184d6e58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_stats
    ADD CONSTRAINT fk_rails_5b184d6e58 FOREIGN KEY (stat_id) REFERENCES stats(id);


--
-- Name: fk_rails_660930ec9e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_templates
    ADD CONSTRAINT fk_rails_660930ec9e FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_9f24c17043; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY game_sheets
    ADD CONSTRAINT fk_rails_9f24c17043 FOREIGN KEY (game_session_id) REFERENCES game_sessions(id);


--
-- Name: fk_rails_a24c36c31a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_equips
    ADD CONSTRAINT fk_rails_a24c36c31a FOREIGN KEY (equipment_id) REFERENCES equipment(id);


--
-- Name: fk_rails_a9f1142625; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY game_sheets
    ADD CONSTRAINT fk_rails_a9f1142625 FOREIGN KEY (sheet_template_id) REFERENCES sheet_templates(id);


--
-- Name: fk_rails_ae1f1bd2db; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY players
    ADD CONSTRAINT fk_rails_ae1f1bd2db FOREIGN KEY (game_session_id) REFERENCES game_sessions(id);


--
-- Name: fk_rails_af97cd1c1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chat_sessions
    ADD CONSTRAINT fk_rails_af97cd1c1f FOREIGN KEY (game_session_id) REFERENCES game_sessions(id);


--
-- Name: fk_rails_cb5e2c529b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_stats
    ADD CONSTRAINT fk_rails_cb5e2c529b FOREIGN KEY (character_id) REFERENCES characters(id);


--
-- Name: fk_rails_ccabe069b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sheet_skills
    ADD CONSTRAINT fk_rails_ccabe069b6 FOREIGN KEY (sheet_template_id) REFERENCES sheet_templates(id);


--
-- Name: fk_rails_e9506bbe4b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT fk_rails_e9506bbe4b FOREIGN KEY (sheet_template_id) REFERENCES sheet_templates(id);


--
-- Name: fk_rails_f2621fde12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY char_skills
    ADD CONSTRAINT fk_rails_f2621fde12 FOREIGN KEY (skill_id) REFERENCES skills(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20160502155421');

INSERT INTO schema_migrations (version) VALUES ('20160502161533');

INSERT INTO schema_migrations (version) VALUES ('20160502163415');

INSERT INTO schema_migrations (version) VALUES ('20160502164702');

INSERT INTO schema_migrations (version) VALUES ('20160502165137');

INSERT INTO schema_migrations (version) VALUES ('20160502165425');

INSERT INTO schema_migrations (version) VALUES ('20160502165535');

INSERT INTO schema_migrations (version) VALUES ('20160502165808');

INSERT INTO schema_migrations (version) VALUES ('20160502170039');

INSERT INTO schema_migrations (version) VALUES ('20160502170659');

INSERT INTO schema_migrations (version) VALUES ('20160502170740');

INSERT INTO schema_migrations (version) VALUES ('20160502170755');

INSERT INTO schema_migrations (version) VALUES ('20160502170808');

INSERT INTO schema_migrations (version) VALUES ('20160502172713');

INSERT INTO schema_migrations (version) VALUES ('20160502192942');

INSERT INTO schema_migrations (version) VALUES ('20160502201520');

INSERT INTO schema_migrations (version) VALUES ('20160503131518');

INSERT INTO schema_migrations (version) VALUES ('20160503132343');

INSERT INTO schema_migrations (version) VALUES ('20160503155929');

INSERT INTO schema_migrations (version) VALUES ('20160503182216');

INSERT INTO schema_migrations (version) VALUES ('20160505133429');

INSERT INTO schema_migrations (version) VALUES ('20160510192311');

INSERT INTO schema_migrations (version) VALUES ('20160510192454');

INSERT INTO schema_migrations (version) VALUES ('20160511233422');

INSERT INTO schema_migrations (version) VALUES ('20160511233927');

INSERT INTO schema_migrations (version) VALUES ('20160512171322');

INSERT INTO schema_migrations (version) VALUES ('20160513203348');

INSERT INTO schema_migrations (version) VALUES ('20160513230108');

INSERT INTO schema_migrations (version) VALUES ('20160514184948');

INSERT INTO schema_migrations (version) VALUES ('20160515020856');

