TRUNCATE TABLE PROTOCOL_ORG_TYPE DROP STORAGE
/
INSERT INTO PROTOCOL_ORG_TYPE (PROTOCOL_ORG_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','Performing Organization','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ORG_TYPE (PROTOCOL_ORG_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','External','admin',SYSDATE,SYS_GUID(),1)
/
