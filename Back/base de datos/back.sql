PGDMP  )                    |            electroemporium    15.5    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    63863    electroemporium    DATABASE     �   CREATE DATABASE electroemporium WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE electroemporium;
                postgres    false            �            1259    64297 
   Categories    TABLE     �   CREATE TABLE public."Categories" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Categories";
       public         heap    postgres    false            �            1259    64296    Categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Categories_id_seq";
       public          postgres    false    215            	           0    0    Categories_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Categories_id_seq" OWNED BY public."Categories".id;
          public          postgres    false    214            �            1259    64304    Products    TABLE     �  CREATE TABLE public."Products" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price double precision NOT NULL,
    stock integer NOT NULL,
    condition character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    "userId" integer NOT NULL,
    "categoryId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Products";
       public         heap    postgres    false            �            1259    64303    Products_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Products_id_seq";
       public          postgres    false    217            
           0    0    Products_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;
          public          postgres    false    216            j           2604    64300    Categories id    DEFAULT     r   ALTER TABLE ONLY public."Categories" ALTER COLUMN id SET DEFAULT nextval('public."Categories_id_seq"'::regclass);
 >   ALTER TABLE public."Categories" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            k           2604    64307    Products id    DEFAULT     n   ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);
 <   ALTER TABLE public."Products" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                       0    64297 
   Categories 
   TABLE DATA           J   COPY public."Categories" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    215   �                 0    64304    Products 
   TABLE DATA           �   COPY public."Products" (id, name, description, price, stock, condition, image, "userId", "categoryId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    217   �                  0    0    Categories_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Categories_id_seq"', 13, true);
          public          postgres    false    214                       0    0    Products_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Products_id_seq"', 10, true);
          public          postgres    false    216            m           2606    64302    Categories Categories_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Categories" DROP CONSTRAINT "Categories_pkey";
       public            postgres    false    215            o           2606    64311    Products Products_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_pkey";
       public            postgres    false    217            p           2606    64312 !   Products Products_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Categories"(id) ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_categoryId_fkey";
       public          postgres    false    217    3181    215                �   x�}�K
AEѱY��_��
�Tp���YB��Ӻ�+=]����dbqH;t��R<UY��џD�K���
9��*,� .��<Á.��#��\H�D뵿�>�h@��mp��[�Dk˦l�WM������&R��=^-�yM�����	Z��H���C��`�5��}����[Mte"zp��         �  x�u��n�6���S��CJԷd (�$�l�|4qv/Z�e�J�BRv����P��k^�C:�:Yd�C�3?���3��=:�-��@
]]��k-��.�|��SIѷ��B�Rt��O�^�S�m4���xɟ������L����f�ͬ����-g����ݣ^��)Z	i�<��h�RT��Ij��:AL�������g�u�ƞ'���wݲ�R����R�^�*.��@W��T��$���Gqg^\�!�ɜ����Ɔ�k?�?����ďď9�<�~R�q�p��$%0Fȝ�����7�ܰ}p���F�隣�	"Lb�(�$����0�e8W�j9:�!?D�R8�-��_��Y�=�4m�.��G\�ƨ��VT����5��(;����]{p��T3����k�^�g >$��sV��VaBʪ��̳͛n���p��Aw�
��<J�4΂(N,�J�;��~��x��0v�<�l�4
��7L�)��J xBg>A�N��%��b�a�%�D���!^1�l�^K:��,0I�Y�7�\�C����bwm>'M*�&A�U�K�<	�ᨌ(��*�Y��gt1O�$�e��gyZ�,HhY�2�ɂT$��q�$r���*�$r�tWrm�F�s&:�Ao������#pҷ|4gm/��LY�#�UoU\���kY X�b�:�Q�{F&q�5]1ǥ��A�E�x��-nø\����o�U��.��>.+Y,$(�aJ� W�*V� �.�M@-��ĩI��|�$��m���):���|x3=�:�F������bv��.�\4���t0H^��Ф�B/-��v%k6��^>KjX-�����*o#�Wm�P���g�W�  �~g޺ǰ�����R�C���<:����_�5������ʥňO�l�QƱ�Ɏ�6�gƠ$C�g
Qg�a�^ �D�jo_�(K
�����@��H���4����m�6���;�h��m@�yi�yT��Y�_��I�Ϧ�1	�4�0�@����p&.��P�L�d6(�b*ja-�	,��M�Y�����\=Ǵ���m6��Iw�4�s[�ab��{q7��K�zƪIqb���8�����n�?3�6�2q�}4H��� :�N/��heF��D�������%��D��Ҷ�^H���yc���w�^���"}��/q��}�4v
6���E��JU��`8t`h��a��q�P(|���l�F�s%X}�8�]��;:8LA��Sl*(����%L�l��=��5���Bq�W��h��X�Ƽ������:9m ���ֆ�hJ�����ɼg��u�#�ﾛ��[���mo�oQx�%H��{t�U "D_��vK�&��s���VvҳJ���X����6�@��`z�96�ŽM�����^����&  �V�V^�gӇ�jN��z
U�p�����iV�p ��M���.F�8�܄�(ۦ�_�h4�@�t     