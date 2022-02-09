CREATE OR REPLACE VIEW najaktivinijiStudenti as(
select s.id as student_id, a.username as student_username,count(sl.slotid)as avg_classes
from student s , slot sl , account a
where  s.id = sl.student_id and s.id = a.id
group BY s.id, a.username
having count(sl.slotid) >= 
(select avg(count(sl.slotid)) 
    from student s , slot sl 
    where  s.id = sl.student_id 
    group BY s.id)
);
CREATE OR REPLACE VIEW omiljeniProfesori as(
select distinct a.firstname, a.lastname, t.language
from najaktivinijiStudenti ns, slot s, tutor t, account a
where ns.student_id = s.student_id and s.tutor_id = t.id and a.id = t.id
);

select *
from omiljeniprofesori;
    

#region Data
	insert into ACCOUNT values(1,'Maja','Blagic','1209999185850','whatever@gmail.com','s1', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Student','Bibby');
	insert into ACCOUNT values(2,'Maja','Blagic','1209999185850','whatever@gmail.com','s2', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Student','Bibby');
	insert into ACCOUNT values(3,'Maja','Blagic','1209999185850','whatever@gmail.com','s3', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Student','Bibby');
	insert into ACCOUNT values(4,'Maja','Blagic','1209999185850','whatever@gmail.com','s4', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Student','Bibby');
	insert into ACCOUNT values(5,'Maja','Blagic','1209999185850','whatever@gmail.com','s5', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Student','Bibby');

	insert into ACCOUNT values(6,'Yoma','Yomic','1209999185850','whatever@gmail.com','t1', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Tutor','Bibby');
	insert into ACCOUNT values(7,'Yoma','Yomic','1209999185850','whatever@gmail.com','t2', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Tutor','Bibby');
	insert into ACCOUNT values(8,'Yoma','Yomic','1209999185850','whatever@gmail.com','t3', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Tutor','Bibby');
	insert into ACCOUNT values(9,'Yoma','Yomic','1209999185850','whatever@gmail.com','t4', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Tutor','Bibby');
	insert into ACCOUNT values(10,'Yoma','Yomic','1209999185850','whatever@gmail.com','t5', TO_DATE('03.12.2004:10:34:24','DD.MM.YYYY:HH24:MI:SS'),'whatever','Tutor','Bibby');

	insert into lesson_material values
	(2,'English', 'Default', 'Reading','Beginner');
	insert into lesson_material values
	(3,'German', 'Default', 'Writting','Beginner');
	insert into lesson_material values
	(4,'Spanish', 'Default', 'Speaking','Beginner');

	insert into tutor 
	values (6,1000.0,'Chinese');
	insert into tutor 
	values (7,1000.0,'Chinese');
	insert into tutor 
	values (8,1050.0,'Spanish');
	insert into tutor 
	values (9,1010.0,'English');
	insert into tutor 
	values (10,1200.0,'Chinese');

	insert into exam 
	values(1, 1,'01-JAN-22','01-JAN-22',0,0,'whatever');
	insert into exam 
	values(2, 1,'01-JAN-22','01-JAN-22',50,0,'whatever');
	insert into exam 
	values(3, 1,'01-JAN-22','01-JAN-22',40,0,'whatever');
	insert into exam 
	values(4, 1,'01-JAN-22','01-JAN-22',100,0,'whatever');
	insert into exam 
	values(5, 1,'01-JAN-22','01-JAN-22',40,0,'whatever');



	insert into slot
	values (14,'03-DEC-04','03-DEC-04',7,1);
	insert into slot
	values (15,'03-DEC-04','03-DEC-04',7,1);
	insert into slot
	values (16,'03-DEC-04','03-DEC-04',7,1);
	insert into slot
	values (17,'03-DEC-04','03-DEC-04',7,1);
	insert into slot
	values (18,'03-DEC-04','03-DEC-04',7,1);

	insert into slot
	values (19,'03-DEC-04','03-DEC-04',7,5);
	insert into slot
	values (20,'03-DEC-04','03-DEC-04',7,5);
	insert into slot
	values (21,'03-DEC-04','03-DEC-04',7,5);
	insert into slot
	values (22,'03-DEC-04','03-DEC-04',7,5);


	insert into slot
	values (23,'03-DEC-04','03-DEC-04',7,4);
	insert into slot
	values (24,'03-DEC-04','03-DEC-04',7,4);
	insert into slot
	values (25,'03-DEC-04','03-DEC-04',7,4);
	insert into slot
	values (26,'03-DEC-04','03-DEC-04',7,4);


	insert into selects_material
	values (7,1,1);

	insert into selects_material
	values (7,2,1);

	insert into selects_material
	values (7,2,1);

	insert into selects_material
	values (7,3,1);

	insert into selects_material
	values (7,4,1);

	insert into selects_material
	values (7,5,1);

	insert into selects_material
	values (7,6,1);

	insert into selects_material
	values (7,7,1);

	insert into selects_material
	values (7,8,1);

	insert into selects_material
	values (7,9,1);
	insert into selects_material
	values (7,10,1);
	insert into selects_material
	values (7,11,1);
	insert into selects_material
	values (7,12,1);
	insert into selects_material
	values (7,13,1);

	insert into selects_material
	values (10,23,3);
	insert into selects_material
	values (10,24,3);
	insert into selects_material
	values (10,25,3);
	insert into selects_material
	values (10,26,3);


	values (10,26,3);

#endregion
