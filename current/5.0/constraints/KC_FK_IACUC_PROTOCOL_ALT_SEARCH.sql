ALTER TABLE IACUC_PROTOCOL_ALT_SEARCH
ADD CONSTRAINT FK_IACUC_PROTO_ALTSRCH 
FOREIGN KEY (PROTOCOL_ID) 
REFERENCES IACUC_PROTOCOL (PROTOCOL_ID)
/
