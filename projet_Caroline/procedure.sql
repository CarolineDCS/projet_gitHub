-- POUR METTRE LES NOUVELLES DONNEES DANS LA TABLE DE TRAITEMENT
CREATE OR REPLACE PROCEDURE common.identify_new_data()

RETURNS STRING
LANGUAGE SQL

EXECUTE AS CALLER
AS
$$
    INSERT INTO common.com_data_to_process(event_timestamp,process_id, message, event_id)
    (SELECT event_timestamp, process_id, message, event_id FROM raw.raw_events_stream);
$$;
