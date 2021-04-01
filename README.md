### 메모
    jdk, eclipse 업데이트하기

```
create table x_board(
    board_id int not null,
    title varchar(255) not null,
    contents text not null,
    created_date datetime default now(),
    view_count int default 0
);

alter table x_board
    add constraint x_board_pk primary key(board_id);

alter table x_board
    modify column board_id int not null auto_increment;
```
