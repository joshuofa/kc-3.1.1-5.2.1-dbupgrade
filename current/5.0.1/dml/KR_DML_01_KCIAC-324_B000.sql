Insert into KRIM_PERM_T (PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND) 
values (KRIM_PERM_ID_BS_S.NEXTVAL, sys_guid(), 1, 
        (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),
        'KC-IACUC','Create IACUC Protocol Continuation Review','Create a new continuation for an IACUC protocol','Y')
/
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND) 
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, sys_guid(), 1, (SELECT ROLE_ID from KRIM_ROLE_T where ROLE_NM = 'IACUC Administrator'), (SELECT PERM_ID from KRIM_PERM_T where NM = 'Create IACUC Protocol Continuation Review'), 'Y')
/
insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND) 
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, sys_guid(), 1, (SELECT ROLE_ID from KRIM_ROLE_T where ROLE_NM = 'KC Superuser'), (SELECT PERM_ID from KRIM_PERM_T where NM = 'Create IACUC Protocol Continuation Review'), 'Y')
/
