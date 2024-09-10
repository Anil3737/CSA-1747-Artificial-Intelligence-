% Facts
student(enrollment_id1, john_doe).
student(enrollment_id2, jane_smith).
student(enrollment_id3, michael_jones).

teacher(teacher_id1, mary_parker).
teacher(teacher_id2, robert_harris).
teacher(teacher_id3, emily_wilson).

subject(subject_code1, math).
subject(subject_code2, science).
subject(subject_code3, literature).

% Relationships
enrolled(enrollment_id1, subject_code1).
enrolled(enrollment_id1, subject_code2).
enrolled(enrollment_id2, subject_code2).
enrolled(enrollment_id3, subject_code3).

teaches(teacher_id1, subject_code1).
teaches(teacher_id2, subject_code2).
teaches(teacher_id3, subject_code3).

% Rules
student_teacher_subject(Student, Teacher, Subject) :-
    enrolled(StudentID, SubjectCode),
    teaches(TeacherID, SubjectCode),
    student(StudentID, Student),
    teacher(TeacherID, Teacher),
    subject(SubjectCode, Subject).
