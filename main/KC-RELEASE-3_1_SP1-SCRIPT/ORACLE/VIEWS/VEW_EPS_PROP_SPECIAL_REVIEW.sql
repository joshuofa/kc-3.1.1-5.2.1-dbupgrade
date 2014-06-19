-- Coeus View for EPS_PROP_SPECIAL_REVIEW --

CREATE OR REPLACE VIEW OSP$EPS_PROP_SPECIAL_REVIEW(
    PROPOSAL_NUMBER,
    SPECIAL_REVIEW_NUMBER,
    SPECIAL_REVIEW_CODE,
    APPROVAL_TYPE_CODE,
    PROTOCOL_NUMBER,
    APPLICATION_DATE,
    APPROVAL_DATE,
    COMMENTS,
    UPDATE_USER,
    UPDATE_TIMESTAMP)
AS SELECT 
    B.PROPOSAL_NUMBER,
    A.SPECIAL_REVIEW_NUMBER,
    A.SPECIAL_REVIEW_CODE,
    A.APPROVAL_TYPE_CODE,
    A.PROTOCOL_NUMBER,
    A.APPLICATION_DATE,
    A.APPROVAL_DATE,
    A.COMMENTS,
    A.UPDATE_USER,
    A.UPDATE_TIMESTAMP
FROM 
    EPS_PROP_SPECIAL_REVIEW A, EPS_PROPOSAL B
WHERE
    A.PROPOSAL_NUMBER = B.PROPOSAL_NUMBER;

