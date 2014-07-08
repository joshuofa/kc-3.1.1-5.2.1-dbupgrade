set echo on
set echo on
PRINT "Start KC-RELEASE-0_0_0-SCRIPT/KR-RELEASE-0_0_0-Upgrade-ORACLE.sql"
PRINT "Calling ./../../current/0.0.0/dml/KR_DML_01_KCINFR-1018_B000.sql"
\. ./../../current/0.0.0/dml/KR_DML_01_KCINFR-1018_B000.sql
PRINT "End KC-RELEASE-0_0_0-SCRIPT/KR-RELEASE-0_0_0-Upgrade-ORACLE.sql"
commit;
exit
