SET SERVEROUTPUT ON;
/*-------------------------------*/
--        Quan Ly Thu Vien      --
--        MSSV: B1809143        --
--       Nguyen Hoang Linh      --
/*-------------------------------*/
--------------------------------------------------------------------------------

/*------------------------------------*/
/*          TABLE TAC GIA             */
/*------------------------------------*/
CREATE TABLE TAC_GIA(
    TG_MA CHAR(5) NOT NULL,
    TG_TEN  NVARCHAR2(50) NOT NULL,
    CONSTRAINT PK_TAC_GIA PRIMARY KEY(TG_MA)
);
ALTER TABLE TAC_GIA 
    ADD CONSTRAINT VALID_TG_MA
        CHECK(REGEXP_LIKE(TG_MA,'^TG\d{3}'));
INSERT INTO TAC_GIA(TG_MA,TG_TEN) VALUES('TG001','Dale Carnegie');
INSERT INTO TAC_GIA(TG_MA,TG_TEN) VALUES('TG002','J.K Rowling');
INSERT INTO TAC_GIA(TG_MA,TG_TEN) VALUES('TG003',N'Nguyễn Duy Cần');
INSERT INTO TAC_GIA(TG_MA,TG_TEN) VALUES('TG004',N'Nguyên Phong');
INSERT INTO TAC_GIA(TG_MA,TG_TEN) VALUES('TG005',N'Yuval Noah Harari');
SELECT * FROM TAC_GIA;
/*------------------------------------*/
/*          TABLE THE LOAI            */
/*------------------------------------*/
CREATE TABLE THE_LOAI(
    TL_MA CHAR(5),
    TL_TEN NVARCHAR2(50) NOT NULL,
    CONSTRAINT PK_THE_LOAI PRIMARY KEY(TL_MA)
);
ALTER TABLE THE_LOAI 
    ADD CONSTRAINT VALID_TL_MA
        CHECK(REGEXP_LIKE(TL_MA,'^TL\d{3}$'));
INSERT INTO THE_LOAI(TL_MA,TL_TEN) VALUES('TL001',N'Kỹ năng sống');
INSERT INTO THE_LOAI(TL_MA,TL_TEN) VALUES('TL002',N'Tâm Linh');
INSERT INTO THE_LOAI(TL_MA,TL_TEN) VALUES('TL003',N'Khoa Học');
INSERT INTO THE_LOAI(TL_MA,TL_TEN) VALUES('TL004',N'Giả tưởng');
INSERT INTO THE_LOAI(TL_MA,TL_TEN) VALUES('TL005',N'Huyền bí');
INSERT INTO THE_LOAI(TL_MA,TL_TEN) VALUES('TL006',N'Lịch Sử');
SELECT * FROM THE_LOAI;
/*------------------------------------*/
/*         TABLE NHA XUAT BAN         */
/*------------------------------------*/
create table NHA_XUAT_BAN (
   NXB_MA CHAR(5),
   NXB_TEN NVARCHAR2(50) NOT NULL,
   NXB_DIACHI NVARCHAR2(200) NOT NULL,
   NXB_EMAIL VARCHAR2(100) NOT NULL,
   constraint PK_NHA_XUAT_BAN primary key (NXB_MA)
);
ALTER TABLE NHA_XUAT_BAN 
    ADD CONSTRAINT VALID_NXB_MA
        CHECK(REGEXP_LIKE(NXB_MA,'^NXB\d{2}$'));
ALTER TABLE NHA_XUAT_BAN 
    ADD CONSTRAINT VALID_NXB_EMAIL
        CHECK(REGEXP_LIKE(NXB_EMAIL,'^((\.|\w|\-)+)[^\.]@((\w|\-)+\.)+(\w|\-){2,4}$'));
INSERT INTO NHA_XUAT_BAN(NXB_MA,NXB_TEN,NXB_DIACHI,NXB_EMAIL) 
    VALUES('NXB01',N'FIRST NEW',
            N'11H Nguyễn Thị Minh Khai, Phường Bến Nghé, Quận 1, Tp. Hồ Chí Minh',
            'triviet@firstnews.com.vn');
INSERT INTO NHA_XUAT_BAN(NXB_MA,NXB_TEN,NXB_DIACHI,NXB_EMAIL) 
    VALUES('NXB02',N'Nhà xuất bản trẻ',
            N'161B Lý Chính Thắng, Phường 7, Quận 3, Thành phố Hồ Chí Minh.',
            'hopthubandoc@nxbtre.com.vn');
INSERT INTO NHA_XUAT_BAN(NXB_MA,NXB_TEN,NXB_DIACHI,NXB_EMAIL) 
    VALUES('NXB03',N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh',
            N'62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM',
            'tonghop@nxbhcm.com.vn');
INSERT INTO NHA_XUAT_BAN(NXB_MA,NXB_TEN,NXB_DIACHI,NXB_EMAIL) 
    VALUES('NXB04',N'Nhã Nam,',
            N'59 Đỗ Quang, KĐT Trung Hòa Nhân Chính, Cầu Giấy, Hà Nội',
            'bookstore@nhanam.vn'); 
INSERT INTO NHA_XUAT_BAN(NXB_MA,NXB_TEN,NXB_DIACHI,NXB_EMAIL) 
    VALUES('NXB05',N'Nhà xuất bản Tri Thức',
            N'53 Nguyễn Du, quận Hai Bà Trưng, Hà Nội, Việt Nam',
            'banbientap@nxbtrithuc.com.vn');             
Select * from nha_xuat_ban;
/*------------------------------------*/
/*            TABLE SACH              */
/*------------------------------------*/
CREATE TABLE SACH (
   SACH_MA CHAR(7),
   SACH_MATG CHAR(5) NOT NULL,
   SACH_MANXB CHAR(5) NOT NULL,
   SACH_MATL CHAR(5) NOT NULL,
   SACH_TEN NVARCHAR2(50) NOT NULL,
   SACH_NAMXUATBAN NUMBER(5),
   SACH_SOTRANG NUMBER(6) NOT NULL,
   SACH_MOTA NVARCHAR2(1000),
   constraint PK_SACH primary key (SACH_MA)
);

ALTER TABLE SACH ADD CONSTRAINT FK_SACH_TG
    FOREIGN KEY (SACH_MATG) REFERENCES TAC_GIA(TG_MA);
ALTER TABLE SACH ADD CONSTRAINT FK_SACH_NXB
    FOREIGN KEY (SACH_MANXB) REFERENCES NHA_XUAT_BAN(NXB_MA);
ALTER TABLE SACH ADD CONSTRAINT FK_SACH_TL
    FOREIGN KEY (SACH_MATL) REFERENCES THE_LOAI(TL_MA);
ALTER TABLE SACH ADD CONSTRAINT VALID_SACH_MA
    CHECK(REGEXP_LIKE(SACH_MA,'^S\d{6}$'));
    
INSERT INTO sach(SACH_MA,SACH_MATG, SACH_MANXB,SACH_MATL,
                SACH_TEN,SACH_NAMXUATBAN,SACH_SOTRANG,SACH_MOTA)
VALUES('S000001','TG001','NXB01','TL001',N'Đắc Nhân Tâm',1936,291,N'Quyển sách đưa ra các lời khuyên về cách thức cư xử, ứng xử và giao tiếp với mọi người để đạt được thành công trong cuộc sống ');
INSERT INTO sach(SACH_MA,SACH_MATG, SACH_MANXB,SACH_MATL,
                SACH_TEN,SACH_NAMXUATBAN,SACH_SOTRANG,SACH_MOTA)
VALUES('S000002','TG004','NXB01','TL002',N'Hành Trình Về Phương Đông',2015,256,N'Hành Trình Về Phương Đông mở ra một chân trời mới về Đông Tây gặp nhau, để khoa học Minh triết hội ngộ, để Hiện đại Cổ xưa giao duyên, để Đất Trời là một. Thế giới, vì vậy đã trở nên hài hòa hơn, rộng mở, diệu kỳ hơn và, do đó, nhân văn hơn.');
INSERT INTO sach(SACH_MA,SACH_MATG, SACH_MANXB,SACH_MATL,
                SACH_TEN,SACH_NAMXUATBAN,SACH_SOTRANG,SACH_MOTA)
VALUES('S000003','TG002','NXB02','TL004',N'Harry Potter và Hòn Đá Phù Thủy',2017,366,N'Khi một lá thư được gởi đến cho cậu bé Harry Potter bình thường và bất hạnh, cậu khám phá ra một bí mật đã được che giấu suốt cả một thập kỉ. Cha mẹ cậu chính là phù thủy và cả hai đã bị lời nguyền của Chúa tể Hắc ám giết hại khi Harry mới chỉ là một đứa trẻ, và bằng cách nào đó, cậu đã giữ được mạng sống của mình. Thoát khỏi những người giám hộ Muggle không thể chịu đựng nổi để nhập học vào trường Hogwarts, một trường đào tạo phù thủy với những bóng ma và phép thuật, Harry tình cờ dấn thân vào một cuộc phiêu lưu đầy gai góc khi cậu phát hiện ra một con chó ba đầu đang canh giữ một căn phòng trên tầng ba. Rồi Harry nghe nói đến một viên đá bị mất tích sở hữu những sức mạnh lạ kì, rất quí giá, vô cùng nguy hiểm, mà cũng có thể là mang cả hai đặc điểm trên.');
INSERT INTO sach(SACH_MA,SACH_MATG, SACH_MANXB,SACH_MATL,
                SACH_TEN,SACH_NAMXUATBAN,SACH_SOTRANG,SACH_MOTA)
VALUES('S000004','TG005','NXB05','TL006',N'Lược Sử Loài Người',2021,560,N'Sapiens là một câu chuyện lịch sử lớn về nền văn minh nhân loại – cách chúng ta phát triển từ xã hội săn bắt hái lượm thuở sơ khai đến cách chúng ta tổ chức xã hội và nền kinh tế ngày nay.');
INSERT INTO SACH (SACH_MA, SACH_MATG, SACH_MANXB, SACH_MATL,
                SACH_TEN, SACH_NAMXUATBAN, SACH_SOTRANG, SACH_MOTA) 
VALUES ('S000005', 'TG001', 'NXB01', 'TL001', N'Quẳng Gánh Lo Đi', '2016', '331', N'Bất kỳ ai đang sống đều sẽ có những lo lắng thường trực về học hành, công việc, những hoá đơn, chuyện nhà cửa,... Cuộc sống không dễ dàng giải thoát bạn khỏi căng thẳng, ngược lại, nếu quá lo lắng, bạn có thể mắc bệnh trầm cảm. Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn hãy khóa chặt dĩ vãng và tương lai lại để sống trong cái phòng kín mít của ngày hôm nay. Mọi vấn đề đều có thể được giải quyết, chỉ cần bạn bình tĩnh và xác định đúng hành động cần làm vào đúng thời điểm.');
/*------------------------------------*/
/*           TABLE DOC GIA            */
/*------------------------------------*/
create table DOC_GIA (
   DG_MA CHAR(7),
   DG_TEN NVARCHAR2(100) NOT NULL,
   DG_GIOITINH CHAR(1) NOT NULL,
   DG_DIACHI VARCHAR2(200) NOT NULL ,
   DG_DIENTHOAI VARCHAR2(11) NOT NULL UNIQUE,
   DG_NGAYSINH DATE NOT NULL,
   constraint PK_DOC_GIA primary key (DG_MA)
);
ALTER TABLE DOC_GIA ADD CONSTRAINT VALID_DG_MA
    CHECK(REGEXP_LIKE(DG_MA,'^DG\d{5}$'));
ALTER TABLE DOC_GIA ADD CONSTRAINT VALID_DG_GIOITINH
    CHECK(REGEXP_LIKE(DG_GIOITINH,'^(m|f|b)$'));
ALTER TABLE DOC_GIA ADD CONSTRAINT VALID_DG_DIENTHOAI
    CHECK(REGEXP_LIKE(DG_DIENTHOAI,'^0\d+$'));
---Create trigger before insert dob to table docgia    
CREATE OR REPLACE TRIGGER VALID_DG_NGAYSINH
    BEFORE INSERT OR UPDATE ON DOC_GIA
    FOR EACH ROW
BEGIN 
    IF(:new.DG_NGAYSINH > SYSDATE) THEN
        RAISE_APPLICATION_ERROR(-20000,'Ngay khong duoc lon hon ngay hien tai');
    END IF;
END;
INSERT INTO DOC_GIA VALUES('DG00001',N'Nguyễn Hoàng Linh','m',N'Cần Thơ','0123456789',DATE'2000-11-25');
INSERT INTO DOC_GIA VALUES('DG00002',N'Trần Văn A','m',N'Cần Thơ','013456789',date'2001-4-26');
INSERT INTO DOC_GIA VALUES('DG00003',N'Nguyễn Thị B','m',N'TP Hồ Chí Minh','093456785',date'1995-1-19');
/*------------------------------------*/
/*          TABLE THE THU VIEN        */
/*------------------------------------*/
CREATE TABLE THE_THU_VIEN (
    TTV_MA CHAR(7),
    TTV_MADG CHAR(7),
    TTV_NGAYBATDAU DATE DEFAULT SYSDATE NOT NULL,
    TTV_NGAYKETTHUC DATE NOT NULL,
    CONSTRAINT PK_THE_THU_VIEN
    PRIMARY KEY(TTV_MA)
);
ALTER TABLE THE_THU_VIEN
    ADD CONSTRAINT FK_TTV_DOCGIA
        FOREIGN KEY(TTV_MADG) REFERENCES DOC_GIA(DG_MA);
ALTER TABLE THE_THU_VIEN ADD CONSTRAINT VALID_TTV_MA
    CHECK(REGEXP_LIKE(TTV_MA,'^TTV\d{4}$'));
ALTER TABLE THE_THU_VIEN ADD CONSTRAINT VALID_TTV_NGAYKETTHUC
    CHECK(TTV_NGAYBATDAU < TTV_NGAYKETTHUC); 
INSERT INTO THE_THU_VIEN(TTV_MA,TTV_MADG,TTV_NGAYBATDAU,TTV_NGAYKETTHUC) VALUES('TTV0001','DG00001',date'2012-2-1',date'2025-12-1');
INSERT INTO THE_THU_VIEN(TTV_MA,TTV_MADG,TTV_NGAYBATDAU,TTV_NGAYKETTHUC) VALUES('TTV0002','DG00002',date'2013-1-1',date'2022-1-1');
INSERT INTO THE_THU_VIEN(TTV_MA,TTV_MADG,TTV_NGAYBATDAU,TTV_NGAYKETTHUC) VALUES('TTV0003','DG00003',date'2015-11-25',date'2023-5-21');
INSERT INTO THE_THU_VIEN(TTV_MA,TTV_MADG,TTV_NGAYBATDAU,TTV_NGAYKETTHUC) VALUES('TTV0004','DG00001',date'2012-2-15',date'2017-8-25');
/*------------------------------------*/
/*          TABLE NHAN VIEN           */
/*------------------------------------*/
create table NHAN_VIEN (
   NV_MA CHAR(5),
   NV_TEN NVARCHAR2(50) NOT NULL,
   NV_SDT VARCHAR2(11) NOT NULL UNIQUE,
   NV_GIOITINH CHAR(1) NOT NULL,
   NV_DIACHI NVARCHAR2(200) NOT NULL,
   NV_NGAYSINH DATE NOT NULL,
   constraint PK_NHAN_VIEN primary key (NV_MA)
);
ALTER TABLE NHAN_VIEN ADD CONSTRAINT VALID_NV_MA
    CHECK(REGEXP_LIKE(NV_MA,'^NV\d{3}$'));
ALTER TABLE NHAN_VIEN ADD CONSTRAINT VALID_NV_GIOITINH
    CHECK(REGEXP_LIKE(NV_GIOITINH,'^(m|f|b)$'));
ALTER TABLE NHAN_VIEN ADD CONSTRAINT VALID_NV_SDT
    CHECK(REGEXP_LIKE(NV_SDT,'^0\d+$'));
---Create trigger before insert dob to table docgia    
CREATE OR REPLACE TRIGGER VALID_NV_NGAYSINH
    BEFORE INSERT OR UPDATE ON NHAN_VIEN
    FOR EACH ROW
BEGIN 
    IF(:new.NV_NGAYSINH > SYSDATE) THEN
        RAISE_APPLICATION_ERROR(-20001,'Ngay sinh khong duoc lon hon ngay hien tai');
    END IF;
END;
INSERT INTO NHAN_VIEN(NV_MA,NV_TEN,NV_SDT,NV_GIOITINH,NV_DIACHI,NV_NGAYSINH) VALUES ('NV001',N'Huỳnh Thị Kiều Mil','0258145694','f',N'Hà Nội',date'1999-1-12');
INSERT INTO NHAN_VIEN(NV_MA,NV_TEN,NV_SDT,NV_GIOITINH,NV_DIACHI,NV_NGAYSINH) VALUES ('NV002',N'Võ Ngọc Thư','0258145695','f',N'Kiên Giang',date'2001-3-14');
INSERT INTO NHAN_VIEN(NV_MA,NV_TEN,NV_SDT,NV_GIOITINH,NV_DIACHI,NV_NGAYSINH) VALUES ('NV003',N'Lý Thiên Kiệt','0258145650','m',N'Bến Tre',date'2002-1-1');

/*------------------------------------*/
/*          TABLE MUON TRA            */
/*------------------------------------*/
CREATE TABLE MUON_TRA(
    MT_MA CHAR(7),
    MT_MA_NV CHAR(5) NOT NULL,
    MT_MA_TTV CHAR(7)NOT NULL,
    MT_NGAYMUON DATE DEFAULT SYSDATE NOT NULL ,
    CONSTRAINT PK_MUON_TRA PRIMARY KEY(MT_MA)
);
ALTER TABLE MUON_TRA 
    ADD CONSTRAINT FK_MT_NV
        FOREIGN KEY ( MT_MA_NV) REFERENCES NHAN_VIEN(NV_MA); 
ALTER TABLE MUON_TRA 
    ADD CONSTRAINT FK_MT_TTV
        FOREIGN KEY ( MT_MA_TTV) REFERENCES THE_THU_VIEN(TTV_MA);
ALTER TABLE MUON_TRA ADD CONSTRAINT VALID_MT_MA
    CHECK(REGEXP_LIKE(MT_MA,'^MT\d{5}$'));
--TRIGGER valid expried date ttv
CREATE OR REPLACE TRIGGER VALID_EXIRED_DATE_TTV
    BEFORE INSERT OR UPDATE ON MUON_TRA
    FOR EACH ROW
DECLARE
    EXPIRED_DATE DATE ;
BEGIN
    SELECT TTV_NGAYKETTHUC INTO EXPIRED_DATE 
    FROM THE_THU_VIEN 
    WHERE :NEW.MT_MA_TTV = TTV_MA;
    IF(SYSDATE > EXPIRED_DATE) THEN
        RAISE_APPLICATION_ERROR(-20001,'THE THU VIEN '|| :NEW.MT_MA_TTV||' DA HET HAN');
    END IF;
END;
INSERT INTO MUON_TRA(MT_MA,MT_MA_NV,MT_MA_TTV,MT_NGAYMUON)
    VALUES('MT00001','NV001','TTV0001',date'2018-1-4');
INSERT INTO MUON_TRA(MT_MA,MT_MA_NV,MT_MA_TTV,MT_NGAYMUON)
    VALUES('MT00002','NV002','TTV0002',date'2018-1-04');
INSERT INTO MUON_TRA(MT_MA,MT_MA_NV,MT_MA_TTV,MT_NGAYMUON)
    VALUES('MT00003','NV001','TTV0003',date'2019-02-04');
INSERT INTO MUON_TRA(MT_MA,MT_MA_NV,MT_MA_TTV,MT_NGAYMUON)
    VALUES('MT00004','NV001','TTV0001',date'2018-1-25');
--TEST TRIGGER VALID EXPIRED DATE WITH VALUE TTV0004 TTV_NGAYKETTHUC< SYSTEM DATE
INSERT INTO MUON_TRA(MT_MA,MT_MA_NV,MT_MA_TTV,MT_NGAYMUON)
    VALUES('MT00004','NV001','TTV0004',date'2019-02-04');
/*------------------------------------*/
/*     TABLE CHI TIET MUON TRA        */
/*------------------------------------*/
CREATE TABLE CT_MUON_TRA(
    CT_MT_MA CHAR(7),
    CT_SACH_MA CHAR(7) NOT NULL,
    CT_TRANGTHAI NUMBER(1) NOT NULL,
    CT_NGAYTRA DATE NOT NULL,
    CT_GHICHU NVARCHAR2(200),
    CONSTRAINT PK_CT_MUON_TRA PRIMARY KEY (CT_MT_MA,CT_SACH_MA)
);
ALTER TABLE CT_MUON_TRA 
    ADD CONSTRAINT FK_CT_MT 
        FOREIGN KEY (CT_MT_MA) REFERENCES MUON_TRA(MT_MA);
ALTER TABLE CT_MUON_TRA 
    ADD CONSTRAINT FK_CT_SACH 
        FOREIGN KEY (CT_SACH_MA) REFERENCES SACH(SACH_MA);
--TRANG THAI 0 : DANG MUON
--TRANG THAI 1 : DA TRA
ALTER TABLE CT_MUON_TRA ADD CONSTRAINT VALID_CT_TRANGTHAI
    CHECK(REGEXP_LIKE(CT_TRANGTHAI,'(0|1)'));
CREATE OR REPLACE TRIGGER VALID_CT_NGAYTRA
    BEFORE INSERT OR UPDATE  ON CT_MUON_TRA
    FOR EACH ROW
DECLARE 
    NGAY_MUON DATE;
BEGIN
    SELECT MT_NGAYMUON INTO NGAY_MUON
    FROM MUON_TRA 
    WHERE MT_MA = :NEW.CT_MT_MA;
    IF (:NEW.CT_NGAYTRA < NGAY_MUON) THEN
        RAISE_APPLICATION_ERROR(-20001,'NGAY TRA NHO HON NGAY MUON ');
    END IF;
END;
--TRIGGER SACH DANG MUON 
CREATE OR REPLACE TRIGGER VALID_CT_SACH_MUON
    BEFORE INSERT ON CT_MUON_TRA
    FOR EACH ROW
DECLARE 
    TRANG_THAI_SACH ct_muon_tra.ct_trangthai%TYPE;
    SO_DONG NUMBER;
BEGIN
    SELECT COUNT(*) INTO  SO_DONG 
    FROM ct_muon_tra 
    WHERE :NEW.CT_SACH_MA = ct_sach_ma;
    IF(SO_DONG > 0) THEN
        BEGIN
            SELECT CT_TRANGTHAI INTO  TRANG_THAI_SACH 
            FROM ct_muon_tra 
            WHERE :NEW.CT_SACH_MA = ct_sach_ma;
            IF(TRANG_THAI_SACH = 0) THEN
                RAISE_APPLICATION_ERROR(-20001,'SACH CO MA SO '||:NEW.CT_SACH_MA||' DANG DUOC NGUOI KHAC MUON');
            END IF;
        END; 
    END IF;
END;
INSERT INTO CT_MUON_TRA(CT_MT_MA,CT_SACH_MA,CT_TRANGTHAI,CT_NGAYTRA)
    VALUES('MT00001','S000001',0,date'2019-01-04');
INSERT INTO CT_MUON_TRA(CT_MT_MA,CT_SACH_MA,CT_TRANGTHAI,CT_NGAYTRA)
    VALUES('MT00001','S000002',0,date'2019-01-04');
INSERT INTO CT_MUON_TRA(CT_MT_MA,CT_SACH_MA,CT_TRANGTHAI,CT_NGAYTRA)
    VALUES('MT00002','S000003',0,date'2020-1-04');
--update S000005 đã được trả
UPDATE CT_MUON_TRA SET CT_TRANGTHAI = 1 WHERE CT_MT_MA = 'MT00002' AND CT_SACH_MA = 'S000003';
------------------------
INSERT INTO CT_MUON_TRA(CT_MT_MA,CT_SACH_MA,CT_TRANGTHAI,CT_NGAYTRA)
    VALUES('MT00003','S000004',0,date'2020-1-4');
INSERT INTO CT_MUON_TRA(CT_MT_MA,CT_SACH_MA,CT_TRANGTHAI,CT_NGAYTRA)
    VALUES('MT00004','S000005',0,date'2019-2-25');
INSERT INTO CT_MUON_TRA(CT_MT_MA,CT_SACH_MA,CT_TRANGTHAI,CT_NGAYTRA)
    VALUES('MT00004','S000003',0,date'2019-2-25');
---test trigger s000003 da duoc dang muon nen khong the insert 
INSERT INTO CT_MUON_TRA(CT_MT_MA,CT_SACH_MA,CT_TRANGTHAI,CT_NGAYTRA)
    VALUES('MT00003','S000002',0,date'2020-1-04');
-------------------------PROCEDURES----------------------------------------
---procedure 1 liet ke nhung quyen sach dang muon cua doc gia voi id
CREATE OR REPLACE PROCEDURE list_books_via_ma_docgia (
   ma_dg in char
)
is 
    cursor results is 
        select dg_ten,ttv_ma,ttv_ngaybatdau,ttv_ngayketthuc,sach_ten 
        from (((doc_gia join the_thu_vien on doc_gia.dg_ma = the_thu_vien.ttv_madg)
            join muon_tra on the_thu_vien.ttv_ma = muon_tra.mt_ma_ttv)
            join ct_muon_tra on muon_tra.mt_ma = ct_muon_tra.ct_mt_ma)
            join sach on ct_muon_tra.ct_sach_ma = sach.sach_ma
        where doc_gia.dg_ma = ma_dg 
            and ct_muon_tra.ct_trangthai = 0; 
    row_results results%ROWTYPE;
    i number := 0;
begin
    open results;
    loop
        fetch results into row_results;
        exit when results%notfound;
        dbms_output.put_line(i||'|'||row_results.dg_ten||'|'||row_results.ttv_ma||'|'||row_results.ttv_ngaybatdau||'|'||row_results.ttv_ngayketthuc||'|'||row_results.sach_ten);
        i := i+1;
    end loop;
end;
execute list_books_via_ma_docgia('DG00001');
-------liet ket doc gia muon sach nhieu
create or replace procedure thong_ke_dg_muon_sach_nhieu
is
    max_so_lan_muon number:= 0;
    cursor thong_ke_dg_cursor is
    select dg.dg_ten,count(dg.dg_ma) so_lan_muon
    from (muon_tra mt
        join the_thu_vien ttv on mt.mt_ma_ttv = ttv.ttv_ma)
        join doc_gia dg on ttv.ttv_madg = dg.dg_ma
    group by dg.dg_ten
    order by so_lan_muon desc,dg_ten asc;
    thong_ke_dg_cursor_row thong_ke_dg_cursor%rowtype;
begin
    select count(dg.dg_ma) so_lan_muon into max_so_lan_muon
    from (muon_tra mt
        join the_thu_vien ttv on mt.mt_ma_ttv = ttv.ttv_ma)
        join doc_gia dg on ttv.ttv_madg = dg.dg_ma
    group by dg.dg_ten
    order by so_lan_muon desc,dg_ten asc
    fetch first 1 rows only;
    
    open thong_ke_dg_cursor;
    loop
        fetch thong_ke_dg_cursor into thong_ke_dg_cursor_row;
        exit when thong_ke_dg_cursor%notfound;
        if thong_ke_dg_cursor_row.so_lan_muon = max_so_lan_muon then
            dbms_output.put_line(thong_ke_dg_cursor_row.dg_ten||'|'||thong_ke_dg_cursor_row.so_lan_muon);
        end if;
    end loop;
    close thong_ke_dg_cursor;
end;
execute thong_ke_dg_muon_sach_nhieu;
----------------------------------FUNCTIONS------------------------------------
--function lấy  trạng thái quyển sách
--đang mượn hoặc trả
create or replace function lay_trang_thai_sach(
    ma_sach char
)
return varchar2
is 
    status number(1);
    has_book number := 0;
begin
--  Kiểm tra mã sách có hợp lệ hay không
    select count(*) into has_book
    from sach
    where sach.sach_ma = ma_sach;
    if has_book != 0 then
        begin 
            select ct.ct_trangthai into status
            from sach s
                inner join ct_muon_tra ct on s.sach_ma = ct.ct_sach_ma
            where 
            s.sach_ma = ma_sach
            and 
            ct.ct_trangthai = 0;
            if status = 0 then
                return n'đang mượn';
            else 
                return n'đang sẵn sàng';
            end if;
            exception 
                when no_data_found then
                    return n'đang sẵn sàng';
        end;
    else 
        raise_application_error(-20000,'ma so sach dua vao khong hop le');
    end if;
end;
--test function lay_trang_thai_sach
declare 
begin 
    dbms_output.put_line('ma so sach : S000003 '||lay_trang_thai_sach('S000003'));
    dbms_output.put_line('ma so sach : S000005 '||lay_trang_thai_sach('S000005'));
end;
---function liet ke cac quyen sach dang hoach da tra dang muon trong khoang thoi gian 
create or replace function liet_ke_sach_muon_theo_thoi_gian(
    ngay_bat_dau date,
    ngay_ket_thuc date
)
return varchar2
is  
    danh_sach_sach_string varchar2(2000) := '';
    cursor danh_sach_sach is
        select  s.sach_ten,count(s.sach_ma) so_lan
        from (muon_tra mt 
            join ct_muon_tra ct on mt.mt_ma = ct.ct_mt_ma)
            join sach s on ct.ct_sach_ma = s.sach_ma
        where 
            mt.mt_ngaymuon <=  ngay_ket_thuc
            and
            mt.mt_ngaymuon >= ngay_bat_dau
        group by s.sach_ten;
begin 
    for row_sach in danh_sach_sach
        loop
            danh_sach_sach_string := concat(danh_sach_sach_string,row_sach.sach_ten ||'| số lần mượn: '||row_sach.so_lan|| chr(10));
        end loop;
    return danh_sach_sach_string;
end;
-- test function liet_ke_sach_muon_theo_tg
declare
    ngay_bat_dau date := date'2018-1-1';
    ngay_ket_thuc date := date'2019-1-25';
begin
    dbms_output.put_line('Những quyển sách đang mượn trong khoảng thời gian '||ngay_bat_dau||' đến ngày ' ||ngay_ket_thuc);
    dbms_output.put_line('-------------------------------------------------------------------------------------------');
    dbms_output.put_line(liet_ke_sach_muon_theo_thoi_gian(ngay_bat_dau,ngay_ket_thuc));
end;
------------------------------administrators oracle-----------------------------
grant select on tac_gia to b1809155;
grant select on nha_xuat_ban to b1809155;
grant select on the_loai to b1809155;
grant select on sach to b1809155;
grant select on doc_gia to b1809155;
grant select on nhan_vien to b1809155;
grant select on muon_tra to b1809155;
grant select on ct_muon_tra to b1809155;
grant select on the_thu_vien to b1809155;
grant execute on list_books_via_ma_docgia to b1809155;
grant execute on thong_ke_dg_muon_sach_nhieu to b1809155;
grant execute on lay_trang_thai_sach to b1809155;
grant execute on liet_ke_sach_muon_theo_tg to b1809155;