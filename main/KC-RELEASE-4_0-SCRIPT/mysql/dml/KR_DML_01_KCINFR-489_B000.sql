DELIMITER /
UPDATE KRCR_PARM_T
SET VAL = 'default.htm?turl=Documents/keywords2.htm',
     PARM_DESC_TXT = 'Award Keywords Help'
WHERE PARM_NM = 'awardKeywordHelpUrl'
 AND CMPNT_CD = 'Document' 
 AND NMSPC_CD = 'KC-AWARD'
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Unit Contact Help','awardUnitContactsHelpUrl','HELP','default.htm?turl=Documents/unitcontacts1.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Sponsor Contact Help','awardSponsorContactsHelpUrl','HELP','default.htm?turl=Documents/sponsorcontacts.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Central Admin Help','awardCentralAdminContactsHelpUrl','HELP','default.htm?turl=Documents/centraladministrationcontacts1.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Budget Limits Help','awardBudgetLimitsHelpUrl','HELP','default.htm?turl=Documents/budgetlimits.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Budget Overview Help','awardBudgetOverviewHelpUrl','HELP','default.htm?turl=Documents/budgetoverview3.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Payments and Invoices Help','awardPaymentsandInvoicesHelpUrl','HELP','default.htm?turl=Documents/paymentsinvoices.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Reports Help','awardReportsHelpUrl','HELP','default.htm?turl=Documents/reports.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Special Approval Help','awardSpecialApprovalHelpUrl','HELP','default.htm?turl=Documents/specialapproval.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Closeout Help','awardCloseOutHelpUrl','HELP','default.htm?turl=Documents/closeout.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Special Review Help','awardSpecialReviewHelpUrl','HELP','default.htm?turl=Documents/specialreview4.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Actions Help','awardActionsHelpUrl','HELP','default.htm?turl=Documents/awardactions.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Data Validation Help','awardDataValidationHelpUrl','HELP','default.htm?turl=Documents/datavalidation4.htm',1)
/
INSERT INTO KRCR_PARM_T (APPL_ID,CMPNT_CD,EVAL_OPRTR_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_NM,PARM_TYP_CD,VAL,VER_NBR)
  VALUES ('KC','Document','A','KC-AWARD',UUID(),'Award Medusa Help','awardMedusaHelpUrl','HELP','default.htm?turl=Documents/medusa3.htm',1)
/

DELIMITER ;
