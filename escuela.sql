PGDMP  4                    |            escuela    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16451    escuela    DATABASE     �   CREATE DATABASE escuela WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE escuela;
                     postgres    false            �            1259    16453 
   estudiante    TABLE     �   CREATE TABLE public.estudiante (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean DEFAULT true,
    edad integer
);
    DROP TABLE public.estudiante;
       public         heap r       postgres    false            �            1259    16452    estudiante_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estudiante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.estudiante_id_seq;
       public               postgres    false    218            �           0    0    estudiante_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.estudiante_id_seq OWNED BY public.estudiante.id;
          public               postgres    false    217            !           2604    16456    estudiante id    DEFAULT     n   ALTER TABLE ONLY public.estudiante ALTER COLUMN id SET DEFAULT nextval('public.estudiante_id_seq'::regclass);
 <   ALTER TABLE public.estudiante ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16453 
   estudiante 
   TABLE DATA           >   COPY public.estudiante (id, nombre, activo, edad) FROM stdin;
    public               postgres    false    218          �           0    0    estudiante_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.estudiante_id_seq', 4, true);
          public               postgres    false    217            $           2606    16459    estudiante estudiante_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT estudiante_pkey;
       public                 postgres    false    218            �   %   x�3��*M��,��,�42�2�LN,��/��b���� �Dn     