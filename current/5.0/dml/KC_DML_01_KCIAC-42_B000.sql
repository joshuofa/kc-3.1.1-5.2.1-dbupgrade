update membership_role set committee_type_code = 1 where committee_type_code is null
/
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID,VER_NBR, COMMITTEE_TYPE_CODE)
VALUES ( 16, 'Vet', sysdate, 'admin', SYS_GUID(), 1, '3' )
/
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID,VER_NBR, COMMITTEE_TYPE_CODE)
VALUES ( 17, 'IACUC Chair', sysdate, 'admin', SYS_GUID(), 1, '3' )
/
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID,VER_NBR, COMMITTEE_TYPE_CODE )
VALUES ( 18, 'IACUC Alternate', sysdate, 'admin', SYS_GUID(), 1, '3' )
/
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID,VER_NBR, COMMITTEE_TYPE_CODE )
VALUES ( 19, 'IACUC Member', sysdate, 'admin', SYS_GUID(), 1, '3' )
/
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID,VER_NBR, COMMITTEE_TYPE_CODE )
VALUES ( 20, 'IACUC Admin', sysdate, 'admin', SYS_GUID(), 1, '3' )
/
