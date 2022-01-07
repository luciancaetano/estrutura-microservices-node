/*
 Navicat PostgreSQL Data Transfer

 Source Server         : pg
 Source Server Type    : PostgreSQL
 Source Server Version : 140001
 Source Host           : localhost:5432
 Source Catalog        : nfe-processamento
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140001
 File Encoding         : 65001

 Date: 07/01/2022 17:47:59
*/


-- ----------------------------
-- Type structure for NotasFiscais_status_enum
-- ----------------------------
DROP TYPE IF EXISTS "public"."NotasFiscais_status_enum";
CREATE TYPE "public"."NotasFiscais_status_enum" AS ENUM (
  '0',
  '1',
  '2',
  '3'
);
ALTER TYPE "public"."NotasFiscais_status_enum" OWNER TO "postgres";

-- ----------------------------
-- Type structure for e_status_enum
-- ----------------------------
DROP TYPE IF EXISTS "public"."e_status_enum";
CREATE TYPE "public"."e_status_enum" AS ENUM (
  '0',
  '1',
  '2',
  '3'
);
ALTER TYPE "public"."e_status_enum" OWNER TO "postgres";

-- ----------------------------
-- Type structure for notas_fiscais_status_enum
-- ----------------------------
DROP TYPE IF EXISTS "public"."notas_fiscais_status_enum";
CREATE TYPE "public"."notas_fiscais_status_enum" AS ENUM (
  '0',
  '1',
  '2',
  '3'
);
ALTER TYPE "public"."notas_fiscais_status_enum" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for notas_ficais_duplicatas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."notas_ficais_duplicatas_id_seq";
CREATE SEQUENCE "public"."notas_ficais_duplicatas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for notas_fiscais_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."notas_fiscais_id_seq";
CREATE SEQUENCE "public"."notas_fiscais_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for notas_ficais_duplicatas
-- ----------------------------
DROP TABLE IF EXISTS "public"."notas_ficais_duplicatas";
CREATE TABLE "public"."notas_ficais_duplicatas" (
  "id" int4 NOT NULL DEFAULT nextval('notas_ficais_duplicatas_id_seq'::regclass),
  "parcela" int4 NOT NULL,
  "valor" int8 NOT NULL,
  "dataVencimento" timestamp(6) NOT NULL,
  "notalFiscalId" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for notas_fiscais
-- ----------------------------
DROP TABLE IF EXISTS "public"."notas_fiscais";
CREATE TABLE "public"."notas_fiscais" (
  "id" int4 NOT NULL DEFAULT nextval('notas_fiscais_id_seq'::regclass),
  "numero" int4,
  "dhRegistro" timestamp(6),
  "processadoEm" timestamp(6),
  "nomeEmitente" varchar(1024) COLLATE "pg_catalog"."default",
  "nomeDestinatario" varchar(1024) COLLATE "pg_catalog"."default",
  "valorNota" int8,
  "erro" bool NOT NULL,
  "arquivoNome" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "status" "public"."notas_fiscais_status_enum" NOT NULL
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."notas_ficais_duplicatas_id_seq"
OWNED BY "public"."notas_ficais_duplicatas"."id";
SELECT setval('"public"."notas_ficais_duplicatas_id_seq"', 127, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."notas_fiscais_id_seq"
OWNED BY "public"."notas_fiscais"."id";
SELECT setval('"public"."notas_fiscais_id_seq"', 239, true);

-- ----------------------------
-- Uniques structure for table notas_ficais_duplicatas
-- ----------------------------
ALTER TABLE "public"."notas_ficais_duplicatas" ADD CONSTRAINT "REL_66b61b9e9b03a20debc135cc65" UNIQUE ("notalFiscalId");

-- ----------------------------
-- Primary Key structure for table notas_ficais_duplicatas
-- ----------------------------
ALTER TABLE "public"."notas_ficais_duplicatas" ADD CONSTRAINT "PK_bdeccb98ac49f1e9d574eaa3113" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table notas_fiscais
-- ----------------------------
ALTER TABLE "public"."notas_fiscais" ADD CONSTRAINT "PK_c7dcf62527c4f388d8494aa5f55" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table notas_ficais_duplicatas
-- ----------------------------
ALTER TABLE "public"."notas_ficais_duplicatas" ADD CONSTRAINT "FK_66b61b9e9b03a20debc135cc658" FOREIGN KEY ("notalFiscalId") REFERENCES "public"."notas_fiscais" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
