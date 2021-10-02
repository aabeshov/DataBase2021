
--1
--a
SELECT * FROM course where course.credits > 3;
--b
SELECT * FROM classroom WHERE classroom.building = 'Watson' or  classroom.building = 'Packard';
--c
SELECT * FROM course where course.dept_name = 'Comp. Sci.';
--d
SELECT course.* FROM course inner join section on course.course_id = section.course_id where section.semester = 'Fall';
--e
SELECT * FROM student where tot_cred between 45 and 90;
--f
SELECT * from student where name similar to '%(a|e|i|o|u|y)';
--g
SELECT course.* FROM course inner join prereq on course.course_id = prereq.course_id where prereq_id ='CS-101';


--2
--a
SELECT dept_name,AVG(salary) from instructor GROUP BY dept_name ;
--b
SELECT section.building,count(section.building) from classroom,section where classroom.building = section.building group by section.building order by count(section.building) desc limit 1;
--c
SELECT course.dept_name, count(dept_name) FROM course GROUP BY  dept_name order by count(dept_name) asc limit 1;
--d
SELECT student.id, student.name from student,takes where student.id = takes.id and student.dept_name ='Comp. Sci.' GROUP BY student.id HAVING count(takes.id) > 3;
--e
SELECT instructor.* from instructor where instructor.dept_name = 'Music' or dept_name = 'Biology';
--f
SELECT instructor.*,teaches.year from instructor,teaches where instructor.id = teaches.id and teaches.year > 2017;

--3
--a
SELECT student.* from student,takes where student.id = takes.id and student.dept_name ='Comp. Sci.' and (takes.grade = 'A' or takes.grade ='A-') group by student.id order by name asc;
--b
SELECT instructor.* from student,advisor,takes,instructor where i_id = instructor.id and student.id = advisor.s_id and (takes.grade = 'B-' or takes.grade ='C' or takes.grade ='C-' or takes.grade ='F') group by instructor.id;
--c
SELECT department.* from department,takes,course where takes.course_id = course.course_id and department.dept_name = course.dept_name and (takes.grade != 'C' or takes.grade !='C+' or takes.grade != 'C-' or takes.grade != 'F') GROUP BY department.dept_name;
--d
SELECT instructor.* from instructor,takes,teaches where instructor.id = teaches.id and takes.course_id = teaches.course_id and (takes.grade != 'A' or takes.grade !='A-')group by instructor.id;
--e
SELECT course.*from course,time_slot,section WHERE section.time_slot_id = time_slot.time_slot_id and time_slot.end_hr < 13 and course.course_id = section.course_id group by course.course_id

