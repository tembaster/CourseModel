DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS professors CASCADE;
DROP TABLE IF EXISTS STUDENTS CASCADE;
DROP TABLE IF EXISTS professor_course CASCADE;
DROP TABLE IF EXISTS course_progress CASCADE;
DROP TABLE IF EXISTS STUDENT_COURSE CASCADE;

DROP SEQUENCE IF EXISTS GLOBAL_SEQ;

CREATE SEQUENCE GLOBAL_SEQ START WITH 100000;

CREATE TABLE STUDENTS (
    id              INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    name            VARCHAR(255)        NOT NULL,
    address         VARCHAR(255)        NOT NULL,
    phone           VARCHAR(10)         NOT NULL,
    email           VARCHAR(255)        NOT NULL,
    student_number  INTEGER             NOT NULL,
    avg_performance DOUBLE              NOT NULL
);

CREATE TABLE PROFESSORS
(
    id              INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    name            VARCHAR(255)    NOT NULL,
    address         VARCHAR(255)    NOT NULL,
    phone           VARCHAR(10)     NOT NULL,
    payment         FLOAT           NOT NULL
);

CREATE TABLE COURSES
(
    id              INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    name            VARCHAR(255)    NOT NULL,
    number          INTEGER         NOT NULL,
    price           FLOAT           NOT NULL
);

CREATE TABLE course_progress
(
    id              INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    student_id      INTEGER         NOT NULL,
    course_id       INTEGER         NOT NULL,
    mark            INTEGER         NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

CREATE TABLE professor_course
(
    professor_id    INTEGER         NOT NULL,
    course_id       INTEGER         NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professors(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);