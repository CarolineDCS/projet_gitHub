CREATE OR REPLACE FUNCTION common.extract_log_trigger(message STRING)
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.12'
  HANDLER = 'extract_log_trigger'
AS $$
def extract_log_trigger(message):
    if not message:
        return ""
    parts = message.strip().split(" ")[0].split(":")
    if parts:
        trigger = parts[0].split("=")[-1].strip()
        return trigger
    return ""
$$;
