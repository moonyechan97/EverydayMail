-- WEB용 게시판 테이블 생성
CREATE TABLE t_board(
	NO number(5) PRIMARY KEY
	, title varchar2(300) NOT NULL
	, writer varchar2(100) NOT NULL
	, content varchar2(4000) NOT NULL
	, view_cnt number(5) DEFAULT 0
	, reg_date DATE DEFAULT sysdate
);

CREATE SEQUENCE seq_t_board_no nocache;

INSERT INTO t_board(NO, title, writer, content)
 values(seq_t_board_no.nextval, '하하하하', '홍길동', '화요일입니다');
INSERT INTO t_board(NO, title, writer, content)
 values(seq_t_board_no.nextval, '참을 수 없는 기쁨', '홍길동', '내일은 공휴일입니다');

COMMIT;

SELECT * FROM t_board;
