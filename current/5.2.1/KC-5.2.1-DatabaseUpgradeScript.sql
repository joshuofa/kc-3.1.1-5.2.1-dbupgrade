-- ====================================================================================================================
-- 2)  Activate Role 'Award Modifier' (1124); Change 'Active?' flag to Yes. 
-- ====================================================================================================================

update krim_role_t set ACTV_IND='Y' where role_id='1124' and role_nm='Award Modifier'
;

-- ====================================================================================================================
-- 3)  Add 'Modify Award Report Tracking' permission (1274) to the 'SPS Management' Role (1221). 
-- ====================================================================================================================

insert into krim_role_perm_t (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1, 1221, 1274, 'Y')
;


-- ====================================================================================================================
-- 4)  Add 'SPS Management' Role (1221) to Amy Dougherty's Person record (doughera).
-- ====================================================================================================================

insert into krim_role_mbr_t ( role_mbr_id, ver_nbr, obj_id, role_id, mbr_id, mbr_typ_cd, actv_frm_dt, actv_to_dt ) 
  select KRIM_ROLE_MBR_ID_S.NEXTVAL, 1, SYS_GUID(), '1221', prncpl_id, 'P', null, null 
  from krim_entity_cache_t 
  where prncpl_nm = 'doughera'
;

-- ====================================================================================================================
-- 5)  Add 'Negotiation Administrator' Role (1250) to the Person Record's of Kari Robertson (kroberston), Amy Dougherty 
--     (doughera), and Jessica Peck (peck)
-- ====================================================================================================================

insert into krim_role_mbr_t ( role_mbr_id, ver_nbr, obj_id, role_id, mbr_id, mbr_typ_cd, actv_frm_dt, actv_to_dt ) 
  select KRIM_ROLE_MBR_ID_S.NEXTVAL, 1, SYS_GUID(), '1250', prncpl_id, 'P', null, null 
  from krim_entity_cache_t 
  where prncpl_nm = 'doughera' or prncpl_nm = 'krobertson' or prncpl_nm = 'peck'
;


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

--TODO create new Questionnaire

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

update KRCR_PARM_T set val='Approval signifies that the proposed project fits within the academic framework and resources of the unit, requirements for new or renovated facilitiesspace have been discussed with the appropriate people, contributions listed will be met by the department college unless otherwise approved, that Conflict of Interest requirements have been addressed, and that Sponsored Programs may process the proposal.' 
  where parm_nm='propSummaryDisclaimerText'
;


-- ====================================================================================================================
-- 18. Update Custom Attribute Label and Name for correct sorting order (UAR-1012)
-- ====================================================================================================================

DECLARE 
  l_label VARCHAR2(30) := '1. F'||'&'||'A Rate % (ex: 53/53.5)';
BEGIN
  update CUSTOM_ATTRIBUTE set name = l_label, label = l_label
  	where id =1;
END;
/

DECLARE 
  l_label VARCHAR2(30) := '2. Prj Location: Bldg-Rm-Other';
BEGIN
  update CUSTOM_ATTRIBUTE set name = l_label, label = l_label
  	where id =2;
END;
/

DECLARE 
  l_label VARCHAR2(30) := '3. Follow-on to Account No.';
BEGIN
  update CUSTOM_ATTRIBUTE set name = l_label, label = l_label
  	where id =3;
END;
/

-- ====================================================================================================================
-- 19. Add 'Kuali Rules Management System Administrator' Role (1259) to Person record for Jessica Peck (peck).
-- ====================================================================================================================

insert into krim_role_mbr_t ( role_mbr_id, ver_nbr, obj_id, role_id, mbr_id, mbr_typ_cd, actv_frm_dt, actv_to_dt ) 
  select KRIM_ROLE_MBR_ID_S.NEXTVAL, 1, SYS_GUID(), '1259', prncpl_id, 'P', null, null 
  from krim_entity_cache_t 
  where prncpl_nm = 'peck'






-- ====================================================================================================================
-- 21. Inactivate negotiation association types Proposal Log and Subaward, see UAR-1021
-- ====================================================================================================================

-- disable unused negotiation association types ProposalLog and SubAward:
update NEGOTIATION_ASSOCIATION_TYPE set ACTV_IND = 'N' 
 where NEGOTIATION_ASSC_TYPE_CODE in ('PL', 'SWD');


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

Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (6,'SPS','Sponsored Projects Services',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (7,'TLA','TLA/TTA',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
Insert into KRAOWNER.NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID,NEGOTIATION_LOCATION_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND)  
  values (8,'DPT','Dept Hold',CURRENT_TIMESTAMP,'admin',0,sys_guid(),'Y');
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


-- ====================================================================================================================
-- 23.  Deactivate unused Proposal namespace roles per UAR-1050  
-- ====================================================================================================================
-- deactivate roles unassigned(1113), approver(1126), delete proposal(1226), orca-proposal notes(1236), access_proposal_person_institutional_salaries(10637), View Institutionally Maintained Salaries(10638) 

update KRIM_ROLE_T set ACTV_IND = 'N' 
	where ROLE_ID in ('1113', '1126', '1226', '1236', '10637', '10638');
