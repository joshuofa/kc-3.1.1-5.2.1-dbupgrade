DELIMITER /

CREATE TABLE SUBAWARD_CLOSEOUT_ID_S (
  id bigint(19) not null auto_increment, primary key (id)
) ENGINE MyISAM
/
ALTER TABLE SUBAWARD_CLOSEOUT_ID_S auto_increment = 1
/

DELIMITER ;
