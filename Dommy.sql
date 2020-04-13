-- 상품테이블
DROP TABLE tbl_pdt;
CREATE TABLE tbl_pdt(
    pno NUMBER PRIMARY KEY,
    pname VARCHAR2(500) NOT NULL,
    ptype VARCHAR2(200),
    pmemo VARCHAR2(1000),
    sale_price NUMBER DEFAULT 0,
    price NUMBER DEFAULT 0,
    avail_cnt NUMBER DEFAULT 0,
    sale_cnt NUMBER DEFAULT 0,
    p_img VARCHAR2(300),
    regdate DATE DEFAULT SYSDATE
);

DROP SEQUENCE seq_pdt;
CREATE SEQUENCE seq_pdt
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;
    
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'네츄럴코어 베네M50 강아지사료 2kg','사료','1',18000,15450,4,8,'naturecore.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'네츄럴코어 강아지용 미트스틱 20P','스틱/큐브/소시지','1',9800,8900,5,6,'foodthree.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'오요요 포근포근 텐트','하우스','포근포근텐트',40000,29500,3,20,'homeone.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'쥬쥬베 노즈워크 트릿볼 그린','노즈워크','1',8500,4500,1,5,'playtwo.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'수퍼펫 대나무 원목 강아지용 경사식탁 - S','급여그릇','1',20000,16900,1,15,'superpetone.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'ANF 6FREE 플러스 소고기 연어 5.6kg','사료','1',45000,38000,5,4,'foodone.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'프레스키 터키츄 칠면조힘줄 하드링 M','캔/껌','1',5500,4500,3,1,'foodtwo.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'풀무원 아미오 헬씨믹스 트릿 눈물 눈물자국 100g','영양제','1',45000,38000,1,0,'pillone.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'브리더 캐릭터 장난감 문어','장난감','1',3000,2500,10,11,'playone.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'페로가토 구름 원형 강아지 방석 (색상선택가능) - 중형','방석/쿠션','1',27000,21900,7,10,'houseone.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'시저캔 강아지용 양고기 100g','캔/껌','1',2000,1450,1,7,'canone.png');
INSERT INTO tbl_pdt(pno, pname, ptype, pmemo, sale_price, price, avail_cnt, sale_cnt, p_img)
VALUES(seq_pdt.NEXTVAL,'강아지전용 수제 치킨 (닭다리) 300g','스틱/큐브/소시지','1',3500,2900,9,8,'chicken.png');


COMMIT;

SELECT * FROM tbl_pdt;

SELECT rownum rnum, best.*
FROM(SELECT * FROM tbl_pdt
     ORDER BY sale_cnt DESC
     ) best;
     
SELECT *
FROM(SELECT rownum rnum, best.*
     FROM(SELECT * FROM tbl_pdt
          WHERE avail_cnt > 0
          ORDER BY sale_cnt DESC
          ) best
    )
WHERE rnum between 1 and 5;

SELECT COUNT(*) FROM tbl_pdt;

SELECT *
FROM(SELECT rownum rnum, new.*
     FROM(SELECT * FROM tbl_pdt
          WHERE avail_cnt > 0
          ORDER BY regdate DESC
          ) new
    )
WHERE rnum between 1 and 4;
        
COMMIT;

-- 회원테이블
DROP TABLE tbl_member;
CREATE TABLE tbl_member(
    id VARCHAR2(100) PRIMARY KEY,
    pw VARCHAR2(200) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    postcode VARCHAR2(30) NOT NULL,
    addr1 VARCHAR2(300) NOT NULL,
    addr2 VARCHAR2(300) NOT NULL,
    useon VARCHAR2(20) NOT NULL,
    primaryon VARCHAR2(20) NOT NULL,
    snson VARCHAR2(20) DEFAULT 'false',
    emailon VARCHAR2(20) DEFAULT 'false',
    useyn VARCHAR2(200) DEFAULT 'n',
    regdate DATE DEFAULT SYSDATE
);

INSERT INTO tbl_member(id, pw, name, phone, email, postcode, addr1, addr2, useon, primaryon)
VALUES('admin', '1234', '관리자', '01010000000', 'admin@email.com', '12345', '광주', '건조하구 건조동', 'true', 'true');
INSERT INTO tbl_member(id, pw, name, phone, email, postcode, addr1, addr2, useon, primaryon)
VALUES('aa123', '1234', '에이', '01010000000', 'aa123@email.com', '12345', '광주', '건조하구 건조동', 'true', 'true');
COMMIT;

SELECT * FROM tbl_member;

SELECT * FROM tbl_member
WHERE id = 'admn';

-- 게시판 테이블 
-- 게시판 Sequence생성
DROP SEQUENCE seq_board;
CREATE SEQUENCE seq_board
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;
    
DROP TABLE tbl_board CASCADE CONSTRAINTS;
CREATE TABLE tbl_board (
    bno number(10, 0),
    type CHAR(4) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    view_content VARCHAR2(4000) NOT NULL,
    search_content VARCHAR2(4000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    viewcnt NUMBER DEFAULT 0,
    replycnt NUMBER DEFAULT 0,
    goodcnt NUMBER DEFAULT 0,
    filecnt NUMBER DEFAULT 0,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    show CHAR(1) DEFAULT 'y',
    ref NUMBER DEFAULT 1,
    re_step NUMBER DEFAULT 1,
    re_level NUMBER DEFAULT 0
);
-- 게시판 테이블 PK Key추가
ALTER TABLE tbl_board ADD CONSTRAINT pk_board
PRIMARY KEY(bno);

SELECT * FROM tbl_board
ORDER BY bno DESC;

-- 댓글 테이블
DROP SEQUENCE seq_reply;
CREATE SEQUENCE seq_reply
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;

DROP TABLE tbl_reply;
CREATE TABLE tbl_reply(
    rno NUMBER,
    type CHAR(4) NOT NULL,
    writer VARCHAR2(2000) NOT NULL,
    content VARCHAR2(100) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    bno NUMBER NOT NULL
);

ALTER TABLE tbl_reply
ADD CONSTRAINT pk_reply_rno
PRIMARY KEY(rno);

ALTER TABLE tbl_reply
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY(bno) REFERENCES tbl_board(bno)
ON DELETE CASCADE;

SELECT * FROM tbl_reply;

-- 게시글 첨부파일 테이블
-- : 첨부파일이름은  uuid를 사용하기 때문에 중복 안됨
DROP TABLE tbl_attach CASCADE CONSTRAINTS;
CREATE TABLE tbl_attach(
     fullname VARCHAR2(150) NOT NULL,
     bno NUMBER NOT NULL,
     regdate DATE DEFAULT SYSDATE
);

ALTER TABLE tbl_attach ADD CONSTRAINT pk_attach
PRIMARY KEY(fullname);

ALTER TABLE tbl_attach
ADD CONSTRAINT fk_attach_bno
FOREIGN KEY(bno) REFERENCES tbl_board(bno)
ON DELETE CASCADE;
