DELIMITER /
CREATE TABLE SUBAWARD_FUNDING_SOURCE 
   (	SUBAWARD_FUNDING_SOURCE_ID DECIMAL(12,0) NOT NULL, 
	SUBAWARD_ID DECIMAL(12,0) NOT NULL, 
	UPDATE_TIMESTAMP DATE NOT NULL, 
	UPDATE_USER VARCHAR(60) NOT NULL, 
	VER_NBR DECIMAL(8,0) DEFAULT 1 NOT NULL, 
	OBJ_ID VARCHAR(36) NOT NULL, 
	AWARD_ID DECIMAL(22,0) NOT NULL,
	SEQUENCE_NUMBER DECIMAL(4,0) NOT NULL,
	SUBAWARD_CODE VARCHAR(20) NOT NULL
  ) ENGINE InnoDB CHARACTER SET utf8 COLLATE utf8_bin
/
ALTER TABLE SUBAWARD_FUNDING_SOURCE
  ADD CONSTRAINT PK_SUBAWARD_FUNDING_SOURCE PRIMARY KEY (SUBAWARD_FUNDING_SOURCE_ID)
/
DELIMITER ;
