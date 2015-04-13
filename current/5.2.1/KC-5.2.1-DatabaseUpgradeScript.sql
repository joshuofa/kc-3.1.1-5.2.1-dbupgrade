-- ignore the & character inside insert statements
SET DEFINE OFF

-- ====================================================================================================================
-- 2)  Activate Role 'Award Modifier' (1124); Change 'Active?' flag to Yes. 
-- ====================================================================================================================

update KRIM_ROLE_T set ACTV_IND='Y' where NMSPC_CD='KC-AWARD' and ROLE_NM='Award Modifier'
;

-- ====================================================================================================================
-- 3) UAR-539: Add permissions to 'SPS Management' Role (1221). 
-- ====================================================================================================================

-- 'Modify Award Report Tracking' (Permission ID: 1274) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='SPS Management' and NMSPC_CD='KC-ADM'),
    (select PERM_ID from KRIM_PERM_T where NM='Modify Award Report Tracking' and NMSPC_CD='KC-AWARD'),
    'Y')
;

-- 'Modify Proposal Rates' (Permission ID: 1254) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='SPS Management' and NMSPC_CD='KC-ADM'),
    (select PERM_ID from KRIM_PERM_T where NM='Modify Proposal Rates' and NMSPC_CD='KC-PD'),
    'Y')
;

-- Create Negotiation (1268) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
   (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='SPS Management' and NMSPC_CD='KC-ADM'),
   (select PERM_ID from KRIM_PERM_T where NM='CREATE NEGOTIATION' and NMSPC_CD='KC-NEGOTIATION'), 
   'Y')
;

-- Modify Negotiation (1269) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
   (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='SPS Management' and NMSPC_CD='KC-ADM'),
   (select PERM_ID from KRIM_PERM_T where NM='MODIFY NEGOTIATION' and NMSPC_CD='KC-NEGOTIATION'),
   'Y')
;

-- Modify Negotiation (1270) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
   (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='SPS Management' and NMSPC_CD='KC-ADM'),
   (select PERM_ID from KRIM_PERM_T where NM='CREATE ACTIVITIES' and NMSPC_CD='KC-NEGOTIATION'),
   'Y')
;

-- Modify Activities (1271) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='SPS Management' and NMSPC_CD='KC-ADM'), 
    (select PERM_ID from KRIM_PERM_T where NM='MODIFY ACTIVITIES' and NMSPC_CD='KC-NEGOTIATION'),
    'Y')
;

-- View Negotiation - Unrestricted (1272) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
   (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='SPS Management' and NMSPC_CD='KC-ADM'), 
   (select PERM_ID from KRIM_PERM_T where NM='VIEW NEGOTIATION - UNRESTRICTED' and NMSPC_CD='KC-NEGOTIATION'),
   'Y')
;



-- ====================================================================================================================
--  ***NO LONGER REQUIRED ***
-- 4)  Add 'SPS Management' Role (1221) to Amy Dougherty's Person record (doughera).
-- ====================================================================================================================

-- insert into krim_role_mbr_t ( role_mbr_id, ver_nbr, obj_id, role_id, mbr_id, mbr_typ_cd, actv_frm_dt, actv_to_dt ) 
--   select KRIM_ROLE_MBR_ID_S.NEXTVAL, 1, SYS_GUID(), '1221', prncpl_id, 'P', null, null 
--   from krim_entity_cache_t 
--   where prncpl_nm = 'doughera'
-- ;

-- ====================================================================================================================
-- NOT NEEDED ANY LONGER DUE TO 25.
-- 5)  Add 'Negotiation Administrator' Role (1250) to the Person Record's of Kari Robertson (kroberston), Amy Dougherty 
--     (doughera), and Jessica Peck (peck)
-- ====================================================================================================================

--insert into krim_role_mbr_t ( role_mbr_id, ver_nbr, obj_id, role_id, mbr_id, mbr_typ_cd, actv_frm_dt, actv_to_dt ) 
--  select KRIM_ROLE_MBR_ID_S.NEXTVAL, 1, SYS_GUID(), '1250', prncpl_id, 'P', null, null 
--  from krim_entity_cache_t 
--  where prncpl_nm = 'doughera' or prncpl_nm = 'krobertson' or prncpl_nm = 'peck'
--;


-- ====================================================================================================================
-- 6)  Disable (set value to N) the following IACUC linking parameters: iacuc.protocol.award.linking.enabled, 
--     iacuc.protocol.institute.proposal.linking.enabled, iacuc.protocol.proposal.development.linking.enabled 
-- ====================================================================================================================

update KRCR_PARM_T set val='N' 
  where parm_nm in ('iacuc.protocol.award.linking.enabled','iacuc.protocol.institute.proposal.linking.enabled','iacuc.protocol.proposal.development.linking.enabled')
;


-- ====================================================================================================================
-- 7)  Deactivate all OOTB Notifications - UAR-658
-- ====================================================================================================================

update NOTIFICATION_TYPE set SEND_NOTIFICATION='N' 
  where NOTIFICATION_TYPE_ID in ( 10000, 10003, 10007, 10009, 10012, 10015, 10018, 10021, 10024, 10027, 10030, 10033, 10036, 10040, 10043, 10046, 10049, 
  10052, 10062, 10067, 10072, 10074, 10075, 10080, 10083, 10086, 10089, 10092, 10095, 10098, 10101, 10104, 10107, 10110, 10113, 10116, 10119, 10122, 10125,
  10128, 10129, 10130, 10134, 10135, 10138, 10142, 10144, 10146, 10149, 10150, 10153, 10155, 10157, 10159, 10161, 10163, 10165, 10167, 10169, 10171, 10173,
  10175, 10177, 10179, 10181, 10183, 10185, 10187, 10189, 10191, 10193, 10194, 10195, 10196, 10197, 10198, 10199, 10200, 10201, 10202, 10203, 10204, 10205,
  10206, 10207, 10208, 10209, 10248, 10251, 10254, 10257, 10260, 10263, 10266, 10269, 10272, 10276, 10279, 10282, 10285, 10288, 10291, 10294, 10297, 10301, 
  10304, 10307, 10310, 10317, 10324, 10327, 10330, 10331, 10332, 10333, 10334, 10335, 10336, 10337, 10340, 10342, 10343, 10346, 10349, 10351, 10353, 10355,
  10357, 10359)
;

-- ====================================================================================================================
-- 8)   Set Protocol Action Types maintenance docs (14 total) to be YES on 'Trigger Correspondence'
-- ====================================================================================================================

update PROTOCOL_ACTION_TYPE set TRIGGER_CORRESPONDENCE='Y' 
  where PROTOCOL_ACTION_TYPE_CODE in (204, 300, 201, 304, 206, 205, 305, 210, 208, 203, 202, 302, 301, 303)
;


-- ====================================================================================================================
-- 9) Create 'Correspondence Generated' maintenance documents for Expiration Letter, IRB Review Not Required, and Response Approval. (UAR-732) 
-- ====================================================================================================================

INSERT INTO "KRAOWNER"."VALID_PROTO_ACTION_CORESP" (VALID_PROTO_ACTION_CORESP_ID, PROTOCOL_ACTION_TYPE_CODE, PROTO_CORRESP_TYPE_CODE, UPDATE_TIMESTAMP, UPDATE_USER, FINAL_FLAG, OBJ_ID) 
  VALUES ('16', '305', '33', CURRENT_TIMESTAMP, 'admin', 'N', SYS_GUID())
;

INSERT INTO "KRAOWNER"."VALID_PROTO_ACTION_CORESP" (VALID_PROTO_ACTION_CORESP_ID, PROTOCOL_ACTION_TYPE_CODE, PROTO_CORRESP_TYPE_CODE, UPDATE_TIMESTAMP, UPDATE_USER, FINAL_FLAG, OBJ_ID) 
  VALUES ('17', '210', '32', CURRENT_TIMESTAMP, 'admin', 'N', SYS_GUID())
;

INSERT INTO "KRAOWNER"."VALID_PROTO_ACTION_CORESP" (VALID_PROTO_ACTION_CORESP_ID, PROTOCOL_ACTION_TYPE_CODE, PROTO_CORRESP_TYPE_CODE, UPDATE_TIMESTAMP, UPDATE_USER, FINAL_FLAG, OBJ_ID) 
  VALUES ('18', '208', '1', CURRENT_TIMESTAMP, 'admin', 'N', SYS_GUID())
;



-- ====================================================================================================================
-- 10)? Upload all current XSLT files for IRB correspondence letters (UAR-822) -> needs to be done in java/liquibase
-- ====================================================================================================================


-- ====================================================================================================================
-- 11) Change parameter: EMAIL_NOTIFICATIONS_ENABLED to N 
-- ====================================================================================================================

update KRCR_PARM_T set val='N' 
  where parm_nm='EMAIL_NOTIFICATIONS_ENABLED'
;


-- ====================================================================================================================
-- 12) Change parameter: EMAIL_NOTIFICATION_TEST_ENABLED to N
-- ====================================================================================================================

update KRCR_PARM_T set val='N' 
  where parm_nm='EMAIL_NOTIFICATION_TEST_ENABLED'
;

-- ====================================================================================================================
-- 13. Update the Rate Class Inclusion and Rate Class Exclusion tables
-- ====================================================================================================================

TRUNCATE table RATE_CLASS_BASE_INCLUSION
;

INSERT INTO RATE_CLASS_BASE_INCLUSION (RATE_CLASS_BASE_INCL_ID, RATE_CLASS_CODE, RATE_CLASS_CODE_INCL, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
   VALUES ('1', '1', '5', CURRENT_TIMESTAMP, 'admin', SYS_GUID())
;

INSERT INTO RATE_CLASS_BASE_INCLUSION (RATE_CLASS_BASE_INCL_ID, RATE_CLASS_CODE, RATE_CLASS_CODE_INCL, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
   VALUES ('2', '1', '92', CURRENT_TIMESTAMP, 'admin', SYS_GUID())
;

INSERT INTO RATE_CLASS_BASE_INCLUSION (RATE_CLASS_BASE_INCL_ID, RATE_CLASS_CODE, RATE_CLASS_CODE_INCL, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
   VALUES ('3', '2', '5', CURRENT_TIMESTAMP, 'admin', SYS_GUID())
;

INSERT INTO RATE_CLASS_BASE_INCLUSION (RATE_CLASS_BASE_INCL_ID, RATE_CLASS_CODE, RATE_CLASS_CODE_INCL, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
   VALUES ('4', '2', '92', CURRENT_TIMESTAMP, 'admin', SYS_GUID())
;

INSERT INTO RATE_CLASS_BASE_INCLUSION (RATE_CLASS_BASE_INCL_ID, RATE_CLASS_CODE, RATE_CLASS_CODE_INCL, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
   VALUES ('5', '92', '5', CURRENT_TIMESTAMP, 'admin', SYS_GUID())
;

INSERT INTO RATE_CLASS_BASE_INCLUSION (RATE_CLASS_BASE_INCL_ID, RATE_CLASS_CODE, RATE_CLASS_CODE_INCL, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
   VALUES ('6', '93', '5', CURRENT_TIMESTAMP, 'admin', SYS_GUID())
;

TRUNCATE table RATE_CLASS_BASE_EXCLUSION
;


-- ====================================================================================================================
-- 14. Set parameter: autoSubmitToSponsorOnFinalApproval to N
-- ====================================================================================================================

update KRCR_PARM_T set val='N' 
  where parm_nm='autoSubmitToSponsorOnFinalApproval'
;


-- ====================================================================================================================
-- 15. Clean up Unit Administrator table for Grants.gov Proposal Contact, see steps in UAR-918. 
-- ====================================================================================================================

delete from UNIT_ADMINISTRATOR where UNIT_ADMINISTRATOR_TYPE_CODE = '6'
; 

insert into UNIT_ADMINISTRATOR (UNIT_NUMBER, PERSON_ID, UNIT_ADMINISTRATOR_TYPE_CODE, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) 
  values ('000001', '103308801414', '6', CURRENT_TIMESTAMP, 'admin', '0', SYS_GUID())
;


-- ====================================================================================================================
-- 16. Proposal: inactivate YNQuestions, deactivate GG S2S Questionnaire, create new Questionnaire, deal with enroute proposals
-- ====================================================================================================================

-- inactivating all YNQuestions
update YNQ set STATUS='I' where STATUS='A';

-- deactivate GG S2S Questionnaire
update questionnaire set IS_FINAL='N' where NAME='GG S2S Forms';

-- insert the questionnaire for Proposal Questions (ID=3333)
Insert into QUESTIONNAIRE (QUESTIONNAIRE_REF_ID,QUESTIONNAIRE_ID,SEQUENCE_NUMBER,NAME,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,IS_FINAL,VER_NBR,OBJ_ID,FILE_NAME,TEMPLATE,DOCUMENT_NUMBER) 
values (3333,3333,1,'Proposal Questions','Proposal Questions',CURRENT_TIMESTAMP ,'admin','Y',1, sys_guid(), null, null, null);


-- insert the questionnaire usage for Proposal Questions (ID=3333)
Insert into QUESTIONNAIRE_USAGE (QUESTIONNAIRE_USAGE_ID,MODULE_ITEM_CODE,MODULE_SUB_ITEM_CODE,QUESTIONNAIRE_REF_ID_FK,QUESTIONNAIRE_SEQUENCE_NUMBER,QUESTIONNAIRE_LABEL,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,IS_MANDATORY,RULE_ID) 
values (3333,3,0,3333,1,'Proposal Questions',CURRENT_TIMESTAMP,'admin',1,sys_guid(),'Y',null);

-- insert the questions for Proposal Questions (IDs from 11000 to 11018)
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11000,11000,1,'C','Live Vertebrate Animal Subjects?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1, sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11001,11001,1,'C','Cancer Related Research Topics?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11002,11002,1,'C','Cancer Center Facilities Used (including shared resources)?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11003,11003,1,'C','Collaboration With Foreign Nations?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11004,11004,1,'C','Please list Foreign Nation(s).','A',3,6,'org.kuali.rice.location.impl.country.CountryBo','name',null,20,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11005,11005,1,'C','Hazardous Chemicals?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11006,11006,1,'C','FDA/EPA GLP Compliance?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11007,11007,1,'C','Human Subjects?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11008,11008,1,'C','Radiation?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11009,11009,1,'C','Bloodborne Pathogens?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11010,11010,1,'C','Native American Affairs?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11011,11011,1,'C','Please list Tribe(s).','A',3,5,null,null,1,1,400,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11012,11012,1,'C','Recombinant DNA/Microbial Pathogens?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11013,11013,1,'C','Will you be working on a U.S. military base abroad?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11014,11014,1,'C','Does your research involve any of the following countries: Cuba, Iran, Syria, Libya, North Korea, or Sudan?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11015,11015,1,'C','Is the F&A rate less than the UA''s federally negotiated rate?  If yes, either a formal stipulation or VPR waiver is required.','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11016,11016,1,'C','Is the requested F&A rate formally stipulated in the program announcement, application kit, or agency bylaws?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11017,11017,1,'C','Does the requested F&A rate require a waiver/approval from the VPR''s Office?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);
Insert into QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER) 
 values (11018,11018,1,'C','Should quarterly F&A Revenue Distribution be allocated based on actual sibling activity rather than F&A credit split panel distribution?','A',3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'admin',1,sys_guid(),null);

-- insert the questions explanations where needed
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
 values (11000,11000,'E','No project activity allowed without protocol approval and/or registration and training. Please see the Research Compliance Policies at <a href="http://rgw.arizona.edu/resources/policy-guidance#ResearchCompliancePolicies" target="_blank">http://rgw.arizona.edu/resources/policy-guidance</a> for more information.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11002,11002,'E','Information related to University of Arizona Cancer Center Shared Resources can be found at <a href="http://azcc.arizona.edu/research/shared-resources" target="_blank">http://azcc.arizona.edu/research/shared-resources</a>.',CURRENT_TIMESTAMP,'admin',1,'f98a1b34-90b7-4932-924b-52eb11c003ed');
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11005,11005,'E','No project activity allowed without protocol approval and/or registration and training. Please see the Research Compliance Policies at <a href="http://rgw.arizona.edu/resources/policy-guidance#ResearchCompliancePolicies" target="_blank">http://rgw.arizona.edu/resources/policy-guidance</a> for more information.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11006,11006,'E','No project activity allowed without protocol approval and/or registration and training. Please see the Research Compliance Policies at <a href="http://rgw.arizona.edu/resources/policy-guidance#ResearchCompliancePolicies" target="_blank">http://rgw.arizona.edu/resources/policy-guidance</a> for more information.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11007,11007,'E','No project activity allowed without protocol approval and/or registration and training. Please see the Research Compliance Policies at <a href="http://rgw.arizona.edu/resources/policy-guidance#ResearchCompliancePolicies" target="_blank">http://rgw.arizona.edu/resources/policy-guidance</a> for more information.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11008,11008,'E','No project activity allowed without protocol approval and/or registration and training. Please see the Research Compliance Policies at <a href="http://rgw.arizona.edu/resources/policy-guidance#ResearchCompliancePolicies" target="_blank">http://rgw.arizona.edu/resources/policy-guidance</a> for more information.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11009,11009,'E','No project activity allowed without protocol approval and/or registration and training. Please see the Research Compliance Policies at <a href="http://rgw.arizona.edu/resources/policy-guidance#ResearchCompliancePolicies" target="_blank">http://rgw.arizona.edu/resources/policy-guidance</a> for more information.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11012,11012,'E','No project activity allowed without protocol approval and/or registration and training. Please see the Research Compliance Policies at <a href="http://rgw.arizona.edu/resources/policy-guidance#ResearchCompliancePolicies" target="_blank">http://rgw.arizona.edu/resources/policy-guidance</a> for more information.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11015,11015,'E','Further information on the Facilities & Administrative (F&A) Rate can be found at <a href="http://rgw.arizona.edu/administration/build-budget/F-A-Costs" target="_blank">http://rgw.arizona.edu/administration/build-budget/F-A-Costs</a>.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11016,11016,'E','Further information on the Facilities & Administrative (F&A) Rate can be found at <a href="http://rgw.arizona.edu/administration/build-budget/F-A-Costs" target="_blank">http://rgw.arizona.edu/administration/build-budget/F-A-Costs</a>.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11017,11017,'E','Further information on the Facilities & Administrative (F&A) Rate can be found at <a href="http://rgw.arizona.edu/administration/build-budget/F-A-Costs" target="_blank">http://rgw.arizona.edu/administration/build-budget/F-A-Costs</a>.',CURRENT_TIMESTAMP,'admin',1,sys_guid());
Insert into QUESTION_EXPLANATION (QUESTION_EXPLANATION_ID,QUESTION_REF_ID_FK,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
 values (11018,11018,'E','If marked YES, the percentages listed within the F&A Revenue column of the Credit Split Panel will be "info only" & will not be used.  Further information on the Facilities & Administrative (F&A) Rate can be found at <a href="http://rgw.arizona.edu/administration/build-budget/F-A-Costs" target="_blank">http://rgw.arizona.edu/administration/build-budget/F-A-Costs</a>.',CURRENT_TIMESTAMP,'admin',1,sys_guid());


-- insert the questionnaire questions crossreferencing the question and questionnaire added above
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11000,3333,11000,1,0,'N',null,null,CURRENT_TIMESTAMP,'admin',1,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11001,3333,11001,2,0,'N',null,null,CURRENT_TIMESTAMP,'admin',2,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11002,3333,11002,3,0,'N',null,null,CURRENT_TIMESTAMP,'admin',3,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11003,3333,11003,4,0,'N',null,null,CURRENT_TIMESTAMP,'admin',4,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11005,3333,11005,6,0,'N',null,null,CURRENT_TIMESTAMP,'admin',5,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11006,3333,11006,7,0,'N',null,null,CURRENT_TIMESTAMP,'admin',6,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11007,3333,11007,8,0,'N',null,null,CURRENT_TIMESTAMP,'admin',7,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11008,3333,11008,9,0,'N',null,null,CURRENT_TIMESTAMP,'admin',8,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11009,3333,11009,11,0,'N',null,null,CURRENT_TIMESTAMP,'admin',9,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11010,3333,11010,12,0,'N',null,null,CURRENT_TIMESTAMP,'admin',10,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11012,3333,11012,14,0,'N',null,null,CURRENT_TIMESTAMP,'admin',11,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11013,3333,11013,15,0,'N',null,null,CURRENT_TIMESTAMP,'admin',12,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11014,3333,11014,16,0,'N',null,null,CURRENT_TIMESTAMP,'admin',13,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11015,3333,11015,17,0,'N',null,null,CURRENT_TIMESTAMP,'admin',14,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11018,3333,11018,20,0,'N',null,null,CURRENT_TIMESTAMP,'admin',15,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11004,3333,11004,5,4,'Y','4','Y',CURRENT_TIMESTAMP,'admin',1,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11011,3333,11011,13,12,'Y','4','Y',CURRENT_TIMESTAMP,'admin',1,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11016,3333,11016,18,17,'Y','4','Y',CURRENT_TIMESTAMP,'admin',1,1,sys_guid(),null);
Insert into QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID) 
  values (11017,3333,11017,19,18,'Y','4','N',CURRENT_TIMESTAMP,'admin',1,1,sys_guid(),null);


-- bump sequence for question ids to 12000
DECLARE 
  i_seqval NUMBER(12,0) :=  1;
BEGIN
 SELECT SEQ_QUESTION_ID.NEXTVAL INTO i_seqval from dual;
 SELECT (11999-i_seqval) INTO i_seqval from dual;
 EXECUTE IMMEDIATE 'ALTER SEQUENCE SEQ_QUESTION_ID INCREMENT BY '||i_seqval;
 SELECT SEQ_QUESTION_ID.NEXTVAL INTO i_seqval from dual;
 EXECUTE IMMEDIATE 'ALTER SEQUENCE SEQ_QUESTION_ID INCREMENT BY 1';
 COMMIT;
END;
/

-- ====================================================================================================================
-- 17. Update Proposal related parameter values per UAR-957.
-- ====================================================================================================================

update KRCR_PARM_T set val='N' 
  where parm_nm='enableFormulatedCostCalculation'
;

update KRCR_PARM_T set val='3340' 
  where parm_nm='SUBCONTRACTOR_DIRECT_GT_25K'
;

update KRCR_PARM_T set val='3350' 
  where parm_nm='SUBCONTRACTOR_DIRECT_LT_25K'
;

update KRCR_PARM_T set val='18' 
  where parm_nm='rejectNarrativeTypeCode'
;

update KRCR_PARM_T set val='N' 
  where parm_nm='autoSubmitToSponsorOnFinalApproval'
;

update KRCR_PARM_T set val='N' 
  where parm_nm='enableSpecialReviewPanel'
;

update KRCR_PARM_T set val='N' 
  where parm_nm='enableSummaryDataValidationPanel'
;

update KRCR_PARM_T set val='N' 
  where parm_nm='enableSummaryKeywordsPanel'
;

update KRCR_PARM_T set val='N' 
  where parm_nm='enableSummaryPrintPanel'
;

update KRCR_PARM_T set val='Approval indicates that information in the online proposal and application is true, complete and accurate to the best of your knowledge. Approval confirms any cost sharing commitments, space arrangements, and resources for the proposed project. The PI, Co-PI, and others involved in the sponsored activity are not currently debarred, proposed for debarment, suspended, declared ineligible, or voluntarily excluded from transactions by a federal agency. If awarded, the PI, Co-PI, and lead unit agree to accept responsibility for the fiscal and scientific conduct of the project and provide progress reports as required by Federal or State Law, sponsor regulations, terms of the award, and university policy. The PI agrees to maintain a complete copy of the submitted proposal which may be accessed by the Office for Research and Discovery.' 
  where parm_nm='propSummaryDisclaimerText'
;


-- ====================================================================================================================
-- ***NO LONGER REQUIRED***
-- 18. Update Custom Attribute Label and Name for correct sorting order (UAR-1012)
-- ====================================================================================================================

-- DECLARE 
--   l_label VARCHAR2(30) := '1. F'||'&'||'A Rate % (ex: 53/53.5)';
-- BEGIN
--   update CUSTOM_ATTRIBUTE set name = l_label, label = l_label
--  	where id =1;
-- END;
-- /

-- DECLARE 
--  l_label VARCHAR2(30) := '2. Prj Location: Bldg-Rm-Other';
-- BEGIN
--   update CUSTOM_ATTRIBUTE set name = l_label, label = l_label
--   	where id =2;
-- END;
-- /

-- DECLARE 
--   l_label VARCHAR2(30) := '3. Follow-on to Account No.';
-- BEGIN
--   update CUSTOM_ATTRIBUTE set name = l_label, label = l_label
--   	where id =3;
-- END;
-- /


-- ====================================================================================================================
-- 19. Add 'Kuali Rules Management System Administrator' Role (1259) to Person record for Jessica Peck (peck).
-- ====================================================================================================================

insert into krim_role_mbr_t ( role_mbr_id, ver_nbr, obj_id, role_id, mbr_id, mbr_typ_cd, actv_frm_dt, actv_to_dt ) 
  select KRIM_ROLE_MBR_ID_S.NEXTVAL, 1, SYS_GUID(), 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Kuali Rules Management System Administrator' and NMSPC_CD='KR-RULE'),
    prncpl_id, 'P', null, null 
  from krim_entity_cache_t 
  where prncpl_nm = 'peck'
;


-- ====================================================================================================================
-- 21. Inactivate negotiation association types Proposal Log and Subaward, see UAR-1021
-- ====================================================================================================================

-- disable unused negotiation association types ProposalLog and SubAward:
update NEGOTIATION_ASSOCIATION_TYPE set ACTV_IND='N'
  where NEGOTIATION_ASSC_TYPE_CODE in ('PL', 'SWD')
;


-- ====================================================================================================================
-- 22. Negotiation maintenance values for Negotiation Location, Agreement Type and Association Type
-- ====================================================================================================================

-- increase title field for DESCRIPTION in NEGOTIATION_AGREEMENT_TYPE to 50 
alter table NEGOTIATION_AGREEMENT_TYPE
modify ( 
  DESCRIPTION VARCHAR2(50 BYTE)
);

-- populate the negotiation agreement type table with the correct values
update NEGOTIATION_AGREEMENT_TYPE set ACTV_IND='N'
 where NEGOTIATION_AGRMNT_TYPE_CODE = 'NDA';

update NEGOTIATION_AGREEMENT_TYPE set DESCRIPTION='Site Rotation Agreement'
 where NEGOTIATION_AGRMNT_TYPE_CODE = 'SRA';

insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (4,'CTA','Clinical Trial Agreement',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (5,'CDA','Confidential Disclosure Agreement',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
--insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
--  values (3,'MTA','Material Transfer Agreement',CURRENT_TIMESTAMP,'admin',1,sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (6,'ATA','AZ Telemedicine Agreement',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (7,'CTF','Clinical Training Affiliation',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (8,'HS','Health Sciences',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (9,'MOU','Memorandum of Understanding Non-Sponsored',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (10,'PA','Preceptor Agreement',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (11,'SPS','Sponsored Agreement',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (12,'SS','Sales and Service',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (13,'SPA','Site Preceptor Agreement',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (14,'SUB','Subaward (Outgoing)',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (15,'TAA','Training Affiliation Agreement',CURRENT_TIMESTAMP,'admin',0, sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (16,'OT','Other',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
insert into KRAOWNER.NEGOTIATION_AGREEMENT_TYPE (NEGOTIATION_AGRMNT_TYPE_ID,NEGOTIATION_AGRMNT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (17,'SA','Site Agreement',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');



-- populate the negotiation activity type table with the correct values
update NEGOTIATION_ACTIVITY_TYPE set ACTV_IND='N'
	where NEGOTIATION_ACTIVITY_TYPE_CODE in ('CC','CD','E','FR','FS','M','TC','DD','RD','CS','CR','CPS','CPR','EDS','EDR','F');

update NEGOTIATION_ACTIVITY_TYPE set NEGOTIATION_ACTIVITY_TYPE_CODE='OT'
	where NEGOTIATION_ACTIVITY_TYPE_CODE ='O';

Insert into KRAOWNER.NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID,NEGOTIATION_ACTIVITY_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (18,'SPH','Sponsor Hold',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID,NEGOTIATION_ACTIVITY_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (19,'FEX','Sponsor Fully-Executed',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID,NEGOTIATION_ACTIVITY_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (20,'DOC','Initial Receipt',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID,NEGOTIATION_ACTIVITY_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (21,'DPT','Department Hold',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID,NEGOTIATION_ACTIVITY_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (22,'SBH','Subrecipient Hold',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID,NEGOTIATION_ACTIVITY_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (23,'SBX','Subrecipient Fully-Executed',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID,NEGOTIATION_ACTIVITY_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (24,'RVW','Review',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');



-- populate the negotiation NEGOTIATION_LOCATION table with the correct values
update NEGOTIATION_LOCATION set ACTV_IND='N'
  where NEGOTIATION_LOCATION_CODE in ('OSP', 'TLO', 'DLC');

update NEGOTIATION_LOCATION set DESCRIPTION='Office of General Counsel'
  where NEGOTIATION_LOCATION_CODE='OGC';
  
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (6,'SPS','Sponsored Projects Services',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (7,'TLA','TLA/TTA',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (8,'DPT','Department',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (9,'RM','Risk Management',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (10,'COI','Conflict of Interest',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (11,'ECO','Export Control',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (12,'CRS','Contract and Research Support',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (13,'SUB','Subrecipient',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');


-- make sure the next value for the negotiation after the migration starts in the 20000+
alter sequence NEGOTIATION_S increment by 19999;
select NEGOTIATION_S.nextval from dual;
alter sequence NEGOTIATION_S increment by 1;

-- ====================================================================================================================
-- 23.  Deactivate unused Proposal namespace roles per UAR-1050  
-- ====================================================================================================================
-- deactivate roles unassigned(1113), approver(1126), delete proposal(1226), orca-proposal notes(1236), access_proposal_person_institutional_salaries(10637), View Institutionally Maintained Salaries(10638) 

update KRIM_ROLE_T set ACTV_IND = 'N' 
	where ROLE_ID in ('1113', '1126', '1226', '1236', '10637', '10638');



-- ====================================================================================================================
-- 24. UAR-974 - Create mapping database table between YNQ and QQ for Question IDs 
-- ====================================================================================================================

create table QUESTION_YNQ_MAP (
  QUESTION_REF_ID NUMBER(12,0),
  YNQ_QUESTION_ID VARCHAR2(4 BYTE),
  constraint PK_QUESTION_YNQ_MAP primary key (QUESTION_REF_ID, YNQ_QUESTION_ID),
  constraint FK_QUESTION foreign key (QUESTION_REF_ID) REFERENCES QUESTION(QUESTION_REF_ID),
  constraint FK_YNQ foreign key (YNQ_QUESTION_ID) REFERENCES YNQ(QUESTION_ID)
);

/* These inserts map to the ids created by Natalia's scripts */

-- SR01 -> 11000
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11000' ), 
    'SR01'
);

-- SR03 -> 11001
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11001' ), 
    'SR03'
);

-- SR12 -> 11002
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11002' ), 
    'SR12'
);

-- SR04 -> 11003
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11003' ), 
    'SR04'
);

-- SR05 -> 11005
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11005' ), 
    'SR05'
);

-- SR06 -> 11006
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11006' ), 
    'SR06'
);

-- SR07 -> 11007
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11007' ), 
    'SR07'
);

-- SR08 -> 11008
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11008' ), 
    'SR08'
);

-- SR09 -> 11009
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11009' ), 
    'SR09'
);

-- SR11 -> 11010
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11010' ), 
    'SR11'
);

-- SR13 -> 11012
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11012' ), 
    'SR13'
);

-- SR18 -> 11013
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11013' ), 
    'SR18'
);

-- SR19 -> 11014
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11014' ), 
    'SR19'
);

-- FA01 -> 11016
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11016' ), 
    'FA01'
);

-- FA02 -> 11017
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11017' ), 
    'FA02'
);

-- FA03 -> 11018
insert into QUESTION_YNQ_MAP (QUESTION_REF_ID, YNQ_QUESTION_ID) 
  values ( 
    ( select QUESTION_REF_ID from QUESTION where QUESTION_ID='11018' ), 
    'FA03'
);



-- ====================================================================================================================
-- 25. UAR-570 - Add listed permissions to 'UA SPS Maintenance' Role (1206)
-- ====================================================================================================================

--'Add Unit' (1296)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Add Unit' and NMSPC_CD='KC-UNT'),
    'Y')
;

--'Modify Unit' (1297)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Modify Unit' and NMSPC_CD='KC-UNT'),
    'Y')
;

--'Create Award Sponsor Template' (1298)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1,  
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Create Award Sponsor Template' and NMSPC_CD='KC-AWARD'),
    'Y')
;

--'Modify Award Sponsor Template' (1299)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Modify Award Sponsor Template' and NMSPC_CD='KC-AWARD'), 
    'Y')
;

--'View Award Sponsor Template' (1300)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='View Award Sponsor Template' and NMSPC_CD='KC-AWARD'), 
    'Y')
;

--'Add Sponsor Hierarchy' (1303)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1,
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Add Sponsor Hierarchy' and NMSPC_CD='KC-SYS'), 
    'Y')
;

--'Modify Sponsor Hierarchy' (1304)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1,
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Modify Sponsor Hierarchy' and NMSPC_CD='KC-SYS'), 
    'Y')
;

--'Delete Sponsor Hierarchy' (1305)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Delete Sponsor Hierarchy' and NMSPC_CD='KC-SYS'), 
    'Y')
;

--'Add Sponsor' (1306)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Add Sponsor' and NMSPC_CD='KC-UNT'), 
    'Y')
;

--'Modify Sponsor' (1307)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1,  
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Modify Sponsor' and NMSPC_CD='KC-UNT'), 
    'Y')
;

-- 'Add Address Book' (1308) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Add Address Book' and NMSPC_CD='KC-UNT'), 
    'Y')
;

-- 'Modify Address Book' (1309) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1,
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Modify Address Book' and NMSPC_CD='KC-UNT'), 
    'Y')
;

-- 'Delete Address Book' (1310) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Delete Address Book' and NMSPC_CD='KC-UNT'), 
    'Y')
;

-- 'View Address Book' (1352) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='View Address Book' and NMSPC_CD='KC-UNT'), 
    'Y')
;

-- 'Modify Organization' (1311)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Modify Organization' and NMSPC_CD='KC-UNT'), 
    'Y')
;

-- 'Add Organization' (1312) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Add Organization' and NMSPC_CD='KC-UNT'), 
    'Y')
; 


-- 'Delete Organization' (1313) 
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='Delete Organization' and NMSPC_CD='KC-UNT'), 
    'Y')
;

-- 'View Organization' (1353)
insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='UA SPS Maintenance' and NMSPC_CD='KC-M'), 
    (select PERM_ID from KRIM_PERM_T where NM='View Organization' and NMSPC_CD='KC-UNT'), 
    'Y')
;


-- ====================================================================================================================
-- 26. UAR-501: Award: New Parameter values for AUTO_GENERATE_TIME_AND_MONEY_FUNDS_DIST_PERIODS and AWARD_FNA_DISTRIBUTION
-- ====================================================================================================================

update KRCR_PARM_T set val='N' 
  where parm_nm='AUTO_GENERATE_TIME_AND_MONEY_FUNDS_DIST_PERIODS'
;

update KRCR_PARM_T set val='D' 
  where parm_nm='AWARD_FNA_DISTRIBUTION'
;


-- ====================================================================================================================
-- 27. UAR-930: Proposal: populate eRA Commons User Name field for all enroute NIH sponsor group proposals 
-- ====================================================================================================================

UPDATE EPS_PROP_PERSON SET ERA_COMMONS_USER_NAME = 'PLACEHOLDER'
WHERE EXISTS (SELECT * FROM SPONSOR, EPS_PROPOSAL
  WHERE EPS_PROPOSAL.SPONSOR_CODE=SPONSOR.SPONSOR_CODE
  AND EPS_PROPOSAL.PROPOSAL_NUMBER=EPS_PROP_PERSON.PROPOSAL_NUMBER
  AND (SPONSOR.SPONSOR_NAME LIKE 'National Inst%' OR SPONSOR.SPONSOR_CODE IN('010759','010459','010765','010777','010782','010786','010791','010761','010763','064700'))
  AND EPS_PROPOSAL.STATUS_CODE='2'
  AND EPS_PROP_PERSON.ERA_COMMONS_USER_NAME IS NULL)
;

-- ====================================================================================================================
-- 28. UAR-971: Proposal: change all attachment status to 'complete' for enroute proposals
-- ====================================================================================================================

UPDATE NARRATIVE SET MODULE_STATUS_CODE='C' 
WHERE EXISTS (SELECT EPS_PROPOSAL.*,NARRATIVE.* 
  FROM EPS_PROPOSAL 
  WHERE NARRATIVE.PROPOSAL_NUMBER=EPS_PROPOSAL.PROPOSAL_NUMBER 
  AND EPS_PROPOSAL.STATUS_CODE!='1' 
  AND NARRATIVE.MODULE_STATUS_CODE='I')
; 


-- ====================================================================================================================
-- 29. UAR-949: Change Special Review status for Human Subjects to 'not yet applied'
-- ====================================================================================================================

--PropDev SQL: 
 update eps_prop_special_review e set e.approval_type_code = '3' 
 where exists (select s.special_review_code, s.description, u.active_flag, c.module_code, c.description, a.DESCRIPTION, e.* 
     from special_review s, special_review_usage u, coeus_module c, sp_rev_approval_type a 
     where s.special_review_code = u.special_review_code 
        and c.module_code = u.module_code 
        and e.special_review_code = s.special_review_code 
        and a.approval_type_code = e.approval_type_code 
        and s.special_review_code = '1' --human subjects 
        and c.module_code = '3' --propdev 
        and e.protocol_status_description is null 
        and e.approval_type_code != '3' );
        
--IP SQL: 
 update proposal_special_review p set p.approval_type_code = '3' 
 where exists (select s.special_review_code, s.description, u.active_flag, c.module_code, c.description, a.DESCRIPTION, pr.proposal_number, p.* 
 from special_review s, special_review_usage u, coeus_module c, sp_rev_approval_type a, proposal pr 
 where s.special_review_code = u.special_review_code 
   and c.module_code = u.module_code 
   and p.special_review_code = s.special_review_code 
   and p.proposal_id = pr.proposal_id 
   and a.approval_type_code = p.approval_type_code 
   and s.special_review_code = '1' --human subjects 
   and c.module_code = '2' --IP 
   and p.approval_type_code != '3');

--Award SQL: 
 update award_special_review asr set asr.approval_type_code = '3' 
 where exists (select s.special_review_code, s.description, u.active_flag, c.module_code, c.description, a.DESCRIPTION, aw.award_number, asr.* 
 from special_review s, special_review_usage u, coeus_module c, sp_rev_approval_type a, award aw 
 where s.special_review_code = u.special_review_code 
   and c.module_code = u.module_code 
   and asr.special_review_code = s.special_review_code 
   and asr.award_id = aw.award_id 
   and a.approval_type_code = asr.approval_type_code 
   and s.special_review_code = '1' --human subjects 
   and c.module_code = '1' --Award 
   and asr.approval_type_code != '3');


-- ====================================================================================================================
-- 30. UAR-942:  Populate 'Primary_Title' for Sherry Esham in Person Extended Attributes table
-- ====================================================================================================================
  
  UPDATE PERSON_EXT_T SET PRIMARY_TITLE = 'Director, Sponsored Projects Services' WHERE PERSON_ID = 103308801414;


-- ====================================================================================================================
-- 31. UAR-832: Turn Watermarks off till after go live
-- ====================================================================================================================
 
 UPDATE WATERMARK SET WATERMARK_STATUS = 'N';



-- ====================================================================================================================
-- 32. UAR-1121:  Backdoor role and permissions
-- ====================================================================================================================

 --create backdoor permission  
 insert into KRIM_PERM_T (PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND) 
  values (KRIM_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, '1', 'KR-SYS', 'Use Backdoor Log In Kuali Portal', 'Use Backdoor Log In Kuali Portal', 'Y')
;

 -- create backdoor role
 insert into KRIM_ROLE_T (ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND,LAST_UPDT_DT) 
  values (KRIM_ROLE_ID_S.NEXTVAL, SYS_GUID(), 1, 'Back Door Login', 'KR-SYS', 'Use Backdoor Log In Kuali Portal', '1', 'Y', null)
;

-- add backdoor permission to backdoor role
 insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y',
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Back Door Login'),
    (select PERM_ID from KRIM_PERM_T where NM='Use Backdoor Log In Kuali Portal'))
;



-- ====================================================================================================================
-- 33. Add Backdoor permission to - SPS Management (Role ID: 1221), IRB Administrator (Role ID: 1119), CRS Management (Role ID: 1238)
-- ====================================================================================================================
 
 -- SPS Management Role (1221)
 insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
	(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='SPS Management' and NMSPC_CD='KC-ADM'),
  	(select PERM_ID from KRIM_PERM_T where NM='Use Backdoor Log In Kuali Portal'))
 ;

 -- IRB Administrator (Role ID: 1119)
 insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
	(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='IRB Administrator' and NMSPC_CD='KC-UNT'),
  	(select PERM_ID from KRIM_PERM_T where NM='Use Backdoor Log In Kuali Portal'))
 ;

 -- CRS Management (Role ID: 1238)
 insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
	(select ROLE_ID from KRIM_ROLE_T where ROLE_NM='CRS Management' and NMSPC_CD='KC-ADM'),
  	(select PERM_ID from KRIM_PERM_T where NM='Use Backdoor Log In Kuali Portal'))
 ;




-- ====================================================================================================================
-- 34. Add the newly created backdoor Role in step 32 to person records
-- ====================================================================================================================

insert into krim_role_mbr_t ( role_mbr_id, ver_nbr, obj_id, role_id, mbr_id, mbr_typ_cd, actv_frm_dt, actv_to_dt ) 
  select KRIM_ROLE_MBR_ID_S.NEXTVAL, 1, SYS_GUID(),  
         (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Back Door Login'), 
         prncpl_id, 'P', null, null 
  from krim_entity_cache_t 
  where prncpl_nm IN ('hlo', 'jshard', 'jwingate', 'kosta', 'leahasullivan', 'mmoen', 'nataliac', 'rbtucker', 'rhunter', 'shaloo', 'sskinner')
;



-- ====================================================================================================================
-- 35. UAR-1056: Turn on IRB below linking parameters, change Parameter value to 'Y' 
-- ====================================================================================================================

-- irb.protocol.award.linking.enabled 
update KRCR_PARM_T set val='Y' where parm_nm='irb.protocol.award.linking.enabled'
;

-- irb.protocol.development.proposal.linking.enabled 
update KRCR_PARM_T set val='Y' where parm_nm='irb.protocol.development.proposal.linking.enabled'
;

-- irb.protocol.institute.proposal.linking.enabled 
update KRCR_PARM_T set val='Y' where parm_nm='irb.protocol.institute.proposal.linking.enabled'
;



-- ====================================================================================================================
-- 36. UAR-1098: Add permissions 1021 (View Proposal), 1029 (View Award), and 1114 (Open Institutional Proposal) to Role 1119 'IRB Administrator' 
-- ====================================================================================================================

--View Proposal Permission (ID: 1021)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='IRB Administrator' and NMSPC_CD='KC-UNT'),
    (select perm_id from KRIM_PERM_T where nm='View Proposal' and NMSPC_CD='KC-PD')
  )
;

--View Award Permission (ID: 1029)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y',
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='IRB Administrator' and NMSPC_CD='KC-UNT'), 
    (select perm_id from KRIM_PERM_T where nm='View Award' and NMSPC_CD='KC-AWARD')
  )
;

--Open Institutional Proposal (ID: 1114)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='IRB Administrator' and NMSPC_CD='KC-UNT'),
    (select perm_id from KRIM_PERM_T where nm='Open Institutional Proposal' and NMSPC_CD='KC-IP')
  )
;



-- ====================================================================================================================
-- 37. UAR-861: Add permissions 1268 (Create Negotiation), 1269 (Modify Negotiation), 1270 (Create Activities), 
--     1271 (Modify Activities), 1272 (View Negotiation - Unrestricted) to Role 1238 'CRS Management' 
-- ====================================================================================================================

--Create Negotiation (ID: 1268)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y',  
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='CRS Management' and NMSPC_CD='KC-ADM'),	
    (select PERM_ID from KRIM_PERM_T where NMSPC_CD='KC-NEGOTIATION' and NM='CREATE NEGOTIATION')
  )
;

--Modify Negotiation (ID: 1269)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='CRS Management' and NMSPC_CD='KC-ADM'),
    (select PERM_ID from KRIM_PERM_T where NMSPC_CD='KC-NEGOTIATION' and NM='MODIFY NEGOTIATION')
  )
;

--Create Activities (ID: 1270)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='CRS Management' and NMSPC_CD='KC-ADM'),
    (select perm_id from KRIM_PERM_T where nm='CREATE ACTIVITIES' and NMSPC_CD='KC-NEGOTIATION')
  )
;

--Modify Activities (ID: 1271)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='CRS Management' and NMSPC_CD='KC-ADM'),
    (select perm_id from KRIM_PERM_T where nm='MODIFY ACTIVITIES' and NMSPC_CD='KC-NEGOTIATION')
  )
;

--Modify Activities (ID: 1272)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y', 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='CRS Management' and NMSPC_CD='KC-ADM'),
    (select perm_id from KRIM_PERM_T where nm='VIEW NEGOTIATION - UNRESTRICTED' and NMSPC_CD='KC-NEGOTIATION')
  )
;


-- ====================================================================================================================
-- 38. UAR-1159: Add 'View Negotiation' permission 1273 to Role 1500 'Negotiation View' and also change namespace to 'KC-NEGOTIATION' 
-- ====================================================================================================================

-- change role namespace 
update KRIM_ROLE_T set NMSPC_CD='KC-NEGOTIATION' where (ROLE_NM = 'Negotiation View')
;

--View Negotiation (ID: 1273)
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,OBJ_ID,VER_NBR,ACTV_IND,ROLE_ID,PERM_ID) 
  values (KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, 'Y',  
     (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Negotiation View' and NMSPC_CD='KC-NEGOTIATION'), 
     (select perm_id from KRIM_PERM_T where nm='VIEW NEGOTIATION' and NMSPC_CD='KC-NEGOTIATION'))
;



-- ====================================================================================================================
-- 39. UAR-1161: Need to add 'Negotiation Viewer' role (ID#1500) to all current 'Dept Management' role members
-- ====================================================================================================================

insert into krim_role_mbr_t ( role_mbr_id, mbr_id, ver_nbr, obj_id, role_id, mbr_typ_cd, actv_frm_dt, actv_to_dt ) 
    with TMP as (select DISTINCT KRIM_ROLE_MBR_T.MBR_ID MBRID FROM KRIM_ROLE_MBR_T WHERE ( ROLE_ID = '1213' AND ACTV_TO_DT IS NULL))
  select KRIM_ROLE_MBR_ID_S.NEXTVAL, MBRID, 1, SYS_GUID(), 
    (select ROLE_ID from KRIM_ROLE_T where ROLE_NM='Negotiation View' and NMSPC_CD='KC-NEGOTIATION'),
    'P', null, null
  from TMP
;




-- ====================================================================================================================
-- 41. UAR-833: Update ALL 'Final' to Y and 'Private Comment' to N flags for protocol Minute entries
-- ====================================================================================================================

--set ALL Final to Y
UPDATE COMM_SCHEDULE_MINUTES SET FINAL_FLAG = 'Y'
  WHERE FINAL_FLAG = 'N'
;


--set ALL Private Comment Flag to N
UPDATE COMM_SCHEDULE_MINUTES SET PRIVATE_COMMENT_FLAG = 'N' 
  WHERE PRIVATE_COMMENT_FLAG = 'Y'
;



-- ====================================================================================================================
-- 42. UAR-993: Create parameter for Negotiation migration with 'N'
-- ====================================================================================================================

--Insert Negotiation Component
INSERT INTO KRCR_CMPNT_T (NMSPC_CD, CMPNT_CD, VER_NBR, NM, ACTV_IND, OBJ_ID)
  VALUES ('KC-NEGOTIATION', 'Negotiation', 1, 'Negotiation', 'Y', sys_guid())
;

-- Insert negotiation migration enabling parameter
INSERT INTO KRCR_PARM_T (APPL_ID, NMSPC_CD, CMPNT_CD, PARM_NM, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, OBJ_ID)
  VALUES ('KC', 'KC-NEGOTIATION', 'Negotiation', 'NEGOTIATION_MIGRATION_ENABLED', '1', 'CONFG', 'N', 'Enable Negotiation Log Migration', 'A', sys_guid())
;


-- ====================================================================================================================
-- 43.  Change parameter: LOOKUP_CONTACT_EMAIL to have parameter_value = kuali_coeus@list.arizona.edu
-- ====================================================================================================================

UPDATE KRCR_PARM_T SET VAL='kuali_coeus@list.arizona.edu' WHERE PARM_NM='LOOKUP_CONTACT_EMAIL'
;


