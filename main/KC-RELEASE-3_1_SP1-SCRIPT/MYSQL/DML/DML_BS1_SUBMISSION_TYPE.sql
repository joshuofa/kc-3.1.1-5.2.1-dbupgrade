-- Create resubmission submission type
INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
VALUES (116, 'Resubmission', NOW(), 'admin', 1, UUID());

COMMIT;
