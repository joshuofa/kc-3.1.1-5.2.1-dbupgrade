DELIMITER /
--
--

INSERT INTO KRCR_PARM_T (APPL_ID,NMSPC_CD,CMPNT_CD,PARM_NM,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,OBJ_ID) 
VALUES ('KC','KC-AWARD','Document','AWARD_DISCLOSE_STATUS_CODES',1,'CONFG','1;3;5','Award status codes a coi disclosure event will be considered active.','A',UUID())
/

DELIMITER ;
