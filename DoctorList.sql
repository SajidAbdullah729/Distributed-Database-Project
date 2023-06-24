
/* 
VIEW 

*/\\


DROP VIEW DOCTOR_WITH_TOTAL_APPOINTMENT;
DROP VIEW PATIENT_WITH_TOTAL_APPOINTMENT;


CREATE VIEW Doctor_WITH_TOTAL_APPOINTMENT AS
select doctor_name AS Doctors,count(appointment_id) AS "Total Patients " from (SELECT *
FROM doctorlistone
Inner JOIN Appointmentone
ON doctorlistone.doctor_id = appointmentone.doctor_id) group by doctor_name  ;

CREATE VIEW PATIENT_WITH_TOTAL_APPOINTMENT AS
select patient_name,count(*) as "Total Doctor" from appointmentone group by patient_name ;



SELECT * FROM DOCTOR_WITH_TOTAL_APPOINTMENT;
SELECT * FROM PATIENT_WITH_TOTAL_APPOINTMENT;


/*
Accept p_x number prompt 'Enter id ';
Declare 
 q NUMBER:=&p_x;
 q2 APPOINTMENT%ROWTYPE; 
Begin
  
 select * into q2 from appointment where appointment_id=q;
 DBMS_OUTPUT.PUT_LINE('oUTRE: '||q2.appointment_id);
 
END;
/

d
 


DECLARE
       a integer;
       b integer;
    BEGIN

	   
       a:=&a;
	   
       b:=&b;
       dbms_output.put_line('The a value is : ' || a);
       dbms_output.put_line('The b value is : ' || b);
    END;
   /
   
   
   
   
accept x number prompt 'Please enter something: '
declare 
  a number;
begin
  a := &x;
end;
/ 

*/



/*
Procedure
*/
DROP PROCEDURE PATIENT_DETAILS;
CREATE OR REPLACE PROCEDURE Patient_Details
AS 
   
BEGIN 


   DBMS_OUTPUT.PUT_LINE( 'Patient_name' || ' ' || 'Patient Age ' || ' ' || '        Contact'  );
   
   for R in (Select * from appointment )  LOOP
     DBMS_OUTPUT.PUT_LINE( R.patient_name || '         ' || R.patient_age || '                ' || R.patient_contact || '           ' ); 
   END LOOP;
   
END; 
/ 

declare 




BEGIN
  
  Patient_Details;
end;
/ 

/*
FUNCTION
*/
set serveroutput on;
set verify off;
CREATE OR REPLACE FUNCTION TotalPatients 
RETURN number IS 
   total number(2) := 0; 
BEGIN 
   SELECT  distinct count(patient_name) into total 
   FROM Appointment; 
    /*DBMS_OUTPUT.put_line(total);*/
   RETURN total; 
   EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
   
END; 
/ 
declare
   p number(2);
begin
    p := TotalPatients();
    DBMS_OUTPUT.PUT_LINE('Total Patients ' || p);   
end;
/

/*

Cursors
*/




DECLARE 
   p_name Appointmentone.patient_name%type; 
   p_age APPOINTMENTone.patient_age%type; 
   p_contact Appointmentone.patient_contact%type; 
   CURSOR patients is 
      SELECT patient_name, patient_age, patient_contact FROM Appointmentone; 
BEGIN 
   OPEN patients; 
   LOOP 
   FETCH patients into p_name, p_age, p_contact; 
      EXIT WHEN patients%notfound; 
      IF p_age>20 then
	  dbms_output.put_line(p_name || ' ' || p_age || ' ' || p_contact);
      end if;	  
   END LOOP; 
   CLOSE patients; 
END; 
/

select * from appointment;

 insert into doctorlist@mahi_link values(230,'Dr.M','Heart','FCPS');
 commit;
 
 
	insert into DoctorListone values	( 1 ,'Dr.Solaiman',                                        'Medicine',                                           'FCPS');
    insert into DoctorListone values    ( 2, 'Dr.Karim' ,                                          'Medicine',                                           'MBBS,BCS');
    insert into DoctorListone values (3 ,'Dr.Jashim'                                     ,     'Medicine'                                         ,  'FCPS');
	
     insert into DoctorListone values    (4 ,'Dr.Selim',                                           'Medicine' ,                                          'FCPS');
      insert into DoctorListone values   (5, 'Dr.Solaiman'   ,                                     'Medicine',                                           'FCPS');
      insert into DoctorListone values (535, 'Dr.M'                                                ,'Medicine',                                          'FCPS'); 