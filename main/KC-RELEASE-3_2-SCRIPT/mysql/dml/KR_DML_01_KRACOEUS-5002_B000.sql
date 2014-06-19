DELIMITER /
INSERT INTO KRNS_PARM_T (NMSPC_CD, PARM_DTL_TYP_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, TXT, PARM_DESC_TXT, CONS_CD, APPL_NMSPC_CD)
VALUES ('KC-AWARD', 'Document', 'AwardPaymentScheduleActiveLinks', UUID(), 1, 'CONFG', 'Y', 'Award Payment Schedule: Determines how users enter the Preparer and Status values. The object field is followed by the database field in parentheses.  N = Enter text for Preparer: submittedBy (SUBMITTED_BY) and Status: status (STATUS).  Y = Active links to Person table for Preparer: submittedByPersonId (SUBMITTED_BY_PERSON_ID) and Report Status table for Status: reportStatusCode (REPORT_STATUS_CODE).', 'A', 'KC')
/
DELIMITER ;
