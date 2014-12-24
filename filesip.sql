/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/22/2014 7:14:22 PM                        */
/*==============================================================*/


drop table if exists CUSTOMER;

drop table if exists JADWAL;

drop table if exists PEKERJA;

drop table if exists PEMBERSIHAN_RUMAH;

drop table if exists PERBAIKAN_RUMAH;

drop table if exists TRANSAKSI_PEMBERSIHAN;

drop table if exists TRANSAKSI_PERBAIKAN;

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER
(
   ID_CUSTOMER          varchar(5) not null,
   ID_TRANSAKSI         varchar(5),
   ID_TRANSAKSIPEMBERSIHAN varchar(5),
   NAMA_CUSTOMER        varchar(25),
   PASSWORD             varchar(25),
   EMAIL                varchar(25),
   JENIS_KELAMIN        varchar(25),
   TTL_CUSTOMER         varchar(25),
   ALAMAT               varchar(25),
   KODE_POS             varchar(25),
   SOSIAL_MEDIA         varchar(25),
   primary key (ID_CUSTOMER)
);

/*==============================================================*/
/* Table: JADWAL                                                */
/*==============================================================*/
create table JADWAL
(
   ID_JADWAL            varchar(5) not null,
   ID_TRANSAKSI         varchar(5),
   ID_TRANSAKSIPEMBERSIHAN varchar(5),
   SEKALI               date,
   HARIAN               date,
   MINGGUAN             date,
   BULANAN              date,
   LOKASI               varchar(15),
   primary key (ID_JADWAL)
);

/*==============================================================*/
/* Table: PEKERJA                                               */
/*==============================================================*/
create table PEKERJA
(
   ID_PEKERJA           varchar(5) not null,
   NAMA_PEKERJA         varchar(25),
   ALAMAT_PEKERJA       varchar(25),
   KODEPOS_PEKERJA      varchar(10),
   TELEPON_RUMAH        varchar(20),
   DESKRIPSI_PEKERJA    varchar(100),
   FOTO_PEKERJA         longblob,
   TTL_PEKERJA          varchar(25),
   primary key (ID_PEKERJA)
);

/*==============================================================*/
/* Table: PEMBERSIHAN_RUMAH                                     */
/*==============================================================*/
create table PEMBERSIHAN_RUMAH
(
   ID_PEMBERSIHAN       varchar(5) not null,
   RUANG_TAMU           varchar(10),
   RUANG_TIDUR          varchar(10),
   KAMAR_MANDI          varchar(10),
   DAPUR_RUANGMAKAN     varchar(10),
   GARASI_GUDANG        varchar(10),
   TAMAN                varchar(10),
   KOLAMRNG_KOLAMIKAN   varchar(10),
   primary key (ID_PEMBERSIHAN)
);

/*==============================================================*/
/* Table: PERBAIKAN_RUMAH                                       */
/*==============================================================*/
create table PERBAIKAN_RUMAH
(
   ID_PERBAIKAN         varchar(5) not null,
   PERBAIKAN_GENTENG    varchar(5),
   PERBAIKAN_LEDENG     varchar(5),
   PERBAIKAN_PLAFON     varchar(5),
   PERBAIKAN_LANTAI     varchar(5),
   PERBAIKAN_KUSEN      varchar(5),
   primary key (ID_PERBAIKAN)
);

/*==============================================================*/
/* Table: TRANSAKSI_PEMBERSIHAN                                 */
/*==============================================================*/
create table TRANSAKSI_PEMBERSIHAN
(
   ID_TRANSAKSIPEMBERSIHAN varchar(5) not null,
   ID_CUSTOMER          varchar(5),
   ID_JADWAL            varchar(5),
   ID_PEKERJA           varchar(5),
   ID_PEMBERSIHAN       varchar(5),
   TOTALHARGA_PEMBERSIHAN int,
   primary key (ID_TRANSAKSIPEMBERSIHAN)
);

/*==============================================================*/
/* Table: TRANSAKSI_PERBAIKAN                                   */
/*==============================================================*/
create table TRANSAKSI_PERBAIKAN
(
   ID_TRANSAKSI         varchar(5) not null,
   ID_CUSTOMER          varchar(5),
   ID_PERBAIKAN         varchar(5),
   ID_JADWAL            varchar(5),
   ID_PEKERJA           varchar(5),
   TOTAL_HARGA          int,
   primary key (ID_TRANSAKSI)
);

alter table CUSTOMER add constraint FK_RELATIONSHIP_14 foreign key (ID_TRANSAKSI)
      references TRANSAKSI_PERBAIKAN (ID_TRANSAKSI) on delete restrict on update restrict;

alter table CUSTOMER add constraint FK_RELATIONSHIP_16 foreign key (ID_TRANSAKSIPEMBERSIHAN)
      references TRANSAKSI_PEMBERSIHAN (ID_TRANSAKSIPEMBERSIHAN) on delete restrict on update restrict;

alter table JADWAL add constraint FK_RELATIONSHIP_10 foreign key (ID_TRANSAKSI)
      references TRANSAKSI_PERBAIKAN (ID_TRANSAKSI) on delete restrict on update restrict;

alter table JADWAL add constraint FK_RELATIONSHIP_12 foreign key (ID_TRANSAKSIPEMBERSIHAN)
      references TRANSAKSI_PEMBERSIHAN (ID_TRANSAKSIPEMBERSIHAN) on delete restrict on update restrict;

alter table TRANSAKSI_PEMBERSIHAN add constraint FK_RELATIONSHIP_13 foreign key (ID_JADWAL)
      references JADWAL (ID_JADWAL) on delete restrict on update restrict;

alter table TRANSAKSI_PEMBERSIHAN add constraint FK_RELATIONSHIP_17 foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER) on delete restrict on update restrict;

alter table TRANSAKSI_PEMBERSIHAN add constraint FK_RELATIONSHIP_7 foreign key (ID_PEMBERSIHAN)
      references PEMBERSIHAN_RUMAH (ID_PEMBERSIHAN) on delete restrict on update restrict;

alter table TRANSAKSI_PEMBERSIHAN add constraint FK_RELATIONSHIP_8 foreign key (ID_PEKERJA)
      references PEKERJA (ID_PEKERJA) on delete restrict on update restrict;

alter table TRANSAKSI_PERBAIKAN add constraint FK_RELATIONSHIP_11 foreign key (ID_JADWAL)
      references JADWAL (ID_JADWAL) on delete restrict on update restrict;

alter table TRANSAKSI_PERBAIKAN add constraint FK_RELATIONSHIP_15 foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER) on delete restrict on update restrict;

alter table TRANSAKSI_PERBAIKAN add constraint FK_RELATIONSHIP_2 foreign key (ID_PERBAIKAN)
      references PERBAIKAN_RUMAH (ID_PERBAIKAN) on delete restrict on update restrict;

alter table TRANSAKSI_PERBAIKAN add constraint FK_RELATIONSHIP_9 foreign key (ID_PEKERJA)
      references PEKERJA (ID_PEKERJA) on delete restrict on update restrict;

