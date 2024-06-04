PGDMP                      |            electroemporium    16.3    16.3 $    	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16397    electroemporium    DATABASE     �   CREATE DATABASE electroemporium WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE electroemporium;
                postgres    false            �            1259    16956 	   Addresses    TABLE     �  CREATE TABLE public."Addresses" (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postalcode character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Addresses";
       public         heap    postgres    false            �            1259    16955    Addresses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Addresses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Addresses_id_seq";
       public          postgres    false    222                       0    0    Addresses_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Addresses_id_seq" OWNED BY public."Addresses".id;
          public          postgres    false    221            �            1259    16930 
   Categories    TABLE     �   CREATE TABLE public."Categories" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Categories";
       public         heap    postgres    false            �            1259    16929    Categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Categories_id_seq";
       public          postgres    false    218                       0    0    Categories_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Categories_id_seq" OWNED BY public."Categories".id;
          public          postgres    false    217            �            1259    16937    Products    TABLE     �  CREATE TABLE public."Products" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price double precision NOT NULL,
    stock integer NOT NULL,
    condition character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    "userId" integer,
    "categoryId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Products";
       public         heap    postgres    false            �            1259    16936    Products_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Products_id_seq";
       public          postgres    false    220                       0    0    Products_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;
          public          postgres    false    219            �            1259    16919    Users    TABLE     P  CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    typeuser character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false            �            1259    16918    Users_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public          postgres    false    216                       0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
          public          postgres    false    215            b           2604    16959    Addresses id    DEFAULT     p   ALTER TABLE ONLY public."Addresses" ALTER COLUMN id SET DEFAULT nextval('public."Addresses_id_seq"'::regclass);
 =   ALTER TABLE public."Addresses" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            `           2604    16933    Categories id    DEFAULT     r   ALTER TABLE ONLY public."Categories" ALTER COLUMN id SET DEFAULT nextval('public."Categories_id_seq"'::regclass);
 >   ALTER TABLE public."Categories" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            a           2604    16940    Products id    DEFAULT     n   ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);
 <   ALTER TABLE public."Products" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            _           2604    16922    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216                      0    16956 	   Addresses 
   TABLE DATA           x   COPY public."Addresses" (id, address, city, state, postalcode, country, "userId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    222   ?+                 0    16930 
   Categories 
   TABLE DATA           J   COPY public."Categories" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   �+                 0    16937    Products 
   TABLE DATA           �   COPY public."Products" (id, name, description, price, stock, condition, image, "userId", "categoryId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    220   �,                  0    16919    Users 
   TABLE DATA           `   COPY public."Users" (id, name, email, password, typeuser, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   �2                  0    0    Addresses_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Addresses_id_seq"', 3, true);
          public          postgres    false    221                       0    0    Categories_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Categories_id_seq"', 14, true);
          public          postgres    false    217                       0    0    Products_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Products_id_seq"', 14, true);
          public          postgres    false    219                       0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 4, true);
          public          postgres    false    215            l           2606    16963    Addresses Addresses_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_pkey";
       public            postgres    false    222            h           2606    16935    Categories Categories_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Categories" DROP CONSTRAINT "Categories_pkey";
       public            postgres    false    218            j           2606    16944    Products Products_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_pkey";
       public            postgres    false    220            d           2606    16928    Users Users_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public            postgres    false    216            f           2606    16926    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    216            o           2606    16964    Addresses Addresses_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_userId_fkey";
       public          postgres    false    216    4710    222            m           2606    16950 !   Products Products_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Categories"(id) ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_categoryId_fkey";
       public          postgres    false    220    4712    218            n           2606    16945    Products Products_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_userId_fkey";
       public          postgres    false    216    220    4710               v   x���K
�@D�ݧp=C��d� BI��'n$$A�)�zP��k���p�Ϸ^��v���s�����0�E�(�RL�R�t��?�A�7�Ʉw?�z�`�\ؓg�1,6	'Fl         �   x�}�=BAF�ZV��U� [+��ؑ�O۹sBz�=߯�����8L�������~��ȠvI�_F�uM԰n���
tI�X{�dS4�$
�{6chvIԱ���k�%р:$ep�q�5���R�g�@�D뗎���HsOYs^�b){1vV)>��g�����H�EOn�xI���b�:����D��R��         �  x�}��r�6���S��Cj@���ʕ�l�=��Ė'�T� �0C4 J����C*�\�biP����%���C���)���1k�B������]%n�U���)������E�z|X��J�Xm�.D+
��O�	����Z.�O�e6��jX�[�������,�f�Tv�㿵Co�b÷\'��8>uή���;Kc:=�<ŵ��u��)���s�x/�Ը��=[��Ӂ瓀�ӏh@S��~�|2gE6'��Õ�3�+Yam����B`�`?���<���I�rk�&�|\��6w{	uB'pD�PX��l��0p�$���1�璗�@g�p��BI�a�tK���Z�ꚡ��ѡE�u}]���O�x|h쉁!JO/���x�)ܡ93\=�5�����S@�w��T��0&E���J�n����sp;��^緂I��,JΩAD�Z)׭�|/�d����H,G��e;��XF�3c�4�\Io��'���!� ��!�>S8��.,��(9�7Yo��o�7��Y.�!��{<�]��)�ʕMP�ô�2�C�p�QVR�f<�Y��$�#VP��>ϒ��Å�1��$Y6�a�
�x�D�� �$.M菨^�F�s*[a@o�o�����W�$o���NZ�����F�aT
���۲ �6��ub����l�4k����zo�ʋ�nt�߄�X����o�e��.��~x]�*_(Pl͵΋^�x��X"m�7��rVD��M��E�1��4�w�zeQ����__~9���_]����hv~>;A��.��l}��(zP�hR��Hi�����7�8���|�̲��R���nu���V�.T?���ͪ�U ���[w6��4^�Ւ�ڃ�|�}��g}�1�9����j��x´�5`�'��Cy��ۚF�3�P�!�Se��ٰi/�i"�ڛ��re))�����%H�;[�FQ��[!�M�g�f�K�A�@�x���nSz#�A�������E��4�#|:=�$���O� �I���GP�1�\��;��2��Y�������Dǰz2-h 1��N�B觘VLASCsi��a�:Ɏ��sn�>Lx�n`���jit�y��ǃ��� >b@�$u�`G�~m�:N��W�B*��\8��Ҏ�Q[�f�O��j�B�@C�MǊ�auR��#j۞~,����-��}_'�����J3L�vS��)^vX�w��;�L�?�<J�(KvF�5�2�R���C|hv���h� M��� �PA�mɆ\�҆�7�������Nja�
��-
Q�Q��o��i��հ7�E[B�?�?�H�=���?���q��+�z�����7�(<D
�,�:jK ����	�%1$�sQ���ä'� �͵t!j�Ш ��A��(wC�h@f�6H�yq�^ �[�F{���O�/�u8u�)Te���2����B�ڃ!�n�,�w1J�$pɎ��+��Ow4��V�V          �   x����
!����)|��j���Z��`�vm.!�I��`�h{~����8f>�x^K��X��Q�� �Bm`���@����Cɕ���b�M?��S���?��a�O��԰Vef�Ob��d����++�u3�Wb�{�C�     