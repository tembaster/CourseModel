DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS professors CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS professor_course CASCADE;
DROP TABLE IF EXISTS student_course CASCADE;
DROP TABLE IF EXISTS course_progress CASCADE;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START WITH 100000;

CREATE TABLE students (
    id              INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    name            VARCHAR(255)        NOT NULL,
    address         VARCHAR(255)        NOT NULL,
    phone           VARCHAR(10)         NOT NULL,
    email           VARCHAR(255)        NOT NULL,
    student_number  INTEGER             NOT NULL,
    avg_performance FLOAT               NOT NULL
);

CREATE TABLE professors
(
    id              INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
    name            VARCHAR(255)    NOT NULL,
    address         VARCHAR(255)    NOT NULL,
    phone           VARCHAR(10)     NOT NULL,
    payment         FLOAT           NOT NULL
);

CREATE TABLE courses
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
    grade           INTEGER         NOT NULL,
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

CREATE TABLE student_course
(
    student_id      INTEGER         NOT NULL,
    course_id       INTEGER         NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);