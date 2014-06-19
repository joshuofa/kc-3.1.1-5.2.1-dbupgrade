INSERT INTO KRNS_PARM_T (APPL_NMSPC_CD,CONS_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_DTL_TYP_CD,PARM_NM,PARM_TYP_CD,TXT,VER_NBR)
  VALUES ('KC','A','KC-NEGOTIATION',SYS_GUID(),'A Negotiation Documet Overview','Document','negotiationNegotiationHelp','HELP','default.htm?turl=Documents/negotiation1.htm',1)
/

INSERT INTO KRNS_PARM_T (APPL_NMSPC_CD,CONS_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_DTL_TYP_CD,PARM_NM,PARM_TYP_CD,TXT,VER_NBR)
  VALUES ('KC','A','KC-NEGOTIATION',SYS_GUID(),'A Negotiation Description','Document','negotiation','HELP','default.htm?turl=Documents/negotiation2.htm',1)
/

INSERT INTO KRNS_PARM_T (APPL_NMSPC_CD,CONS_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_DTL_TYP_CD,PARM_NM,PARM_TYP_CD,TXT,VER_NBR)
  VALUES ('KC','A','KC-NEGOTIATION',SYS_GUID(),'Negotiation Activities and Attachments','Document','negotiationActivitiesHelp','HELP','default.htm?turl=Documents/activitiesattachments.htm',1)
/

INSERT INTO KRNS_PARM_T (APPL_NMSPC_CD,CONS_CD,NMSPC_CD,OBJ_ID,PARM_DESC_TXT,PARM_DTL_TYP_CD,PARM_NM,PARM_TYP_CD,TXT,VER_NBR)
  VALUES ('KC','A','KC-NEGOTIATION',SYS_GUID(),'Negotiation Medusa','Document','negotiationMedusaHelp','HELP','default.htm?turl=Documents/medusa5.htm',1)
/

UPDATE KRNS_PARM_T
SET TXT = 'default.htm?turl=Documents/customattribute.htm'
WHERE NMSPC_CD = 'KC-PD'
AND PARM_DTL_TYP_CD = 'Document'
AND PARM_NM = 'proposalDevelopmentCustomAttributeHelpUrl'
/
