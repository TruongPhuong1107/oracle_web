create table SANPHAM(
    MASP NUMBER GENERATED by default on null as IDENTITY,
     TENSP NVARCHAR2(50),
     DONGIA NUMBER,
     HINH NVARCHAR2(50),
     HINH_RONG NVARCHAR2(50),
     MALOAI NUMBER,
     MOTA NVARCHAR2(500),
     NGAYLAP NVARCHAR2(50),
     TRANGTHAI NUMBER,
 PRIMARY KEY (MASP)
);
drop table SANPHAM
create table CHITIETMAU(
   MASP NUMBER NOT NULL,
   mamau number not null,
    PRIMARY KEY(MASP,mamau)
);
create table MAU(
    MAMAU NUMBER GENERATED by default on null as IDENTITY,
    TENMAU NVARCHAR2(100)NOT NULL,
    PRIMARY KEY(MAMAU)
);
drop table SANPHAM;
create table LOAI(
    MALOAI NUMBER GENERATED by default on null as IDENTITY,
    TENLOAI NVARCHAR2(50)NOT NULL,
    PRIMARY KEY(MALOAI)
);
drop table sanpham
create table TAIKHOAN(
    MATK NUMBER GENERATED by default on null as IDENTITY,
    TENCHUTK NVARCHAR2(50),
    SDT INT,
    EMAIL VARCHAR(50),
    DIACHI NVARCHAR2(50),
    NGAYSINH NVARCHAR2(50),
    TENDN NVARCHAR2(50) ,
    MATKHAU NVARCHAR2(100),
    ROLE_ID NUMBER NOT NULL,
    PRIMARY KEY (MATK)
);
create table PHANQUYEN(
    ROLE_ID NUMBER NOT NULL,
    QUYEN VARCHAR(20),
    PRIMARY KEY (ROLE_ID)
);
create table HOADON(
    MAHD NUMBER GENERATED by default on null as IDENTITY,
    MAKH NUMBER NOT NULL ,
    NGAYLAP NVARCHAR2(20),
    TONGTIEN INT NOT NULL,
    HOTEN NVARCHAR2(50),
    NOIGIAO NVARCHAR2(50),
    SDT VARCHAR(11),
    TRANGTHAI NUMBER,
    PRIMARY KEY(MAHD)
);
drop table cthd
create table CTHD(
    MAHD NUMBER NOT NULL,
    MASP NUMBER NOT NULL ,
    MAMAU NUMBER,
    MAKT NUMBER,
    SOLUONG INT NOT NULL,
    DONGIA NUMBER,
    PRIMARY KEY(MASP,MAHD,MAMAU,MAKT)
);
create table KICHTHUOC(
MAKT NUMBER GENERATED by default on null as IDENTITY,
TENKT VARCHAR(5),
PRIMARY KEY(MAKT)
);
drop table chitietkt
CREATE TABLE CHITIETKT(
MASP NUMBER NOT NULL,
MAKT NUMBER NOT NULL,
PRIMARY KEY(MASP,MAKT)
)

ALTER TABLE SANPHAM ADD CONSTRAINT fk_MALOAI FOREIGN KEY(MALOAI) REFERENCES LOAI(MALOAI);

ALTER TABLE CHITIETMAU ADD CONSTRAINT fk_MAMAU FOREIGN KEY(MAMAU) REFERENCES MAU(MAMAU);
ALTER TABLE CHITIETMAU ADD CONSTRAINT fk_SP FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP);

ALTER TABLE CHITIETKT ADD CONSTRAINT fk_MAKT FOREIGN KEY(MAKT) REFERENCES KICHTHUOC(MAKT);
ALTER TABLE CHITIETKT ADD CONSTRAINT fk_SPK FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP);

ALTER TABLE CTHD ADD CONSTRAINT fk_MAHD FOREIGN KEY(MAHD) REFERENCES HOADON(MAHD);
ALTER TABLE CTHD ADD CONSTRAINT fk_MASP FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP);
ALTER TABLE CTHD ADD CONSTRAINT fk_MAMAUHD FOREIGN KEY(MAMAU) REFERENCES MAU(MAMAU);
ALTER TABLE CTHD ADD CONSTRAINT fk_MAKTHD FOREIGN KEY(MAKT) REFERENCES KICHTHUOC(MAKT);

ALTER TABLE TAIKHOAN ADD CONSTRAINT fk_ROLE FOREIGN KEY(ROLE_ID) REFERENCES PHANQUYEN(ROLE_ID);

INSERT INTO SANPHAM(TENSP, DONGIA, HINH,HINH_RONG,MALOAI,MOTA) VALUES ('jumsuit',150000,'','',1,'dsf')
delete from SAnPHAM where masp ='AB101'
INSERT INTO LOAI(TENLOAI) VALUES ('Jumsuit') 
INSERT INTO TAIKHOAN(TENCHUTK,SDT,EMAIL, DIACHI, NGAYSINH,TENDN,MATKHAU,ROLE_ID) VALUES('hhj',909090,'hgghg','hghgh','2021-06-07','phuongvt','phuongvt',0)
INSERT INTO PHANQUYEN (ROLE_ID,QUYEN) VALUES (1,'Admin')
commit;
SELECT * FROM chitietmau
insert into kichthuoc (tenkt) values ('L') 
insert into chitietmau(masp,mamau) values (1,81) 
insert into chitietkt (masp, makt) values(31,3)
commit;
select * from SANPHAM
insert into hoadon (makh, ngaylap, tongtien, hoten, noigiao, sdt, trangthai) values(2, '2019-09-09', 400000, 'truong thi phuong', 'fgdfg', '87658467',0)
insert into cthd values(1, 35,81,2,2,300000)
SELECT *from loai
commit;