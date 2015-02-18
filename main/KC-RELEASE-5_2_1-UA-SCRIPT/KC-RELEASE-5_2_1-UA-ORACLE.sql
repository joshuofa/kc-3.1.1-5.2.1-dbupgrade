set echo on
set define off
set sqlblanklines on
spool KC-RELEASE-5_2_1-UA-ORACLE.log
@../../current/5.2.1/KC-5.2.1-DatabaseUpgradeScript.sql
commit;
exit
