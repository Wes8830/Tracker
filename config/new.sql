--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: tracker_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_client (
    id integer NOT NULL,
    client character varying(32) NOT NULL,
    "desc" character varying(512) NOT NULL,
    link character varying(1024) NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.tracker_client OWNER TO postgres;

--
-- Name: tracker_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_client_id_seq OWNER TO postgres;

--
-- Name: tracker_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_client_id_seq OWNED BY public.tracker_client.id;


--
-- Name: tracker_client_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_client_product (
    id integer NOT NULL,
    status character varying(24) NOT NULL,
    client_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.tracker_client_product OWNER TO postgres;

--
-- Name: tracker_client_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_client_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_client_product_id_seq OWNER TO postgres;

--
-- Name: tracker_client_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_client_product_id_seq OWNED BY public.tracker_client_product.id;


--
-- Name: tracker_client_usecase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_client_usecase (
    id integer NOT NULL,
    status character varying(24) NOT NULL,
    client_id integer NOT NULL,
    usecase_id integer NOT NULL
);


ALTER TABLE public.tracker_client_usecase OWNER TO postgres;

--
-- Name: tracker_client_usecase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_client_usecase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_client_usecase_id_seq OWNER TO postgres;

--
-- Name: tracker_client_usecase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_client_usecase_id_seq OWNED BY public.tracker_client_usecase.id;


--
-- Name: tracker_component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_component (
    id integer NOT NULL,
    component character varying(32) NOT NULL,
    "desc" character varying(512) NOT NULL,
    img character varying(1024) NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.tracker_component OWNER TO postgres;

--
-- Name: tracker_component_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_component_id_seq OWNER TO postgres;

--
-- Name: tracker_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_component_id_seq OWNED BY public.tracker_component.id;


--
-- Name: tracker_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_product (
    id integer NOT NULL,
    product character varying(32) NOT NULL,
    "desc" character varying(512) NOT NULL,
    status character varying(24) NOT NULL,
    img character varying(1024) NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.tracker_product OWNER TO postgres;

--
-- Name: tracker_product_component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_product_component (
    id integer NOT NULL,
    component_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.tracker_product_component OWNER TO postgres;

--
-- Name: tracker_product_component_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_product_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_product_component_id_seq OWNER TO postgres;

--
-- Name: tracker_product_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_product_component_id_seq OWNED BY public.tracker_product_component.id;


--
-- Name: tracker_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_product_id_seq OWNER TO postgres;

--
-- Name: tracker_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_product_id_seq OWNED BY public.tracker_product.id;


--
-- Name: tracker_product_usecase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_product_usecase (
    id integer NOT NULL,
    status character varying(24) NOT NULL,
    product_id integer NOT NULL,
    usecase_id integer NOT NULL
);


ALTER TABLE public.tracker_product_usecase OWNER TO postgres;

--
-- Name: tracker_product_usecase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_product_usecase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_product_usecase_id_seq OWNER TO postgres;

--
-- Name: tracker_product_usecase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_product_usecase_id_seq OWNED BY public.tracker_product_usecase.id;


--
-- Name: tracker_usecase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_usecase (
    id integer NOT NULL,
    use_case character varying(32) NOT NULL,
    "desc" character varying(512) NOT NULL,
    doc character varying(1024) NOT NULL,
    status character varying(24) NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.tracker_usecase OWNER TO postgres;

--
-- Name: tracker_usecase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_usecase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_usecase_id_seq OWNER TO postgres;

--
-- Name: tracker_usecase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_usecase_id_seq OWNED BY public.tracker_usecase.id;


--
-- Name: tracker_userstory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker_userstory (
    id integer NOT NULL,
    i_need_to character varying(256) NOT NULL,
    "then" character varying(256) NOT NULL,
    operator character varying(3) NOT NULL,
    so_that character varying(128) NOT NULL,
    author_id integer NOT NULL,
    usecase_id integer NOT NULL
);


ALTER TABLE public.tracker_userstory OWNER TO postgres;

--
-- Name: tracker_userstory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracker_userstory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracker_userstory_id_seq OWNER TO postgres;

--
-- Name: tracker_userstory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracker_userstory_id_seq OWNED BY public.tracker_userstory.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: tracker_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client ALTER COLUMN id SET DEFAULT nextval('public.tracker_client_id_seq'::regclass);


--
-- Name: tracker_client_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client_product ALTER COLUMN id SET DEFAULT nextval('public.tracker_client_product_id_seq'::regclass);


--
-- Name: tracker_client_usecase id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client_usecase ALTER COLUMN id SET DEFAULT nextval('public.tracker_client_usecase_id_seq'::regclass);


--
-- Name: tracker_component id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_component ALTER COLUMN id SET DEFAULT nextval('public.tracker_component_id_seq'::regclass);


--
-- Name: tracker_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product ALTER COLUMN id SET DEFAULT nextval('public.tracker_product_id_seq'::regclass);


--
-- Name: tracker_product_component id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product_component ALTER COLUMN id SET DEFAULT nextval('public.tracker_product_component_id_seq'::regclass);


--
-- Name: tracker_product_usecase id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product_usecase ALTER COLUMN id SET DEFAULT nextval('public.tracker_product_usecase_id_seq'::regclass);


--
-- Name: tracker_usecase id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_usecase ALTER COLUMN id SET DEFAULT nextval('public.tracker_usecase_id_seq'::regclass);


--
-- Name: tracker_userstory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_userstory ALTER COLUMN id SET DEFAULT nextval('public.tracker_userstory_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can view user	1	view_user
5	Can add client	2	add_client
6	Can change client	2	change_client
7	Can delete client	2	delete_client
8	Can view client	2	view_client
9	Can add component	3	add_component
10	Can change component	3	change_component
11	Can delete component	3	delete_component
12	Can view component	3	view_component
13	Can add product	4	add_product
14	Can change product	4	change_product
15	Can delete product	4	delete_product
16	Can view product	4	view_product
17	Can add use case	5	add_usecase
18	Can change use case	5	change_usecase
19	Can delete use case	5	delete_usecase
20	Can view use case	5	view_usecase
21	Can add user story	6	add_userstory
22	Can change user story	6	change_userstory
23	Can delete user story	6	delete_userstory
24	Can view user story	6	view_userstory
25	Can add product_ use case	7	add_product_usecase
26	Can change product_ use case	7	change_product_usecase
27	Can delete product_ use case	7	delete_product_usecase
28	Can view product_ use case	7	view_product_usecase
29	Can add product_ component	8	add_product_component
30	Can change product_ component	8	change_product_component
31	Can delete product_ component	8	delete_product_component
32	Can view product_ component	8	view_product_component
33	Can add client_ use case	9	add_client_usecase
34	Can change client_ use case	9	change_client_usecase
35	Can delete client_ use case	9	delete_client_usecase
36	Can view client_ use case	9	view_client_usecase
37	Can add client_ product	10	add_client_product
38	Can change client_ product	10	change_client_product
39	Can delete client_ product	10	delete_client_product
40	Can view client_ product	10	view_client_product
41	Can add log entry	11	add_logentry
42	Can change log entry	11	change_logentry
43	Can delete log entry	11	delete_logentry
44	Can view log entry	11	view_logentry
45	Can add permission	12	add_permission
46	Can change permission	12	change_permission
47	Can delete permission	12	delete_permission
48	Can view permission	12	view_permission
49	Can add group	13	add_group
50	Can change group	13	change_group
51	Can delete group	13	delete_group
52	Can view group	13	view_group
53	Can add content type	14	add_contenttype
54	Can change content type	14	change_contenttype
55	Can delete content type	14	delete_contenttype
56	Can view content type	14	view_contenttype
57	Can add session	15	add_session
58	Can change session	15	change_session
59	Can delete session	15	delete_session
60	Can view session	15	view_session
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	users	user
2	tracker	client
3	tracker	component
4	tracker	product
5	tracker	usecase
6	tracker	userstory
7	tracker	product_usecase
8	tracker	product_component
9	tracker	client_usecase
10	tracker	client_product
11	admin	logentry
12	auth	permission
13	auth	group
14	contenttypes	contenttype
15	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-01-31 23:10:22.364154+00
2	contenttypes	0002_remove_content_type_name	2022-01-31 23:10:22.370301+00
3	auth	0001_initial	2022-01-31 23:10:22.4282+00
4	auth	0002_alter_permission_name_max_length	2022-01-31 23:10:22.433073+00
5	auth	0003_alter_user_email_max_length	2022-01-31 23:10:22.438205+00
6	auth	0004_alter_user_username_opts	2022-01-31 23:10:22.443829+00
7	auth	0005_alter_user_last_login_null	2022-01-31 23:10:22.448614+00
8	auth	0006_require_contenttypes_0002	2022-01-31 23:10:22.451177+00
9	auth	0007_alter_validators_add_error_messages	2022-01-31 23:10:22.455961+00
10	auth	0008_alter_user_username_max_length	2022-01-31 23:10:22.461845+00
11	auth	0009_alter_user_last_name_max_length	2022-01-31 23:10:22.467335+00
12	auth	0010_alter_group_name_max_length	2022-01-31 23:10:22.472355+00
13	auth	0011_update_proxy_permissions	2022-01-31 23:10:22.476938+00
14	auth	0012_alter_user_first_name_max_length	2022-01-31 23:10:22.48156+00
15	users	0001_initial	2022-01-31 23:10:22.543124+00
16	admin	0001_initial	2022-01-31 23:10:22.570534+00
17	admin	0002_logentry_remove_auto_add	2022-01-31 23:10:22.578718+00
18	admin	0003_logentry_add_action_flag_choices	2022-01-31 23:10:22.585479+00
19	sessions	0001_initial	2022-01-31 23:10:22.607704+00
20	tracker	0001_initial	2022-01-31 23:10:22.859779+00
21	tracker	0002_auto_20211228_0202	2022-01-31 23:10:22.874608+00
22	tracker	0003_delete_usecase_userstory	2022-01-31 23:10:22.878228+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bd0yivjk5jl2omba9xri512mk7pgfy3z	.eJxVjDsOwjAQBe_iGlne-JdQ0nMGa9e7xgHkSPlUiLtDpBTQvpl5L5VwW2vaFpnTyOqsQJ1-N8L8kLYDvmO7TTpPbZ1H0ruiD7ro68TyvBzu30HFpX5rEU8koUDgiLFzg_gugo1C2Rs24EvAAq4UziZ0RBm4H9ChNRZ6HLx6fwD_0zhV:1nEg2j:uE_ASP1_X9jX7SyGkKHX-jNck7Wowt1V2aqGwq_fKto	2022-02-14 23:25:05.046784+00
\.


--
-- Data for Name: tracker_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_client (id, client, "desc", link, author_id) FROM stdin;
2	Client A	Client A has product management and client tracking requirements		1
3	Client B	Also has product management and client tracking requirements	https://www.example.com	1
4	Client C	Has many demands but not super responsive	https://www.example.com	1
5	Client D	Very vocal and happy to hop on to discuss feature development	https://www.example.com	1
6	Client E	Wants to invest heavily in the product and partner	https://www.example.com	1
7	Client F	Needs a very specific feature, likely unique to them	https://www.example.com	1
21	Client G	Test	https://www.example.com	1
22	Client H	Test Client	https://www.example.com	1
\.


--
-- Data for Name: tracker_client_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_client_product (id, status, client_id, product_id) FROM stdin;
\.


--
-- Data for Name: tracker_client_usecase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_client_usecase (id, status, client_id, usecase_id) FROM stdin;
\.


--
-- Data for Name: tracker_component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_component (id, component, "desc", img, author_id) FROM stdin;
\.


--
-- Data for Name: tracker_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_product (id, product, "desc", status, img, author_id) FROM stdin;
1	Use Case Tracker	Use case tracker enables Sales, Engineers, Product professionals keep track of which use cases any clients or products required	Beta		1
2	User Login	Login Authentication application	Live		1
3	Documenter	Documentation product embedded within Use Case Tracker	Concept		1
5	Project Builder	Add multiple Use Cases to a Project that span multiple products	Concept		1
15	Clean URL	check Network requests Against this Bug	Concept		1
\.


--
-- Data for Name: tracker_product_component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_product_component (id, component_id, product_id) FROM stdin;
\.


--
-- Data for Name: tracker_product_usecase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_product_usecase (id, status, product_id, usecase_id) FROM stdin;
\.


--
-- Data for Name: tracker_usecase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_usecase (id, use_case, "desc", doc, status, author_id) FROM stdin;
1	Upload Image Files	Upload image files into a Django directory to be referenced by MEDIA_ROOT	https://www.geeksforgeeks.org/python-uploading-images-in-django/	Queued	1
2	Cycle through Primary Filters	Filter by Client/Product/Component/Use Case/etc. for a 360 degree view of the data relationships		Queued	1
3	Log a user in	Log user in - > Redirect me to the index page after I've logged in	https://docs.djangoproject.com/en/3.2/topics/auth/default/#how-to-log-a-user-in	Review	1
4	Log out user	Mechanism to Log a user out	https://docs.djangoproject.com/en/3.2/topics/auth/default/#how-to-log-a-user-out	Live	1
5	Register a User	Register new users to use the sysem	https://docs.djangoproject.com/en/3.2/topics/auth/default/#creating-users	Queued	1
6	Dynamic javascript in index	Add javascript tags in index.html file so that my pages can update dynamically without refreshing the page	https://cs50.harvard.edu/web/2020/notes/5/	Not Supported	1
7	Link to Title in card	Link to the proper View based on the Card's Title		Review	1
8	Edit Use Case	Edit use cases that have already been created		Live	1
9	Auto-fill Edit Form	Auto fill in form with existing data to be edited		Review	1
10	Link Use Case to Client	Link a use case to a client so that I can track use cases on a client basis		Not Supported	1
28	Color code each Card Type	Each item type should receive it's own recognizeable color		Live	1
\.


--
-- Data for Name: tracker_userstory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracker_userstory (id, i_need_to, "then", operator, so_that, author_id, usecase_id) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$QxxaYJ27XE9ZSBVgxyMmES$WDXdbTw/6mpW9EEDYOy+6ng0koo3eXhZhmJKpngicbU=	2022-01-31 23:25:05.044019+00	t	Wes8830				t	t	2022-01-31 23:14:53.982862+00
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: tracker_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_client_id_seq', 22, true);


--
-- Name: tracker_client_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_client_product_id_seq', 1, false);


--
-- Name: tracker_client_usecase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_client_usecase_id_seq', 1, false);


--
-- Name: tracker_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_component_id_seq', 1, false);


--
-- Name: tracker_product_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_product_component_id_seq', 1, false);


--
-- Name: tracker_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_product_id_seq', 15, true);


--
-- Name: tracker_product_usecase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_product_usecase_id_seq', 1, false);


--
-- Name: tracker_usecase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_usecase_id_seq', 28, true);


--
-- Name: tracker_userstory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracker_userstory_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: tracker_client tracker_client_client_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client
    ADD CONSTRAINT tracker_client_client_key UNIQUE (client);


--
-- Name: tracker_client tracker_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client
    ADD CONSTRAINT tracker_client_pkey PRIMARY KEY (id);


--
-- Name: tracker_client_product tracker_client_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client_product
    ADD CONSTRAINT tracker_client_product_pkey PRIMARY KEY (id);


--
-- Name: tracker_client_usecase tracker_client_usecase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client_usecase
    ADD CONSTRAINT tracker_client_usecase_pkey PRIMARY KEY (id);


--
-- Name: tracker_component tracker_component_component_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_component
    ADD CONSTRAINT tracker_component_component_key UNIQUE (component);


--
-- Name: tracker_component tracker_component_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_component
    ADD CONSTRAINT tracker_component_pkey PRIMARY KEY (id);


--
-- Name: tracker_product_component tracker_product_component_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product_component
    ADD CONSTRAINT tracker_product_component_pkey PRIMARY KEY (id);


--
-- Name: tracker_product tracker_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product
    ADD CONSTRAINT tracker_product_pkey PRIMARY KEY (id);


--
-- Name: tracker_product tracker_product_product_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product
    ADD CONSTRAINT tracker_product_product_key UNIQUE (product);


--
-- Name: tracker_product_usecase tracker_product_usecase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product_usecase
    ADD CONSTRAINT tracker_product_usecase_pkey PRIMARY KEY (id);


--
-- Name: tracker_usecase tracker_usecase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_usecase
    ADD CONSTRAINT tracker_usecase_pkey PRIMARY KEY (id);


--
-- Name: tracker_usecase tracker_usecase_use_case_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_usecase
    ADD CONSTRAINT tracker_usecase_use_case_key UNIQUE (use_case);


--
-- Name: tracker_userstory tracker_userstory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_userstory
    ADD CONSTRAINT tracker_userstory_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: tracker_client_author_id_4a6243d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_client_author_id_4a6243d4 ON public.tracker_client USING btree (author_id);


--
-- Name: tracker_client_client_72652b65_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_client_client_72652b65_like ON public.tracker_client USING btree (client varchar_pattern_ops);


--
-- Name: tracker_client_product_client_id_82512a16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_client_product_client_id_82512a16 ON public.tracker_client_product USING btree (client_id);


--
-- Name: tracker_client_product_product_id_d30a3be5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_client_product_product_id_d30a3be5 ON public.tracker_client_product USING btree (product_id);


--
-- Name: tracker_client_usecase_client_id_4b06d650; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_client_usecase_client_id_4b06d650 ON public.tracker_client_usecase USING btree (client_id);


--
-- Name: tracker_client_usecase_usecase_id_f330579f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_client_usecase_usecase_id_f330579f ON public.tracker_client_usecase USING btree (usecase_id);


--
-- Name: tracker_component_author_id_9a48231f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_component_author_id_9a48231f ON public.tracker_component USING btree (author_id);


--
-- Name: tracker_component_component_83ba5dbf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_component_component_83ba5dbf_like ON public.tracker_component USING btree (component varchar_pattern_ops);


--
-- Name: tracker_product_author_id_16a1b43c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_product_author_id_16a1b43c ON public.tracker_product USING btree (author_id);


--
-- Name: tracker_product_component_component_id_ae4cee18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_product_component_component_id_ae4cee18 ON public.tracker_product_component USING btree (component_id);


--
-- Name: tracker_product_component_product_id_a752490c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_product_component_product_id_a752490c ON public.tracker_product_component USING btree (product_id);


--
-- Name: tracker_product_product_c2a0ebe3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_product_product_c2a0ebe3_like ON public.tracker_product USING btree (product varchar_pattern_ops);


--
-- Name: tracker_product_usecase_product_id_12416d9a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_product_usecase_product_id_12416d9a ON public.tracker_product_usecase USING btree (product_id);


--
-- Name: tracker_product_usecase_usecase_id_26929840; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_product_usecase_usecase_id_26929840 ON public.tracker_product_usecase USING btree (usecase_id);


--
-- Name: tracker_usecase_author_id_caba33f2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_usecase_author_id_caba33f2 ON public.tracker_usecase USING btree (author_id);


--
-- Name: tracker_usecase_use_case_2a7af3d5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_usecase_use_case_2a7af3d5_like ON public.tracker_usecase USING btree (use_case varchar_pattern_ops);


--
-- Name: tracker_userstory_author_id_da0f40d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_userstory_author_id_da0f40d4 ON public.tracker_userstory USING btree (author_id);


--
-- Name: tracker_userstory_usecase_id_b943a227; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tracker_userstory_usecase_id_b943a227 ON public.tracker_userstory USING btree (usecase_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_client tracker_client_author_id_4a6243d4_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client
    ADD CONSTRAINT tracker_client_author_id_4a6243d4_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_client_product tracker_client_produ_product_id_d30a3be5_fk_tracker_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client_product
    ADD CONSTRAINT tracker_client_produ_product_id_d30a3be5_fk_tracker_p FOREIGN KEY (product_id) REFERENCES public.tracker_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_client_product tracker_client_product_client_id_82512a16_fk_tracker_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client_product
    ADD CONSTRAINT tracker_client_product_client_id_82512a16_fk_tracker_client_id FOREIGN KEY (client_id) REFERENCES public.tracker_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_client_usecase tracker_client_useca_usecase_id_f330579f_fk_tracker_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client_usecase
    ADD CONSTRAINT tracker_client_useca_usecase_id_f330579f_fk_tracker_u FOREIGN KEY (usecase_id) REFERENCES public.tracker_usecase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_client_usecase tracker_client_usecase_client_id_4b06d650_fk_tracker_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_client_usecase
    ADD CONSTRAINT tracker_client_usecase_client_id_4b06d650_fk_tracker_client_id FOREIGN KEY (client_id) REFERENCES public.tracker_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_component tracker_component_author_id_9a48231f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_component
    ADD CONSTRAINT tracker_component_author_id_9a48231f_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_product tracker_product_author_id_16a1b43c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product
    ADD CONSTRAINT tracker_product_author_id_16a1b43c_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_product_component tracker_product_comp_component_id_ae4cee18_fk_tracker_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product_component
    ADD CONSTRAINT tracker_product_comp_component_id_ae4cee18_fk_tracker_c FOREIGN KEY (component_id) REFERENCES public.tracker_component(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_product_component tracker_product_comp_product_id_a752490c_fk_tracker_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product_component
    ADD CONSTRAINT tracker_product_comp_product_id_a752490c_fk_tracker_p FOREIGN KEY (product_id) REFERENCES public.tracker_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_product_usecase tracker_product_usec_product_id_12416d9a_fk_tracker_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product_usecase
    ADD CONSTRAINT tracker_product_usec_product_id_12416d9a_fk_tracker_p FOREIGN KEY (product_id) REFERENCES public.tracker_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_product_usecase tracker_product_usec_usecase_id_26929840_fk_tracker_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_product_usecase
    ADD CONSTRAINT tracker_product_usec_usecase_id_26929840_fk_tracker_u FOREIGN KEY (usecase_id) REFERENCES public.tracker_usecase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_usecase tracker_usecase_author_id_caba33f2_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_usecase
    ADD CONSTRAINT tracker_usecase_author_id_caba33f2_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_userstory tracker_userstory_author_id_da0f40d4_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_userstory
    ADD CONSTRAINT tracker_userstory_author_id_da0f40d4_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tracker_userstory tracker_userstory_usecase_id_b943a227_fk_tracker_usecase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker_userstory
    ADD CONSTRAINT tracker_userstory_usecase_id_b943a227_fk_tracker_usecase_id FOREIGN KEY (usecase_id) REFERENCES public.tracker_usecase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

