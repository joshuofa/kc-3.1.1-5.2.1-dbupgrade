INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'billingElement','Billing Element',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'String'),40,null,null,'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'costSharingBudget','Cost Sharing Budget',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'String'),30,null,null,'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'numberOfTrainees','# of Trainees',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'Number'),6,null,null,'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'graduateStudentCount','Graduate Student Count',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'Number'),6,null,null,'Personnel Items for Review','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'tenured','Tenured',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'String'),30,'org.kuali.kra.bo.KcPerson','userName','Personnel Items for Review','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'exportControls','Export Controls',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'String'),30,null,null,'Project Details','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'inventions','Inventions',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'String'),30,'org.kuali.kra.bo.KcPerson','userName','Project Details','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'localReviewDate','Local Review Date',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'Date'),10,null,null,'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'courseName','Course Name',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'String'),80,null,null,'Course Related','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO CUSTOM_ATTRIBUTE (ID,NAME,LABEL,DATA_TYPE_CODE,DATA_LENGTH,LOOKUP_CLASS,LOOKUP_RETURN,GROUP_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_CUSTOM_ATTRIBUTE.NEXTVAL,'instructorName','Instructor Name',(SELECT DATA_TYPE_CODE FROM CUSTOM_ATTRIBUTE_DATA_TYPE WHERE DESCRIPTION = 'String'),80,'org.kuali.kra.bo.KcPerson','fullName','Course Related','admin',SYSDATE,SYS_GUID(),1)
/
