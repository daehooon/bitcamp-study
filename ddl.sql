-- 광역시도
DROP TABLE IF EXISTS har_mcityprov RESTRICT;

-- 글
DROP TABLE IF EXISTS har_post RESTRICT;

-- 대분류
DROP TABLE IF EXISTS har_broad_cat RESTRICT;

-- 댓글
DROP TABLE IF EXISTS har_comment RESTRICT;

-- 상품구매
DROP TABLE IF EXISTS har_purchase RESTRICT;

-- 상품구매후기
DROP TABLE IF EXISTS har_prrv RESTRICT;

-- 서비스기본정보
DROP TABLE IF EXISTS har_service RESTRICT;

-- 서비스문의글
DROP TABLE IF EXISTS har_sqna RESTRICT;

-- 서비스문의답글파일
DROP TABLE IF EXISTS har_srpl_file RESTRICT;

-- 소분류
DROP TABLE IF EXISTS har_narrow_cat RESTRICT;

-- 수업일정
DROP TABLE IF EXISTS har_session RESTRICT;

-- 스토리게시판
DROP TABLE IF EXISTS har_story RESTRICT;

-- 시군구
DROP TABLE IF EXISTS har_sigungu RESTRICT;

-- 알림
DROP TABLE IF EXISTS har_alarm RESTRICT;

-- 위시리스트
DROP TABLE IF EXISTS har_wishlist RESTRICT;

-- 장바구니
DROP TABLE IF EXISTS har_basket RESTRICT;

-- 좋아요
DROP TABLE IF EXISTS har_like RESTRICT;

-- 체험학습
DROP TABLE IF EXISTS har_learning RESTRICT;

-- 체험학습신청
DROP TABLE IF EXISTS har_lrn_appl RESTRICT;

-- 체험학습후기
DROP TABLE IF EXISTS har_lrnrv RESTRICT;

-- 체험후기추천수
DROP TABLE IF EXISTS har_lrnrv_rcm RESTRICT;

-- 튜터
DROP TABLE IF EXISTS har_tutor RESTRICT;

-- 튜터문의게시판
DROP TABLE IF EXISTS har_tqna RESTRICT;

-- 튜터문의답글파일
DROP TABLE IF EXISTS har_trpl_file RESTRICT;

-- 튜터지역
DROP TABLE IF EXISTS har_tdist RESTRICT;

-- 튜터카테고리
DROP TABLE IF EXISTS har_tcat RESTRICT;

-- 파일
DROP TABLE IF EXISTS har_file RESTRICT;

-- 판매상품
DROP TABLE IF EXISTS har_product RESTRICT;

-- 판매상품사진
DROP TABLE IF EXISTS har_prpic RESTRICT;

-- 판매상품옵션
DROP TABLE IF EXISTS har_pr_opt RESTRICT;

-- 판매상품후기추천수
DROP TABLE IF EXISTS har_prrv_rcm RESTRICT;

-- 팔로우
DROP TABLE IF EXISTS har_follow RESTRICT;

-- 회원
DROP TABLE IF EXISTS har_member RESTRICT;

-- 회원_알림
DROP TABLE IF EXISTS har_mem_alrm RESTRICT;

-- 회원등급
DROP TABLE IF EXISTS har_mrank RESTRICT;

-- 광역시도
CREATE TABLE har_mcityprov (
	mcp_no   INTEGER     NOT NULL COMMENT '광역시도번호', -- 광역시도번호
	mcp_name VARCHAR(50) NOT NULL COMMENT '시도명' -- 시도명
)
COMMENT '광역시도';

-- 광역시도
ALTER TABLE har_mcityprov
	ADD CONSTRAINT PK_har_mcityprov -- 광역시도 기본키
		PRIMARY KEY (
			mcp_no -- 광역시도번호
		);

-- 광역시도 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_mcityprov
	ON har_mcityprov ( -- 광역시도
		mcp_name ASC -- 시도명
	);

ALTER TABLE har_mcityprov
	MODIFY COLUMN mcp_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '광역시도번호';

-- 글
CREATE TABLE har_post (
	pno      INTEGER  NOT NULL COMMENT '글번호', -- 글번호
	content  LONGTEXT NOT NULL COMMENT '내용', -- 내용
	wdttm    DATETIME NOT NULL DEFAULT now() COMMENT '작성일시', -- 작성일시
	view_cnt INTEGER  NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
	pstat    INTEGER  NOT NULL DEFAULT 1 COMMENT '글상태' -- 글상태
)
COMMENT '글';

-- 글
ALTER TABLE har_post
	ADD CONSTRAINT PK_har_post -- 글 기본키
		PRIMARY KEY (
			pno -- 글번호
		);

-- 글
ALTER TABLE har_post
	ADD CONSTRAINT CK_har_post -- 글 체크 제약
		CHECK (pstat = 0 or pstat = 1);

-- 글 인덱스
CREATE INDEX IX_har_post
	ON har_post( -- 글
		content ASC -- 내용
	);

-- 글 인덱스2
CREATE INDEX IX_har_post2
	ON har_post( -- 글
		wdttm DESC -- 작성일시
	);

-- 글 인덱스3
CREATE INDEX IX_har_post3
	ON har_post( -- 글
		view_cnt ASC -- 조회수
	);

-- 글 인덱스4
CREATE INDEX IX_har_post4
	ON har_post( -- 글
		view_cnt DESC -- 조회수
	);

ALTER TABLE har_post
	MODIFY COLUMN pno INTEGER NOT NULL AUTO_INCREMENT COMMENT '글번호';

-- 대분류
CREATE TABLE har_broad_cat (
	bcat_no   INTEGER     NOT NULL COMMENT '대분류번호', -- 대분류번호
	bcat_name VARCHAR(50) NOT NULL COMMENT '대분류명' -- 대분류명
)
COMMENT '대분류';

-- 대분류
ALTER TABLE har_broad_cat
	ADD CONSTRAINT PK_har_broad_cat -- 대분류 기본키
		PRIMARY KEY (
			bcat_no -- 대분류번호
		);

-- 대분류 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_broad_cat
	ON har_broad_cat ( -- 대분류
		bcat_name ASC -- 대분류명
	);

ALTER TABLE har_broad_cat
	MODIFY COLUMN bcat_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '대분류번호';

-- 댓글
CREATE TABLE har_comment (
	com_no   INTEGER  NOT NULL COMMENT '댓글번호', -- 댓글번호
	story_no INTEGER  NOT NULL COMMENT '글번호', -- 글번호
	mno      INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
	comment  LONGTEXT NOT NULL COMMENT '내용', -- 내용
	com_stat INTEGER  NOT NULL DEFAULT 1 COMMENT '댓글상태' -- 댓글상태
)
COMMENT '댓글';

-- 댓글
ALTER TABLE har_comment
	ADD CONSTRAINT PK_har_comment -- 댓글 기본키
		PRIMARY KEY (
			com_no -- 댓글번호
		);

-- 댓글
ALTER TABLE har_comment
	ADD CONSTRAINT CK_har_comment -- 댓글 체크 제약
		CHECK (com_stat = 0 or com_stat = 1);

ALTER TABLE har_comment
	MODIFY COLUMN com_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

-- 상품구매
CREATE TABLE har_purchase (
	purc_no    INTEGER     NOT NULL COMMENT '상품옵션구매번호', -- 상품옵션구매번호
	mno        INTEGER     NOT NULL COMMENT '구매회원번호', -- 구매회원번호
	opt_no     INTEGER     NOT NULL COMMENT '상품옵션번호', -- 상품옵션번호
	prdttm     DATETIME    NOT NULL DEFAULT now() COMMENT '구매일시', -- 구매일시
	prsize     INTEGER     NOT NULL DEFAULT 0 COMMENT '구매수량', -- 구매수량
	invoice_no VARCHAR(30) NOT NULL COMMENT '송장번호' -- 송장번호
)
COMMENT '상품구매';

-- 상품구매
ALTER TABLE har_purchase
	ADD CONSTRAINT PK_har_purchase -- 상품구매 기본키
		PRIMARY KEY (
			purc_no -- 상품옵션구매번호
		);

-- 상품구매 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_purchase
	ON har_purchase ( -- 상품구매
		invoice_no ASC -- 송장번호
	);

-- 상품구매 인덱스
CREATE INDEX IX_har_purchase
	ON har_purchase( -- 상품구매
		prdttm ASC -- 구매일시
	);

-- 상품구매 인덱스2
CREATE INDEX IX_har_purchase2
	ON har_purchase( -- 상품구매
		prdttm DESC -- 구매일시
	);

ALTER TABLE har_purchase
	MODIFY COLUMN purc_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '상품옵션구매번호';

-- 상품구매후기
CREATE TABLE har_prrv (
	pno     INTEGER      NOT NULL COMMENT '글번호', -- 글번호
	purc_no INTEGER      NOT NULL COMMENT '상품옵션구매번호', -- 상품옵션구매번호
	title   VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	rate    DOUBLE       NOT NULL DEFAULT 1 COMMENT '평점' -- 평점
)
COMMENT '상품구매후기';

-- 상품구매후기
ALTER TABLE har_prrv
	ADD CONSTRAINT PK_har_prrv -- 상품구매후기 기본키
		PRIMARY KEY (
			pno -- 글번호
		);

-- 상품구매후기
ALTER TABLE har_prrv
	ADD CONSTRAINT CK_har_prrv -- 상품구매후기 체크 제약
		CHECK (rate >= 1 and rate <= 5 and (rate*10)%5=0);

-- 상품구매후기 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_prrv
	ON har_prrv ( -- 상품구매후기
		purc_no ASC -- 상품옵션구매번호
	);

-- 상품구매후기 인덱스
CREATE INDEX IX_har_prrv
	ON har_prrv( -- 상품구매후기
		title ASC -- 제목
	);

-- 상품구매후기 인덱스2
CREATE INDEX IX_har_prrv2
	ON har_prrv( -- 상품구매후기
		rate DESC -- 평점
	);

-- 서비스기본정보
CREATE TABLE har_service (
	sno      INTEGER      NOT NULL COMMENT '서비스번호', -- 서비스번호
	ncat_no  INTEGER      NULL     COMMENT '소분류번호', -- 소분류번호
	sname    VARCHAR(50)  NOT NULL COMMENT '서비스이름', -- 서비스이름
	sintro   LONGTEXT     NOT NULL COMMENT '서비스소개', -- 서비스소개
	cov_img  VARCHAR(255) NOT NULL COMMENT '커버이미지', -- 커버이미지
	avg_rate DOUBLE       NULL     DEFAULT 1 COMMENT '평균평점', -- 평균평점
	sstat    INTEGER      NOT NULL DEFAULT 1 COMMENT '서비스상태', -- 서비스상태
	rdttm    DATETIME     NOT NULL DEFAULT now() COMMENT '등록일시' -- 등록일시
)
COMMENT '서비스기본정보';

-- 서비스기본정보
ALTER TABLE har_service
	ADD CONSTRAINT PK_har_service -- 서비스기본정보 기본키
		PRIMARY KEY (
			sno -- 서비스번호
		);

-- 서비스기본정보
ALTER TABLE har_service
	ADD CONSTRAINT CK_har_service -- 서비스기본정보 체크 제약
		CHECK (sstat = 0 or sstat = 1);

-- 서비스기본정보 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_service
	ON har_service ( -- 서비스기본정보
		cov_img ASC -- 커버이미지
	);

-- 서비스기본정보 인덱스
CREATE INDEX IX_har_service
	ON har_service( -- 서비스기본정보
		sname ASC -- 서비스이름
	);

-- 서비스기본정보 인덱스2
CREATE INDEX IX_har_service2
	ON har_service( -- 서비스기본정보
		avg_rate DESC -- 평균평점
	);

-- 서비스기본정보 인덱스3
CREATE INDEX IX_har_service3
	ON har_service( -- 서비스기본정보
		rdttm DESC -- 등록일시
	);

ALTER TABLE har_service
	MODIFY COLUMN sno INTEGER NOT NULL AUTO_INCREMENT COMMENT '서비스번호';

-- 서비스문의글
CREATE TABLE har_sqna (
	pno         INTEGER      NOT NULL COMMENT '글번호', -- 글번호
	mno         INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
	sno         INTEGER      NOT NULL COMMENT '서비스번호', -- 서비스번호
	title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	secret      INTEGER      NOT NULL DEFAULT 1 COMMENT '비밀글여부', -- 비밀글여부
	rpl_content LONGTEXT     NOT NULL COMMENT '답변내용', -- 답변내용
	rpl_dttm    DATETIME     NOT NULL DEFAULT now() COMMENT '답변일시' -- 답변일시
)
COMMENT '서비스문의글';

-- 서비스문의글
ALTER TABLE har_sqna
	ADD CONSTRAINT PK_har_sqna -- 서비스문의글 기본키
		PRIMARY KEY (
			pno -- 글번호
		);

-- 서비스문의글
ALTER TABLE har_sqna
	ADD CONSTRAINT CK_har_sqna -- 서비스문의글 체크 제약
		CHECK (secret = 0 or secret = 1);

-- 서비스문의글 인덱스
CREATE INDEX IX_har_sqna
	ON har_sqna( -- 서비스문의글
		title ASC -- 제목
	);

-- 서비스문의답글파일
CREATE TABLE har_srpl_file (
	fno   INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
	fname VARCHAR(255) NOT NULL COMMENT '파일명', -- 파일명
	pno   INTEGER      NOT NULL COMMENT '글번호', -- 글번호
	fstat INTEGER      NOT NULL DEFAULT 1 COMMENT '파일상태' -- 파일상태
)
COMMENT '서비스문의답글파일';

-- 서비스문의답글파일
ALTER TABLE har_srpl_file
	ADD CONSTRAINT PK_har_srpl_file -- 서비스문의답글파일 기본키
		PRIMARY KEY (
			fno -- 파일번호
		);

-- 서비스문의답글파일
ALTER TABLE har_srpl_file
	ADD CONSTRAINT CK_har_srpl_file -- 서비스문의답글파일 체크 제약
		CHECK (fstat = 0 or fstat = 1);

-- 서비스문의답글파일 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_srpl_file
	ON har_srpl_file ( -- 서비스문의답글파일
		fname ASC -- 파일명
	);

ALTER TABLE har_srpl_file
	MODIFY COLUMN fno INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

-- 소분류
CREATE TABLE har_narrow_cat (
	ncat_no   INTEGER     NOT NULL COMMENT '소분류번호', -- 소분류번호
	ncat_name VARCHAR(50) NOT NULL COMMENT '소분류명', -- 소분류명
	bcat_no   INTEGER     NOT NULL COMMENT '대분류번호' -- 대분류번호
)
COMMENT '소분류';

-- 소분류
ALTER TABLE har_narrow_cat
	ADD CONSTRAINT PK_har_narrow_cat -- 소분류 기본키
		PRIMARY KEY (
			ncat_no -- 소분류번호
		);

ALTER TABLE har_narrow_cat
	MODIFY COLUMN ncat_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '소분류번호';

-- 수업일정
CREATE TABLE har_session (
	sess_no INTEGER  NOT NULL COMMENT '수업일정번호', -- 수업일정번호
	lno     INTEGER  NULL     COMMENT '체험학습번호', -- 체험학습번호
	date    DATE     NOT NULL COMMENT '날짜', -- 날짜
	stm     DATETIME NOT NULL COMMENT '시작시각', -- 시작시각
	etm     DATETIME NOT NULL COMMENT '종료시각' -- 종료시각
)
COMMENT '수업일정';

-- 수업일정
ALTER TABLE har_session
	ADD CONSTRAINT PK_har_session -- 수업일정 기본키
		PRIMARY KEY (
			sess_no -- 수업일정번호
		);

ALTER TABLE har_session
	MODIFY COLUMN sess_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '수업일정번호';

-- 스토리게시판
CREATE TABLE har_story (
	story_no INTEGER NOT NULL COMMENT '글번호', -- 글번호
	tno      INTEGER NOT NULL COMMENT '튜터번호' -- 튜터번호
)
COMMENT '스토리게시판';

-- 스토리게시판
ALTER TABLE har_story
	ADD CONSTRAINT PK_har_story -- 스토리게시판 기본키
		PRIMARY KEY (
			story_no -- 글번호
		);

-- 시군구
CREATE TABLE har_sigungu (
	sgg_no   INTEGER     NOT NULL COMMENT '시군구번호', -- 시군구번호
	mcp_no   INTEGER     NOT NULL COMMENT '광역시도번호', -- 광역시도번호
	sgg_name VARCHAR(50) NOT NULL COMMENT '시군구명' -- 시군구명
)
COMMENT '시군구';

-- 시군구
ALTER TABLE har_sigungu
	ADD CONSTRAINT PK_har_sigungu -- 시군구 기본키
		PRIMARY KEY (
			sgg_no -- 시군구번호
		);

ALTER TABLE har_sigungu
	MODIFY COLUMN sgg_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '시군구번호';

-- 알림
CREATE TABLE har_alarm (
	alrm_no   INTEGER  NOT NULL COMMENT '알림번호', -- 알림번호
	alrm_dttm DATETIME NOT NULL COMMENT '알림일시', -- 알림일시
	alrm_cont TEXT     NOT NULL COMMENT '알림내용' -- 알림내용
)
COMMENT '알림';

-- 알림
ALTER TABLE har_alarm
	ADD CONSTRAINT PK_har_alarm -- 알림 기본키
		PRIMARY KEY (
			alrm_no -- 알림번호
		);

-- 알림 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_alarm
	ON har_alarm ( -- 알림
		alrm_dttm ASC, -- 알림일시
		alrm_cont ASC  -- 알림내용
	);

ALTER TABLE har_alarm
	MODIFY COLUMN alrm_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '알림번호';

-- 위시리스트
CREATE TABLE har_wishlist (
	mno INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	sno INTEGER NOT NULL COMMENT '서비스번호' -- 서비스번호
)
COMMENT '위시리스트';

-- 위시리스트
ALTER TABLE har_wishlist
	ADD CONSTRAINT PK_har_wishlist -- 위시리스트 기본키
		PRIMARY KEY (
			mno, -- 회원번호
			sno  -- 서비스번호
		);

-- 장바구니
CREATE TABLE har_basket (
	mno INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	sno INTEGER NOT NULL COMMENT '서비스번호' -- 서비스번호
)
COMMENT '장바구니';

-- 장바구니
ALTER TABLE har_basket
	ADD CONSTRAINT PK_har_basket -- 장바구니 기본키
		PRIMARY KEY (
			mno, -- 회원번호
			sno  -- 서비스번호
		);

-- 좋아요
CREATE TABLE har_like (
	mno      INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	story_no INTEGER NOT NULL COMMENT '글번호' -- 글번호
)
COMMENT '좋아요';

-- 좋아요
ALTER TABLE har_like
	ADD CONSTRAINT PK_har_like -- 좋아요 기본키
		PRIMARY KEY (
			mno,      -- 회원번호
			story_no  -- 글번호
		);

-- 체험학습
CREATE TABLE har_learning (
	lno        INTEGER      NOT NULL COMMENT '체험학습번호', -- 체험학습번호
	sgg_no     INTEGER      NULL     COMMENT '시군구번호', -- 시군구번호
	tno        INTEGER      NOT NULL COMMENT '튜터번호', -- 튜터번호
	min_head   INTEGER      NOT NULL DEFAULT 1 COMMENT '최소 인원수', -- 최소 인원수
	max_head   INTEGER      NOT NULL DEFAULT min_head COMMENT '최대 인원수', -- 최대 인원수
	curriculum LONGTEXT     NOT NULL COMMENT '진행 순서', -- 진행 순서
	price      INTEGER      NOT NULL COMMENT '가격', -- 가격
	zipcode    VARCHAR(7)   NOT NULL COMMENT '우편번호', -- 우편번호
	addr       VARCHAR(255) NOT NULL COMMENT '기본주소', -- 기본주소
	det_addr   VARCHAR(255) NOT NULL COMMENT '상세주소', -- 상세주소
	rfnd_info  LONGTEXT     NOT NULL COMMENT '환불정보' -- 환불정보
)
COMMENT '체험학습';

-- 체험학습
ALTER TABLE har_learning
	ADD CONSTRAINT PK_har_learning -- 체험학습 기본키
		PRIMARY KEY (
			lno -- 체험학습번호
		);

-- 체험학습
ALTER TABLE har_learning
	ADD CONSTRAINT CK_har_learning -- 체험학습 체크 제약
		CHECK (min_head >= 1);

-- 체험학습
ALTER TABLE har_learning
	ADD CONSTRAINT CK_har_learning2 -- 체험학습 체크 제약2
		CHECK (max_head >= min_head);

-- 체험학습 인덱스
CREATE INDEX IX_har_learning
	ON har_learning( -- 체험학습
		price ASC -- 가격
	);

-- 체험학습 인덱스2
CREATE INDEX IX_har_learning2
	ON har_learning( -- 체험학습
		price DESC -- 가격
	);

-- 체험학습신청
CREATE TABLE har_lrn_appl (
	lrn_appl_no INTEGER  NOT NULL COMMENT '체험학습신청번호', -- 체험학습신청번호
	mno         INTEGER  NOT NULL COMMENT '신청회원번호', -- 신청회원번호
	sess_no     INTEGER  NOT NULL COMMENT '수업일정번호', -- 수업일정번호
	appl_size   INTEGER  NULL     DEFAULT 1 COMMENT '신청수량', -- 신청수량
	appl_dttm   DATETIME NULL     DEFAULT now() COMMENT '신청일시' -- 신청일시
)
COMMENT '체험학습신청';

-- 체험학습신청
ALTER TABLE har_lrn_appl
	ADD CONSTRAINT PK_har_lrn_appl -- 체험학습신청 기본키
		PRIMARY KEY (
			lrn_appl_no -- 체험학습신청번호
		);

-- 체험학습신청 인덱스
CREATE INDEX IX_har_lrn_appl
	ON har_lrn_appl( -- 체험학습신청
		appl_dttm ASC -- 신청일시
	);

-- 체험학습신청 인덱스2
CREATE INDEX IX_har_lrn_appl2
	ON har_lrn_appl( -- 체험학습신청
		appl_dttm DESC -- 신청일시
	);

ALTER TABLE har_lrn_appl
	MODIFY COLUMN lrn_appl_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '체험학습신청번호';

-- 체험학습후기
CREATE TABLE har_lrnrv (
	pno         INTEGER      NOT NULL COMMENT '글번호', -- 글번호
	lrn_appl_no INTEGER      NOT NULL COMMENT '체험학습신청번호', -- 체험학습신청번호
	title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	rate        DOUBLE       NOT NULL DEFAULT 1 COMMENT '평점' -- 평점
)
COMMENT '체험학습후기';

-- 체험학습후기
ALTER TABLE har_lrnrv
	ADD CONSTRAINT PK_har_lrnrv -- 체험학습후기 기본키
		PRIMARY KEY (
			pno -- 글번호
		);

-- 체험학습후기
ALTER TABLE har_lrnrv
	ADD CONSTRAINT CK_har_lrnrv -- 체험학습후기 체크 제약
		CHECK (rate >= 1 and rate <= 5 and (rate*10)%5=0);

-- 체험학습후기 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_lrnrv
	ON har_lrnrv ( -- 체험학습후기
		lrn_appl_no ASC -- 체험학습신청번호
	);

-- 체험학습후기 유니크 인덱스2
CREATE UNIQUE INDEX UIX_har_lrnrv2
	ON har_lrnrv ( -- 체험학습후기
		title ASC -- 제목
	);

-- 체험학습후기 인덱스
CREATE INDEX IX_har_lrnrv
	ON har_lrnrv( -- 체험학습후기
		rate DESC -- 평점
	);

-- 체험후기추천수
CREATE TABLE har_lrnrv_rcm (
	mno INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	pno INTEGER NOT NULL COMMENT '글번호' -- 글번호
)
COMMENT '체험후기추천수';

-- 체험후기추천수
ALTER TABLE har_lrnrv_rcm
	ADD CONSTRAINT PK_har_lrnrv_rcm -- 체험후기추천수 기본키
		PRIMARY KEY (
			mno, -- 회원번호
			pno  -- 글번호
		);

-- 튜터
CREATE TABLE har_tutor (
	tno    INTEGER      NOT NULL COMMENT '튜터번호', -- 튜터번호
	tintro LONGTEXT     NOT NULL COMMENT '튜터소개', -- 튜터소개
	tappl  VARCHAR(255) NOT NULL COMMENT '튜터신청서', -- 튜터신청서
	rddtm  DATETIME     NOT NULL DEFAULT now() COMMENT '등업일시' -- 등업일시
)
COMMENT '튜터';

-- 튜터
ALTER TABLE har_tutor
	ADD CONSTRAINT PK_har_tutor -- 튜터 기본키
		PRIMARY KEY (
			tno -- 튜터번호
		);

-- 튜터문의게시판
CREATE TABLE har_tqna (
	pno      INTEGER      NOT NULL COMMENT '글번호', -- 글번호
	mno      INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
	tno      INTEGER      NOT NULL COMMENT '튜터번호', -- 튜터번호
	title    VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	secret   INTEGER      NOT NULL DEFAULT 1 COMMENT '비밀글여부', -- 비밀글여부
	reply    LONGTEXT     NOT NULL COMMENT '답변내용', -- 답변내용
	rpl_dttm DATETIME     NOT NULL DEFAULT now() COMMENT '답변일시' -- 답변일시
)
COMMENT '튜터문의게시판';

-- 튜터문의게시판
ALTER TABLE har_tqna
	ADD CONSTRAINT PK_har_tqna -- 튜터문의게시판 기본키
		PRIMARY KEY (
			pno -- 글번호
		);

-- 튜터문의게시판
ALTER TABLE har_tqna
	ADD CONSTRAINT CK_har_tqna -- 튜터문의게시판 체크 제약
		CHECK (secret = 1 or secret = 0);

-- 튜터문의게시판 인덱스
CREATE INDEX IX_har_tqna
	ON har_tqna( -- 튜터문의게시판
		title ASC -- 제목
	);

-- 튜터문의답글파일
CREATE TABLE har_trpl_file (
	fno   INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
	fname VARCHAR(255) NOT NULL COMMENT '파일명', -- 파일명
	pno   INTEGER      NOT NULL COMMENT '글번호', -- 글번호
	fstat INTEGER      NOT NULL DEFAULT 1 COMMENT '파일상태' -- 파일상태
)
COMMENT '튜터문의답글파일';

-- 튜터문의답글파일
ALTER TABLE har_trpl_file
	ADD CONSTRAINT PK_har_trpl_file -- 튜터문의답글파일 기본키
		PRIMARY KEY (
			fno -- 파일번호
		);

-- 튜터문의답글파일
ALTER TABLE har_trpl_file
	ADD CONSTRAINT CK_har_trpl_file -- 튜터문의답글파일 체크 제약
		CHECK (fstat = 0 or fstat = 1);

-- 튜터문의답글파일 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_trpl_file
	ON har_trpl_file ( -- 튜터문의답글파일
		fname ASC -- 파일명
	);

ALTER TABLE har_trpl_file
	MODIFY COLUMN fno INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

-- 튜터지역
CREATE TABLE har_tdist (
	tno    INTEGER NOT NULL COMMENT '튜터번호', -- 튜터번호
	sgg_no INTEGER NOT NULL COMMENT '시군구번호' -- 시군구번호
)
COMMENT '튜터지역';

-- 튜터지역
ALTER TABLE har_tdist
	ADD CONSTRAINT PK_har_tdist -- 튜터지역 기본키
		PRIMARY KEY (
			tno -- 튜터번호
		);

-- 튜터카테고리
CREATE TABLE har_tcat (
	ncat_no INTEGER NOT NULL COMMENT '소분류번호', -- 소분류번호
	tno     INTEGER NOT NULL COMMENT '튜터번호' -- 튜터번호
)
COMMENT '튜터카테고리';

-- 튜터카테고리
ALTER TABLE har_tcat
	ADD CONSTRAINT PK_har_tcat -- 튜터카테고리 기본키
		PRIMARY KEY (
			ncat_no, -- 소분류번호
			tno      -- 튜터번호
		);

-- 파일
CREATE TABLE har_file (
	fno   INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
	fname VARCHAR(255) NOT NULL COMMENT '파일명', -- 파일명
	pno   INTEGER      NOT NULL COMMENT '글번호', -- 글번호
	fstat INTEGER      NOT NULL DEFAULT 1 COMMENT '파일상태' -- 파일상태
)
COMMENT '파일';

-- 파일
ALTER TABLE har_file
	ADD CONSTRAINT PK_har_file -- 파일 기본키
		PRIMARY KEY (
			fno -- 파일번호
		);

-- 파일
ALTER TABLE har_file
	ADD CONSTRAINT CK_har_file -- 파일 체크 제약
		CHECK (fstat = 0 or fstat = 1);

-- 파일 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_file
	ON har_file ( -- 파일
		fname ASC -- 파일명
	);

ALTER TABLE har_file
	MODIFY COLUMN fno INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

-- 판매상품
CREATE TABLE har_product (
	sno       INTEGER  NOT NULL COMMENT '판매상품번호', -- 판매상품번호
	tno       INTEGER  NOT NULL COMMENT '튜터번호', -- 튜터번호
	deli_info LONGTEXT NOT NULL COMMENT '배송정보', -- 배송정보
	rfnd_info LONGTEXT NOT NULL COMMENT '교환환불정보' -- 교환환불정보
)
COMMENT '판매상품';

-- 판매상품
ALTER TABLE har_product
	ADD CONSTRAINT PK_har_product -- 판매상품 기본키
		PRIMARY KEY (
			sno -- 판매상품번호
		);

-- 판매상품사진
CREATE TABLE har_prpic (
	prpic_no   INTEGER      NOT NULL COMMENT '판매상품사진번호', -- 판매상품사진번호
	prpic_name VARCHAR(255) NOT NULL COMMENT '상품사진명', -- 상품사진명
	prpic_stat INTEGER      NOT NULL DEFAULT 1 COMMENT '사진상태', -- 사진상태
	sno        INTEGER      NOT NULL COMMENT '판매상품번호' -- 판매상품번호
)
COMMENT '판매상품사진';

-- 판매상품사진
ALTER TABLE har_prpic
	ADD CONSTRAINT PK_har_prpic -- 판매상품사진 기본키
		PRIMARY KEY (
			prpic_no -- 판매상품사진번호
		);

-- 판매상품사진
ALTER TABLE har_prpic
	ADD CONSTRAINT CK_har_prpic -- 판매상품사진 체크 제약
		CHECK (prpic_stat = 0 or prpic_stat = 1);

-- 판매상품사진 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_prpic
	ON har_prpic ( -- 판매상품사진
		prpic_name ASC -- 상품사진명
	);

ALTER TABLE har_prpic
	MODIFY COLUMN prpic_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '판매상품사진번호';

-- 판매상품옵션
CREATE TABLE har_pr_opt (
	opt_no   INTEGER      NOT NULL COMMENT '상품옵션번호', -- 상품옵션번호
	opt_name VARCHAR(255) NOT NULL COMMENT '상품옵션명', -- 상품옵션명
	price    INTEGER      NOT NULL COMMENT '가격', -- 가격
	sto_size INTEGER      NOT NULL DEFAULT 0 COMMENT '재고수량', -- 재고수량
	sold_cnt INTEGER      NOT NULL DEFAULT 0 COMMENT '옵션별판매량', -- 옵션별판매량
	sno      INTEGER      NOT NULL COMMENT '판매상품번호' -- 판매상품번호
)
COMMENT '판매상품옵션';

-- 판매상품옵션
ALTER TABLE har_pr_opt
	ADD CONSTRAINT PK_har_pr_opt -- 판매상품옵션 기본키
		PRIMARY KEY (
			opt_no -- 상품옵션번호
		);

-- 판매상품옵션
ALTER TABLE har_pr_opt
	ADD CONSTRAINT CK_har_pr_opt -- 판매상품옵션 체크 제약
		CHECK (sto_size >= 0);

-- 판매상품옵션 인덱스
CREATE INDEX IX_har_pr_opt
	ON har_pr_opt( -- 판매상품옵션
		price ASC -- 가격
	);

-- 판매상품옵션 인덱스2
CREATE INDEX IX_har_pr_opt2
	ON har_pr_opt( -- 판매상품옵션
		sold_cnt DESC -- 옵션별판매량
	);

ALTER TABLE har_pr_opt
	MODIFY COLUMN opt_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '상품옵션번호';

-- 판매상품후기추천수
CREATE TABLE har_prrv_rcm (
	mno INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	pno INTEGER NOT NULL COMMENT '글번호' -- 글번호
)
COMMENT '판매상품후기추천수';

-- 판매상품후기추천수
ALTER TABLE har_prrv_rcm
	ADD CONSTRAINT PK_har_prrv_rcm -- 판매상품후기추천수 기본키
		PRIMARY KEY (
			mno, -- 회원번호
			pno  -- 글번호
		);

-- 팔로우
CREATE TABLE har_follow (
	mno INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	tno INTEGER NOT NULL COMMENT '튜터번호' -- 튜터번호
)
COMMENT '팔로우';

-- 팔로우
ALTER TABLE har_follow
	ADD CONSTRAINT PK_har_follow -- 팔로우 기본키
		PRIMARY KEY (
			mno, -- 회원번호
			tno  -- 튜터번호
		);

-- 회원
CREATE TABLE har_member (
	mno         INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
	sex         INTEGER      NULL     COMMENT '성별', -- 성별
	bdate       DATE         NULL     COMMENT '생년월일', -- 생년월일
	tel         VARCHAR(30)  NOT NULL COMMENT '전화번호', -- 전화번호
	profile_pic VARCHAR(255) NULL     COMMENT '프로필사진명', -- 프로필사진명
	mrno        INTEGER      NOT NULL COMMENT '회원등급번호', -- 회원등급번호
	password    VARCHAR(100) NOT NULL COMMENT '비밀번호', -- 비밀번호
	email       VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
	name        VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
	rdttm       DATETIME     NOT NULL DEFAULT now() COMMENT '등록일시', -- 등록일시
	mstat       INTEGER      NOT NULL DEFAULT 1 COMMENT '회원상태', -- 회원상태
	nickname    VARCHAR(50)  NULL     COMMENT '닉네임', -- 닉네임
	zipcode     VARCHAR(7)   NOT NULL COMMENT '우편번호', -- 우편번호
	addr        VARCHAR(255) NOT NULL COMMENT '기본주소', -- 기본주소
	det_addr    VARCHAR(255) NOT NULL COMMENT '상세주소' -- 상세주소
)
COMMENT '회원';

-- 회원
ALTER TABLE har_member
	ADD CONSTRAINT PK_har_member -- 회원 기본키
		PRIMARY KEY (
			mno -- 회원번호
		);

-- 회원
ALTER TABLE har_member
	ADD CONSTRAINT CK_har_member -- 회원 체크 제약
		CHECK (sex = 1 or sex = 2);

-- 회원
ALTER TABLE har_member
	ADD CONSTRAINT CK_har_member2 -- 회원 체크 제약2
		CHECK (mstat = 0 or mstat =1);

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_member
	ON har_member ( -- 회원
		email ASC -- 이메일
	);

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_har_member2
	ON har_member ( -- 회원
		nickname ASC -- 닉네임
	);

-- 회원 유니크 인덱스3
CREATE UNIQUE INDEX UIX_har_member3
	ON har_member ( -- 회원
		profile_pic ASC -- 프로필사진명
	);

-- 회원 인덱스
CREATE INDEX IX_har_member
	ON har_member( -- 회원
		name ASC -- 이름
	);

ALTER TABLE har_member
	MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 회원_알림
CREATE TABLE har_mem_alrm (
	mno      INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	alrm_no  INTEGER NOT NULL COMMENT '알림번호', -- 알림번호
	new_alrm INTEGER NOT NULL DEFAULT 1 COMMENT '새알림여부' -- 새알림여부
)
COMMENT '회원_알림';

-- 회원_알림
ALTER TABLE har_mem_alrm
	ADD CONSTRAINT PK_har_mem_alrm -- 회원_알림 기본키
		PRIMARY KEY (
			mno,     -- 회원번호
			alrm_no  -- 알림번호
		);

-- 회원_알림
ALTER TABLE har_mem_alrm
	ADD CONSTRAINT CK_har_mem_alrm -- 회원_알림 체크 제약
		CHECK (new_alrm = 0 or new_alrm = 1);

-- 회원등급
CREATE TABLE har_mrank (
	mrno     INTEGER     NOT NULL COMMENT '회원등급번호', -- 회원등급번호
	mem_rank VARCHAR(50) NOT NULL COMMENT '관리자, 회원, 튜터' -- 회원등급명
)
COMMENT '회원등급';

-- 회원등급
ALTER TABLE har_mrank
	ADD CONSTRAINT PK_har_mrank -- 회원등급 기본키
		PRIMARY KEY (
			mrno -- 회원등급번호
		);

-- 회원등급 유니크 인덱스
CREATE UNIQUE INDEX UIX_har_mrank
	ON har_mrank ( -- 회원등급
		mem_rank ASC -- 회원등급명
	);

ALTER TABLE har_mrank
	MODIFY COLUMN mrno INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원등급번호';

-- 댓글
ALTER TABLE har_comment
	ADD CONSTRAINT FK_har_member_TO_har_comment -- 회원 -> 댓글
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 댓글
ALTER TABLE har_comment
	ADD CONSTRAINT FK_har_story_TO_har_comment -- 스토리게시판 -> 댓글
		FOREIGN KEY (
			story_no -- 글번호
		)
		REFERENCES har_story ( -- 스토리게시판
			story_no -- 글번호
		);

-- 상품구매
ALTER TABLE har_purchase
	ADD CONSTRAINT FK_har_member_TO_har_purchase -- 회원 -> 상품구매
		FOREIGN KEY (
			mno -- 구매회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 상품구매
ALTER TABLE har_purchase
	ADD CONSTRAINT FK_har_pr_opt_TO_har_purchase -- 판매상품옵션 -> 상품구매
		FOREIGN KEY (
			opt_no -- 상품옵션번호
		)
		REFERENCES har_pr_opt ( -- 판매상품옵션
			opt_no -- 상품옵션번호
		);

-- 상품구매후기
ALTER TABLE har_prrv
	ADD CONSTRAINT FK_har_post_TO_har_prrv -- 글 -> 상품구매후기
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_post ( -- 글
			pno -- 글번호
		);

-- 상품구매후기
ALTER TABLE har_prrv
	ADD CONSTRAINT FK_har_purchase_TO_har_prrv -- 상품구매 -> 상품구매후기
		FOREIGN KEY (
			purc_no -- 상품옵션구매번호
		)
		REFERENCES har_purchase ( -- 상품구매
			purc_no -- 상품옵션구매번호
		);

-- 서비스기본정보
ALTER TABLE har_service
	ADD CONSTRAINT FK_har_narrow_cat_TO_har_service -- 소분류 -> 서비스기본정보
		FOREIGN KEY (
			ncat_no -- 소분류번호
		)
		REFERENCES har_narrow_cat ( -- 소분류
			ncat_no -- 소분류번호
		);

-- 서비스문의글
ALTER TABLE har_sqna
	ADD CONSTRAINT FK_har_post_TO_har_sqna -- 글 -> 서비스문의글
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_post ( -- 글
			pno -- 글번호
		);

-- 서비스문의글
ALTER TABLE har_sqna
	ADD CONSTRAINT FK_har_service_TO_har_sqna -- 서비스기본정보 -> 서비스문의글
		FOREIGN KEY (
			sno -- 서비스번호
		)
		REFERENCES har_service ( -- 서비스기본정보
			sno -- 서비스번호
		);

-- 서비스문의글
ALTER TABLE har_sqna
	ADD CONSTRAINT FK_har_member_TO_har_sqna -- 회원 -> 서비스문의글
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 서비스문의답글파일
ALTER TABLE har_srpl_file
	ADD CONSTRAINT FK_har_sqna_TO_har_srpl_file -- 서비스문의글 -> 서비스문의답글파일
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_sqna ( -- 서비스문의글
			pno -- 글번호
		);

-- 소분류
ALTER TABLE har_narrow_cat
	ADD CONSTRAINT FK_har_broad_cat_TO_har_narrow_cat -- 대분류 -> 소분류
		FOREIGN KEY (
			bcat_no -- 대분류번호
		)
		REFERENCES har_broad_cat ( -- 대분류
			bcat_no -- 대분류번호
		);

-- 수업일정
ALTER TABLE har_session
	ADD CONSTRAINT FK_har_learning_TO_har_session -- 체험학습 -> 수업일정
		FOREIGN KEY (
			lno -- 체험학습번호
		)
		REFERENCES har_learning ( -- 체험학습
			lno -- 체험학습번호
		);

-- 스토리게시판
ALTER TABLE har_story
	ADD CONSTRAINT FK_har_post_TO_har_story -- 글 -> 스토리게시판
		FOREIGN KEY (
			story_no -- 글번호
		)
		REFERENCES har_post ( -- 글
			pno -- 글번호
		);

-- 스토리게시판
ALTER TABLE har_story
	ADD CONSTRAINT FK_har_tutor_TO_har_story -- 튜터 -> 스토리게시판
		FOREIGN KEY (
			tno -- 튜터번호
		)
		REFERENCES har_tutor ( -- 튜터
			tno -- 튜터번호
		);

-- 시군구
ALTER TABLE har_sigungu
	ADD CONSTRAINT FK_har_mcityprov_TO_har_sigungu -- 광역시도 -> 시군구
		FOREIGN KEY (
			mcp_no -- 광역시도번호
		)
		REFERENCES har_mcityprov ( -- 광역시도
			mcp_no -- 광역시도번호
		);

-- 위시리스트
ALTER TABLE har_wishlist
	ADD CONSTRAINT FK_har_member_TO_har_wishlist -- 회원 -> 위시리스트
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 위시리스트
ALTER TABLE har_wishlist
	ADD CONSTRAINT FK_har_service_TO_har_wishlist -- 서비스기본정보 -> 위시리스트
		FOREIGN KEY (
			sno -- 서비스번호
		)
		REFERENCES har_service ( -- 서비스기본정보
			sno -- 서비스번호
		);

-- 장바구니
ALTER TABLE har_basket
	ADD CONSTRAINT FK_har_member_TO_har_basket -- 회원 -> 장바구니
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 장바구니
ALTER TABLE har_basket
	ADD CONSTRAINT FK_har_service_TO_har_basket -- 서비스기본정보 -> 장바구니
		FOREIGN KEY (
			sno -- 서비스번호
		)
		REFERENCES har_service ( -- 서비스기본정보
			sno -- 서비스번호
		);

-- 좋아요
ALTER TABLE har_like
	ADD CONSTRAINT FK_har_story_TO_har_like -- 스토리게시판 -> 좋아요
		FOREIGN KEY (
			story_no -- 글번호
		)
		REFERENCES har_story ( -- 스토리게시판
			story_no -- 글번호
		);

-- 좋아요
ALTER TABLE har_like
	ADD CONSTRAINT FK_har_member_TO_har_like -- 회원 -> 좋아요
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 체험학습
ALTER TABLE har_learning
	ADD CONSTRAINT FK_har_service_TO_har_learning -- 서비스기본정보 -> 체험학습
		FOREIGN KEY (
			lno -- 체험학습번호
		)
		REFERENCES har_service ( -- 서비스기본정보
			sno -- 서비스번호
		);

-- 체험학습
ALTER TABLE har_learning
	ADD CONSTRAINT FK_har_tutor_TO_har_learning -- 튜터 -> 체험학습
		FOREIGN KEY (
			tno -- 튜터번호
		)
		REFERENCES har_tutor ( -- 튜터
			tno -- 튜터번호
		);

-- 체험학습
ALTER TABLE har_learning
	ADD CONSTRAINT FK_har_sigungu_TO_har_learning -- 시군구 -> 체험학습
		FOREIGN KEY (
			sgg_no -- 시군구번호
		)
		REFERENCES har_sigungu ( -- 시군구
			sgg_no -- 시군구번호
		);

-- 체험학습신청
ALTER TABLE har_lrn_appl
	ADD CONSTRAINT FK_har_member_TO_har_lrn_appl -- 회원 -> 체험학습신청
		FOREIGN KEY (
			mno -- 신청회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 체험학습신청
ALTER TABLE har_lrn_appl
	ADD CONSTRAINT FK_har_session_TO_har_lrn_appl -- 수업일정 -> 체험학습신청
		FOREIGN KEY (
			sess_no -- 수업일정번호
		)
		REFERENCES har_session ( -- 수업일정
			sess_no -- 수업일정번호
		);

-- 체험학습후기
ALTER TABLE har_lrnrv
	ADD CONSTRAINT FK_har_lrn_appl_TO_har_lrnrv -- 체험학습신청 -> 체험학습후기
		FOREIGN KEY (
			lrn_appl_no -- 체험학습신청번호
		)
		REFERENCES har_lrn_appl ( -- 체험학습신청
			lrn_appl_no -- 체험학습신청번호
		);

-- 체험학습후기
ALTER TABLE har_lrnrv
	ADD CONSTRAINT FK_har_post_TO_har_lrnrv -- 글 -> 체험학습후기
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_post ( -- 글
			pno -- 글번호
		);

-- 체험후기추천수
ALTER TABLE har_lrnrv_rcm
	ADD CONSTRAINT FK_har_member_TO_har_lrnrv_rcm -- 회원 -> 체험후기추천수
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 체험후기추천수
ALTER TABLE har_lrnrv_rcm
	ADD CONSTRAINT FK_har_lrnrv_TO_har_lrnrv_rcm -- 체험학습후기 -> 체험후기추천수
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_lrnrv ( -- 체험학습후기
			pno -- 글번호
		);

-- 튜터
ALTER TABLE har_tutor
	ADD CONSTRAINT FK_har_member_TO_har_tutor -- 회원 -> 튜터
		FOREIGN KEY (
			tno -- 튜터번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 튜터문의게시판
ALTER TABLE har_tqna
	ADD CONSTRAINT FK_har_member_TO_har_tqna -- 회원 -> 튜터문의게시판
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 튜터문의게시판
ALTER TABLE har_tqna
	ADD CONSTRAINT FK_har_post_TO_har_tqna -- 글 -> 튜터문의게시판
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_post ( -- 글
			pno -- 글번호
		);

-- 튜터문의게시판
ALTER TABLE har_tqna
	ADD CONSTRAINT FK_har_tutor_TO_har_tqna -- 튜터 -> 튜터문의게시판
		FOREIGN KEY (
			tno -- 튜터번호
		)
		REFERENCES har_tutor ( -- 튜터
			tno -- 튜터번호
		);

-- 튜터문의답글파일
ALTER TABLE har_trpl_file
	ADD CONSTRAINT FK_har_tqna_TO_har_trpl_file -- 튜터문의게시판 -> 튜터문의답글파일
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_tqna ( -- 튜터문의게시판
			pno -- 글번호
		);

-- 튜터지역
ALTER TABLE har_tdist
	ADD CONSTRAINT FK_har_tutor_TO_har_tdist -- 튜터 -> 튜터지역
		FOREIGN KEY (
			tno -- 튜터번호
		)
		REFERENCES har_tutor ( -- 튜터
			tno -- 튜터번호
		);

-- 튜터지역
ALTER TABLE har_tdist
	ADD CONSTRAINT FK_har_sigungu_TO_har_tdist -- 시군구 -> 튜터지역
		FOREIGN KEY (
			sgg_no -- 시군구번호
		)
		REFERENCES har_sigungu ( -- 시군구
			sgg_no -- 시군구번호
		);

-- 튜터카테고리
ALTER TABLE har_tcat
	ADD CONSTRAINT FK_har_narrow_cat_TO_har_tcat -- 소분류 -> 튜터카테고리
		FOREIGN KEY (
			ncat_no -- 소분류번호
		)
		REFERENCES har_narrow_cat ( -- 소분류
			ncat_no -- 소분류번호
		);

-- 튜터카테고리
ALTER TABLE har_tcat
	ADD CONSTRAINT FK_har_tutor_TO_har_tcat -- 튜터 -> 튜터카테고리
		FOREIGN KEY (
			tno -- 튜터번호
		)
		REFERENCES har_tutor ( -- 튜터
			tno -- 튜터번호
		);

-- 파일
ALTER TABLE har_file
	ADD CONSTRAINT FK_har_post_TO_har_file -- 글 -> 파일
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_post ( -- 글
			pno -- 글번호
		);

-- 판매상품
ALTER TABLE har_product
	ADD CONSTRAINT FK_har_service_TO_har_product -- 서비스기본정보 -> 판매상품
		FOREIGN KEY (
			sno -- 판매상품번호
		)
		REFERENCES har_service ( -- 서비스기본정보
			sno -- 서비스번호
		);

-- 판매상품
ALTER TABLE har_product
	ADD CONSTRAINT FK_har_tutor_TO_har_product -- 튜터 -> 판매상품
		FOREIGN KEY (
			tno -- 튜터번호
		)
		REFERENCES har_tutor ( -- 튜터
			tno -- 튜터번호
		);

-- 판매상품사진
ALTER TABLE har_prpic
	ADD CONSTRAINT FK_har_product_TO_har_prpic -- 판매상품 -> 판매상품사진
		FOREIGN KEY (
			sno -- 판매상품번호
		)
		REFERENCES har_product ( -- 판매상품
			sno -- 판매상품번호
		);

-- 판매상품옵션
ALTER TABLE har_pr_opt
	ADD CONSTRAINT FK_har_product_TO_har_pr_opt -- 판매상품 -> 판매상품옵션
		FOREIGN KEY (
			sno -- 판매상품번호
		)
		REFERENCES har_product ( -- 판매상품
			sno -- 판매상품번호
		);

-- 판매상품후기추천수
ALTER TABLE har_prrv_rcm
	ADD CONSTRAINT FK_har_prrv_TO_har_prrv_rcm -- 상품구매후기 -> 판매상품후기추천수
		FOREIGN KEY (
			pno -- 글번호
		)
		REFERENCES har_prrv ( -- 상품구매후기
			pno -- 글번호
		);

-- 판매상품후기추천수
ALTER TABLE har_prrv_rcm
	ADD CONSTRAINT FK_har_member_TO_har_prrv_rcm -- 회원 -> 판매상품후기추천수
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 팔로우
ALTER TABLE har_follow
	ADD CONSTRAINT FK_har_member_TO_har_follow -- 회원 -> 팔로우
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 팔로우
ALTER TABLE har_follow
	ADD CONSTRAINT FK_har_tutor_TO_har_follow -- 튜터 -> 팔로우
		FOREIGN KEY (
			tno -- 튜터번호
		)
		REFERENCES har_tutor ( -- 튜터
			tno -- 튜터번호
		);

-- 회원
ALTER TABLE har_member
	ADD CONSTRAINT FK_har_mrank_TO_har_member -- 회원등급 -> 회원
		FOREIGN KEY (
			mrno -- 회원등급번호
		)
		REFERENCES har_mrank ( -- 회원등급
			mrno -- 회원등급번호
		);

-- 회원_알림
ALTER TABLE har_mem_alrm
	ADD CONSTRAINT FK_har_member_TO_har_mem_alrm -- 회원 -> 회원_알림
		FOREIGN KEY (
			mno -- 회원번호
		)
		REFERENCES har_member ( -- 회원
			mno -- 회원번호
		);

-- 회원_알림
ALTER TABLE har_mem_alrm
	ADD CONSTRAINT FK_har_alarm_TO_har_mem_alrm -- 알림 -> 회원_알림
		FOREIGN KEY (
			alrm_no -- 알림번호
		)
		REFERENCES har_alarm ( -- 알림
			alrm_no -- 알림번호
		);