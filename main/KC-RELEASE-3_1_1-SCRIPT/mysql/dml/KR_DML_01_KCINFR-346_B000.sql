DELIMITER /

UPDATE KRNS_NMSPC_T SET APPL_NMSPC_CD = 'KC' WHERE NMSPC_CD LIKE 'KC-%'
/
UPDATE KRNS_PARM_DTL_TYP_T SET NM = 'Custom Attribute Document Type' WHERE NM = 'Cusatom Attribute Document Type'
/

DELIMITER ;
