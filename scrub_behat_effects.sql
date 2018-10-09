UPDATE openeyes.event
SET
    deleted = TRUE,
    delete_reason = "behat scrub"
WHERE datediff(CURRENT_TIMESTAMP(), last_modified_date) <  1
        AND timediff(current_timestamp(), last_modified_date) < 50000;

COMMIT;