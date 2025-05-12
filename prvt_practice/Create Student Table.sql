--요구사항: id (정수형, 기본 키)와 name (텍스트형, NULL 불가) 컬럼을 가진 students 테이블을 생성하는 SQL 문을 작성하세요.
create table students(
  id integer primary key,
  name text not null
);