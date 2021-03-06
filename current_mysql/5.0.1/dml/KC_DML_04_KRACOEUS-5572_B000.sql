DELIMITER /
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,RULE_ID,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID) 
select (SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID) QUESTIONNAIRE_QUESTIONS_ID,
(select max(QUESTIONNAIRE_REF_ID) from QUESTIONNAIRE where QUESTIONNAIRE_ID=5 and SEQUENCE_NUMBER=1) QUESTIONNAIRE_REF_ID_FK,
(SELECT max(QUESTION_REF_ID) FROM QUESTION WHERE QUESTION_ID=129 AND SEQUENCE_NUMBER=1) QUESTION_REF_ID_FK,
279,0,'N','4',null,'KC144',NOW(), 'admin',18,1,UUID() from dual
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,RULE_ID,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID) 
select (SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID) QUESTIONNAIRE_QUESTIONS_ID,
(select max(QUESTIONNAIRE_REF_ID) from QUESTIONNAIRE where QUESTIONNAIRE_ID=5 and SEQUENCE_NUMBER=1) QUESTIONNAIRE_REF_ID_FK,
(SELECT max(QUESTION_REF_ID) FROM QUESTION WHERE QUESTION_ID=130 AND SEQUENCE_NUMBER=1) QUESTION_REF_ID_FK,
280,279,'Y','4','Y','KC149',NOW(), 'admin',1,1,UUID() from dual
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,RULE_ID,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID) 
select (SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID) QUESTIONNAIRE_QUESTIONS_ID,
(select max(QUESTIONNAIRE_REF_ID) from QUESTIONNAIRE where QUESTIONNAIRE_ID=5 and SEQUENCE_NUMBER=1) QUESTIONNAIRE_REF_ID_FK,
(SELECT max(QUESTION_REF_ID) FROM QUESTION WHERE QUESTION_ID=131 AND SEQUENCE_NUMBER=1) QUESTION_REF_ID_FK,
281,279,'Y','4','N','KC142',NOW(), 'admin',2,1,UUID() from dual
/
commit
/

DELIMITER ;
