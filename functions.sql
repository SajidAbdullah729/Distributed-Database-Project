set serveroutput on;
set verify off;
drop function totalpatients;
CREATE OR REPLACE FUNCTION TotalPatients 
RETURN number IS 
   total number(2) := 0; 
BEGIN 
   SELECT  distinct count(patient_name) into total 
   FROM Appointmentone; 
    /*DBMS_OUTPUT.put_line(total);*/
   RETURN total; 
   EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such Patient!'); 
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
commit;

drop function totalpatients_medicine;
CREATE OR REPLACE FUNCTION TotalPatients_medicine 
RETURN number IS 
   total number(2) := 0; 
BEGIN 
   SELECT  distinct count(patient_name) into total 
   FROM Appointmentone; 
    /*DBMS_OUTPUT.put_line(total);*/
   RETURN total; 
   EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such patient!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
   
END; 
/ 
declare
   p number(2);
begin
    p :=totalpatients_medicine();
    DBMS_OUTPUT.PUT_LINE('Total Patients ' || p);   
end;
/
commit;




