-- postgresql

DROP TABLE  if exists LECTURES_TBL;
CREATE TABLE LECTURES_TBL ( 
    LECTURE_ID INTEGER UNIQUE NOT NULL,
 	LECTURE_NAME VARCHAR(10) NOT NULL,       
    PROFESSOR_NAME VARCHAR(10),
    STUDENTS INTEGER[ ] NULL,
    PRIMARY KEY (LECTURE_ID)
);

DROP TABLE  if exists STUDENT_INFO_TBL;
CREATE TABLE STUDENT_INFO_TBL (
    STUDENT_ID INTEGER NOT NULL,
    STUDENT_NAME VARCHAR(10) NOT NULL,
    GRADE INTEGER NOT NULL,
	MAJOR VARCHAR(10) NOT NULL
);

INSERT INTO STUDENT_INFO_TBL VALUES
	(20200001, '홍짜장', 4, '통계학과'),
	(20220001, '이수자', 2, '통계학과'),
	(20230001, '정대만', 1, '통계학과'),
	(20220002, '한소희', 2, '성악과'),
	(20210001, '박수근', 3, '통계학과'),
	(20200002, '장원영', 4, '성악과'),
	(20200003, '임시완', 4, '성악과');

INSERT INTO LECTURES_TBL VALUES 
    (101, '수리통계학', '김철수', ARRAY[20220001, 20200001, 20210001]),
    (102, '보험통계학', '이영미', ARRAY[20200001, 20230001]),
    (103, '근대철학의이해', '박칸트', NULL),
    (104, '알고리즘', '조권익', ARRAY[20220001, 20230001, 20220002]),
    (105, '미디어이해', '박진영', ARRAY[20200001, 20200002, 20200003]);
    
-- 1번 문제 정답  
SELECT lecture_id, lecture_name, professor_name,
   unnest(students) AS students
   FROM LECTURES_TBL;

-- 2번 문제 정답
WITH
lectures AS
   (SELECT lecture_id, lecture_name, professor_name,
   unnest(students) AS students
   FROM LECTURES_TBL)
SELECT S.student_id, S.student_name, S.grade, S.major,
   L.lecture_name AS lecture_name
FROM STUDENT_INFO_TBL AS S 
   LEFT JOIN lectures AS L
   ON S.student_id = L.students
   ORDER BY S.student_id
   ;

