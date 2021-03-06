package ru.tembaster.courses.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Entity
@Table(name = "course_progress")
public class CourseProgress extends AbstractBaseEntity {

    @ManyToOne
    @JoinColumn(name = "student_id", insertable = false, updatable = false)
    private Student student;

    @ManyToOne
    @JoinColumn(name = "course_id", insertable = false, updatable = false)
    private Course course;

    @Setter
    @Column(name = "mark")
    private Integer mark;

    public CourseProgress(Student student, Course course) {
        this.student = student;
        this.course = course;
        student.getCourses().add(this);
        course.getStudents().add(this);
    }

    public CourseProgress() {

    }
}
