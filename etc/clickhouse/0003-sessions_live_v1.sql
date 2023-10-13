CREATE VIEW IF NOT EXISTS sessions_live_v1
AS
SELECT
    app_id,
    session_id,
    user_id,
    minSimpleState(e.timestamp) AS min_timestamp,
    maxSimpleState(e.timestamp) AS max_timestamp,
    anySimpleState(os_name) AS os_name,
    anySimpleState(os_version) AS os_version,
    anySimpleState(locale) AS locale,
    anySimpleState(app_version) AS app_version,
    anySimpleState(app_build_number) AS app_build_number,
    anySimpleState(engine_name) AS engine_name,
    anySimpleState(engine_version) AS engine_version,
    anySimpleState(sdk_version) AS sdk_version,
    anySimpleState(country_code) AS country_code,
    anySimpleState(region_name) AS region_name,
    groupArray(event_name) AS events_name,
    groupArray(e.timestamp) AS events_timestamp,
    groupArray(string_props) AS events_string_props,
    groupArray(numeric_props) AS events_numeric_props
FROM events AS e
GROUP BY
    app_id,
    session_id,
    user_id