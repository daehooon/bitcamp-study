---------------------------- 회원 (mrno = 1관리자, 2튜터, 3회원)
insert into har_member (mno, email, password, name, nickname, profile_pic,
bdate, tel, sex, zipcode, addr, det_addr, mrno)
values (1, 'bit1@naver.com', password('1111'), '김비트1', '왕만두왕1', 'kimbit1.gif',
'1991-01-01', '010-1111-1111', 1, '111-11', '서울 은평구 무슨대로1-11 땡땡아파트', '101동 101호', 2);

insert into har_member (mno, email, password, name, nickname, profile_pic,
bdate, tel, sex, zipcode, addr, det_addr, mrno)
values (2, 'bit2@naver.com', password('1111'), '김비트2', '왕만두왕2', 'kimbit2.gif',
'1992-02-02', '010-2222-2222', 2, '222-22', '서울 강남구 아하대로2-22 하하아파트', '202동 202호', 2);

-- nickname, profile_pic, det_addr = NULL (테스트용)
insert into har_member (mno, email, password, name,
bdate, tel, sex, zipcode, addr, mrno)
values (3, 'bit3@naver.com', password('1111'), '김비트3',
'1993-03-03', '010-3333-3333', 1, '333-33', '경기 구리 야옹대로3-33 야옹주택', 2);

insert into har_member (mno, email, password, name, nickname, profile_pic,
bdate, tel, sex, zipcode, addr, det_addr, mrno)
values (4, 'bit4@naver.com', password('1111'), '김비트4', '왕만두왕4', 'kimbit4.gif',
'1994-04-04', '010-4444-4444', 2, '444-44', '경기 양주 우효대로4-44 우효아파트', '404동 404호', 1);

insert into har_member (mno, email, password, name, nickname, profile_pic,
bdate, tel, sex, zipcode, addr, det_addr, mrno)
values (5, 'bit5@naver.com', password('1111'), '김비트5', '왕만두왕5', 'kimbit5.gif',
'1995-05-05', '010-5555-5555', 1, '555-55', '경기 의정부 요호대로5-55 요호아파트', '505동 505호', 3);

---------------------------- 튜터
insert into har_tutor (tno, tintro, tappl)
values (1, '안녕하세요1', 'test1.hwp');

insert into har_tutor (tno, tintro, tappl)
values (2, '안녕하세요2', 'test2.hwp');

insert into har_tutor (tno, tintro, tappl)
values (3, '안녕하세요3', 'test3.hwp');

---------------------------- 서비스기본정보
insert into har_service (sno, sname, sintro, cov_img, ncat_no)
values (1, '도예 공방 원데이 / 도자기 그릇 만들기 (예약가능)', 
'우리에게 친숙한 소재인 흙을 통해 도예와 관련된 문화와 기술을 공유하며 다양한 작품 활동을 통해 폭넓은 창작의 세계를 경험하실 수 있습니다.',
'test1.jepg', 1);

insert into har_service (sno, sname, sintro, cov_img, ncat_no)
values (2, '석고 방향제 만들고 채색까지 (예약 가능)', 
'우리는 바쁘게 일하고, 휴가 기간에 재충전을 한 후 다시 내 자신을 알지도 못한채 일상을 살아가요.',
'test2.jepg', 2);

insert into har_service (sno, sname, sintro, cov_img, ncat_no)
values (3, '최상급 프랑스 향료로 나만의 향수 만들기 (예약 가능)', 
'나를 위한, 혹은 누군가를 위한 세상에 단 하나뿐인 특별한 향을 만들어 보세요 :D',
'test3.jepg', 3);

---------------------------- 체험학습
insert into har_learning (lno, sgg_no, min_head, max_head, curriculum, price, zipcode, addr, det_addr, tno, rfnd_info)
values (1, 1, 1, 1, '진행순서1', 11100, '111-11', '경기 수원 야호대로1-11 야호아파트', '101동 1101호', 1, '환불정보1');

insert into har_learning (lno, sgg_no, min_head, max_head, curriculum, price, zipcode, addr, det_addr, tno, rfnd_info)
values (2, 2, 1, 2, '진행순서2', 22200, '222-22', '경기 가평 오호라대로2-22 오호라아파트', '202동 2202호', 2, '환불정보2');

-- det_addr = NULL (테스트용)
insert into har_learning (lno, sgg_no, min_head, max_head, curriculum, price, zipcode, addr, tno, rfnd_info)
values (3, 3, 1, 3, '진행순서3', 33300, '333-33', '경기 남양주 와우대로3-33 와우주택', 3, '환불정보3');

---------------------------- 수업일정
insert into har_schedule (sche_no, lno, date, stm, etm)
values (1, 1, '2021-1-1', '11:00:10', '11:30:10');

insert into har_schedule (sche_no, lno, date, stm, etm)
values (2, 2, '2021-2-2', '12:00:20', '12:30:20');

insert into har_schedule (sche_no, lno, date, stm, etm)
values (3, 3, '2021-3-3', '13:00:30', '13:30:30');
