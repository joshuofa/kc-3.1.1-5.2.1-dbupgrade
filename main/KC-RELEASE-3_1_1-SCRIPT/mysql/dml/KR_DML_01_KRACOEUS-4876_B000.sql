DELIMITER /

INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-AWARD','Document','awardSponsorTemplateHelp',1,'HELP','default.htm?turl=Documents/sponsortemplate.htm','Sponsor Template Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-AWARD','Document','awardDetailsDatesHelp',1,'HELP','default.htm?turl=Documents/detailsdates.htm','Details and Dates Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-AWARD','Document','awardNotesHelp',1,'HELP','default.htm?turl=Documents/notes2.htm','Notes Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-IP','Document','ipNotesAttachmentsHelp',1,'HELP','default.htm?turl=Documents/notesandattachments1.htm','Notes and Attachments Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-IP','Document','ipDistCostSharingHelp',1,'HELP','default.htm?turl=Documents/costsharing1.htm','Cost Sharing Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-IP','Document','ipDistUnrecoveredFandAHelp',1,'HELP','default.htm?turl=Documents/unrecoveredfa1.htm','Unrecovered F and A Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-AWARD','Document','awardAddFundingProposalsHelp',1,'HELP','default.htm?turl=Documents/addfundingproposals.htm','Add Funding Proposals Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-AWARD','Document','awardCurrentFundingProposalsHelp',1,'HELP','default.htm?turl=Documents/currentfundingproposals.htm','Current Funding Proposals Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-AWARD','Document','awardBudgetOverviewHelp',1,'HELP','default.htm?turl=Documents/budgetoverview.htm','Budget Overview Help','A',UUID())
/
INSERT INTO krns_parm_t (appl_nmspc_cd, nmspc_cd, parm_dtl_typ_cd,parm_nm,ver_nbr,parm_typ_cd,txt,parm_desc_txt,cons_cd,obj_id) 
   VALUES ('KC','KC-PROTOCOL','Document','protocolAssignedRolesHelp',1,'HELP','default.htm?turl=Documents/assignedroles1.htm','Assigned Roles Help','A',UUID())
/
update krns_parm_t set txt='default.htm?turl=Documents/award1.htm' where parm_nm='awardHomeHelp'
/
update krns_parm_t set txt='default.htm?turl=Documents/award.htm' where parm_nm='awardHelpUrl'
/

COMMIT
/

DELIMITER ;
