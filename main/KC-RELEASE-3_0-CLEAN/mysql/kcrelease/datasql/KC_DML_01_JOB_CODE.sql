delimiter /
TRUNCATE TABLE JOB_CODE
/
INSERT INTO JOB_CODE (JOB_CODE,JOB_TITLE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('AA000','DEFAULT','admin',NOW(),UUID(),1)
/
delimiter ;
