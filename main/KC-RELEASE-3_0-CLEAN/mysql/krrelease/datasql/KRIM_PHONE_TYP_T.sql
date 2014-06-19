delimiter /
TRUNCATE TABLE KRIM_PHONE_TYP_T
/
INSERT INTO KRIM_PHONE_TYP_T (ACTV_IND,DISPLAY_SORT_CD,LAST_UPDT_DT,OBJ_ID,PHONE_TYP_CD,PHONE_TYP_NM,VER_NBR)
  VALUES ('Y','b',STR_TO_DATE( '20081113140635', '%Y%m%d%H%i%s' ),'5B97C50B03906110E0404F8189D85213','HM','Home',1)
/
INSERT INTO KRIM_PHONE_TYP_T (ACTV_IND,DISPLAY_SORT_CD,LAST_UPDT_DT,OBJ_ID,PHONE_TYP_CD,PHONE_TYP_NM,VER_NBR)
  VALUES ('Y','c',STR_TO_DATE( '20081113140635', '%Y%m%d%H%i%s' ),'5B97C50B03916110E0404F8189D85213','MBL','Mobile',1)
/
INSERT INTO KRIM_PHONE_TYP_T (ACTV_IND,DISPLAY_SORT_CD,LAST_UPDT_DT,OBJ_ID,PHONE_TYP_CD,PHONE_TYP_NM,VER_NBR)
  VALUES ('Y','d',STR_TO_DATE( '20081113140635', '%Y%m%d%H%i%s' ),'5B97C50B03926110E0404F8189D85213','OTH','Other',1)
/
INSERT INTO KRIM_PHONE_TYP_T (ACTV_IND,DISPLAY_SORT_CD,LAST_UPDT_DT,OBJ_ID,PHONE_TYP_CD,PHONE_TYP_NM,VER_NBR)
  VALUES ('Y','a',STR_TO_DATE( '20081113140635', '%Y%m%d%H%i%s' ),'5B97C50B03936110E0404F8189D85213','WRK','Work',1)
/
delimiter ;
