DELIMITER /

CREATE TABLE NEGOTIATION_ATTACHMENT_S (
  id bigint(19) not null auto_increment, primary key (id)
) ENGINE MyISAM
/
ALTER TABLE NEGOTIATION_ATTACHMENT_S auto_increment = 1
/

DELIMITER ;
