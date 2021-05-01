/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     04/24/2021 6:47:08 PM                        */
/*==============================================================*/


alter table CT_MUON_TRA
   drop constraint FK_CT_MUON__MT_CT_MUON_TRA;

alter table CT_MUON_TRA
   drop constraint FK_CT_MUON__SACH_CT_SACH;

alter table MUON_TRA
   drop constraint FK_MUON_TRA_NV_MT_NHAN_VIE;

alter table MUON_TRA
   drop constraint FK_MUON_TRA_TTV_MT_THE_THU_;

alter table SACH
   drop constraint FK_SACH_SACH_NXB_NHA_XUAT;

alter table SACH
   drop constraint FK_SACH_SACH_TG_TAC_GIA;

alter table SACH
   drop constraint FK_SACH_SACH_TL_THE_LOAI;

alter table THE_THU_VIEN
   drop constraint FK_THE_THU__DG_TTV_DOC_GIA;

drop index SACH_CT_FK;

drop index MT_CT_FK;

drop table CT_MUON_TRA cascade constraints;

drop table DOC_GIA cascade constraints;

drop index TTV_MT_FK;

drop index NV_MT_FK;

drop table MUON_TRA cascade constraints;

drop table NHAN_VIEN cascade constraints;

drop table NHA_XUAT_BAN cascade constraints;

drop index SACH_TL_FK;

drop index SACH_TG_FK;

drop index SACH_NXB_FK;

drop table SACH cascade constraints;

drop table TAC_GIA cascade constraints;

drop table THE_LOAI cascade constraints;

drop index DG_TTV_FK;

drop table THE_THU_VIEN cascade constraints;

/*==============================================================*/
/* Table: CT_MUON_TRA                                           */
/*==============================================================*/
create table CT_MUON_TRA 
(
   MT_MA                CHAR(7)              not null,
   SACH_MA              CHAR(7)              not null,
   CT_TRANGTHAI         NUMBER(1)            not null,
   CT_NGAYTRA           DATE                 not null,
   CT_GHI_CHU           VARCHAR2(200),
   constraint PK_CT_MUON_TRA primary key (MT_MA, SACH_MA)
);

/*==============================================================*/
/* Index: MT_CT_FK                                              */
/*==============================================================*/
create index MT_CT_FK on CT_MUON_TRA (
   MT_MA ASC
);

/*==============================================================*/
/* Index: SACH_CT_FK                                            */
/*==============================================================*/
create index SACH_CT_FK on CT_MUON_TRA (
   SACH_MA ASC
);

/*==============================================================*/
/* Table: DOC_GIA                                               */
/*==============================================================*/
create table DOC_GIA 
(
   DG_MA                CHAR(7)              not null,
   DG_TEN               VARCHAR2(100)        not null,
   DG_GIOITINH          CHAR(1)              not null,
   DG_DIACHI            VARCHAR2(200)        not null,
   DG_DIENTHOAI         VARCHAR2(11)         not null,
   DG_NGAYSINH          DATE                 not null,
   constraint PK_DOC_GIA primary key (DG_MA)
);

/*==============================================================*/
/* Table: MUON_TRA                                              */
/*==============================================================*/
create table MUON_TRA 
(
   MT_MA                CHAR(7)              not null,
   NV_MA                CHAR(5)              not null,
   TTV_MA               CHAR(7)              not null,
   MT_NGAYMUON          DATE,
   constraint PK_MUON_TRA primary key (MT_MA)
);

/*==============================================================*/
/* Index: NV_MT_FK                                              */
/*==============================================================*/
create index NV_MT_FK on MUON_TRA (
   NV_MA ASC
);

/*==============================================================*/
/* Index: TTV_MT_FK                                             */
/*==============================================================*/
create index TTV_MT_FK on MUON_TRA (
   TTV_MA ASC
);

/*==============================================================*/
/* Table: NHAN_VIEN                                             */
/*==============================================================*/
create table NHAN_VIEN 
(
   NV_MA                CHAR(5)              not null,
   NV_TEN               VARCHAR2(50)         not null,
   NV_SDT               VARCHAR2(11)         not null,
   NV_GIOITINH          CHAR(1)              not null,
   NV_DIACHI            VARCHAR2(200)        not null,
   NV_NGAYSINH          DATE                 not null,
   constraint PK_NHAN_VIEN primary key (NV_MA)
);

/*==============================================================*/
/* Table: NHA_XUAT_BAN                                          */
/*==============================================================*/
create table NHA_XUAT_BAN 
(
   NXB_MA               CHAR(5)              not null,
   NXB_TEN              VARCHAR2(50)         not null,
   NXB_DIACHI           VARCHAR2(200),
   NXB_EMAIL            VARCHAR2(100)        not null,
   constraint PK_NHA_XUAT_BAN primary key (NXB_MA)
);

/*==============================================================*/
/* Table: SACH                                                  */
/*==============================================================*/
create table SACH 
(
   SACH_MA              CHAR(7)              not null,
   TG_MA                CHAR(5)              not null,
   NXB_MA               CHAR(5)              not null,
   TL_MA                CHAR(5)              not null,
   SACH_TEN             VARCHAR2(50)         not null,
   SACH_NAMXUATBAN      NUMBER(5),
   SACH_SOTRANG         NUMBER(6)            not null,
   SACH_MOTA            VARCHAR2(1000),
   constraint PK_SACH primary key (SACH_MA)
);

/*==============================================================*/
/* Index: SACH_NXB_FK                                           */
/*==============================================================*/
create index SACH_NXB_FK on SACH (
   NXB_MA ASC
);

/*==============================================================*/
/* Index: SACH_TG_FK                                            */
/*==============================================================*/
create index SACH_TG_FK on SACH (
   TG_MA ASC
);

/*==============================================================*/
/* Index: SACH_TL_FK                                            */
/*==============================================================*/
create index SACH_TL_FK on SACH (
   TL_MA ASC
);

/*==============================================================*/
/* Table: TAC_GIA                                               */
/*==============================================================*/
create table TAC_GIA 
(
   TG_MA                CHAR(5)              not null,
   TG_TEN               VARCHAR2(50)         not null,
   constraint PK_TAC_GIA primary key (TG_MA)
);

/*==============================================================*/
/* Table: THE_LOAI                                              */
/*==============================================================*/
create table THE_LOAI 
(
   TL_MA                CHAR(5)              not null,
   TL_TEN               VARCHAR2(50)         not null,
   constraint PK_THE_LOAI primary key (TL_MA)
);

/*==============================================================*/
/* Table: THE_THU_VIEN                                          */
/*==============================================================*/
create table THE_THU_VIEN 
(
   TTV_MA               CHAR(7)              not null,
   DG_MA                CHAR(7)              not null,
   TTV_NGAYBATDAU       DATE                 not null,
   TTV_NGAYKETTHUC      DATE                 not null,
   constraint PK_THE_THU_VIEN primary key (TTV_MA)
);

/*==============================================================*/
/* Index: DG_TTV_FK                                             */
/*==============================================================*/
create index DG_TTV_FK on THE_THU_VIEN (
   DG_MA ASC
);

alter table CT_MUON_TRA
   add constraint FK_CT_MUON__MT_CT_MUON_TRA foreign key (MT_MA)
      references MUON_TRA (MT_MA);

alter table CT_MUON_TRA
   add constraint FK_CT_MUON__SACH_CT_SACH foreign key (SACH_MA)
      references SACH (SACH_MA);

alter table MUON_TRA
   add constraint FK_MUON_TRA_NV_MT_NHAN_VIE foreign key (NV_MA)
      references NHAN_VIEN (NV_MA);

alter table MUON_TRA
   add constraint FK_MUON_TRA_TTV_MT_THE_THU_ foreign key (TTV_MA)
      references THE_THU_VIEN (TTV_MA);

alter table SACH
   add constraint FK_SACH_SACH_NXB_NHA_XUAT foreign key (NXB_MA)
      references NHA_XUAT_BAN (NXB_MA);

alter table SACH
   add constraint FK_SACH_SACH_TG_TAC_GIA foreign key (TG_MA)
      references TAC_GIA (TG_MA);

alter table SACH
   add constraint FK_SACH_SACH_TL_THE_LOAI foreign key (TL_MA)
      references THE_LOAI (TL_MA);

alter table THE_THU_VIEN
   add constraint FK_THE_THU__DG_TTV_DOC_GIA foreign key (DG_MA)
      references DOC_GIA (DG_MA);

