-- TV Relevant Visits
-- Query to determine which sessions are tv relevant (within 5 minutes and that comes from the required channels)
-- Analyst: Jose David Perez 23/06/2021

CREATE VIEW v_tv_relevant_sessions
AS
SELECT s.*,
	   pl.*
FROM main.sessions s,
	 main.tv_planning pl
WHERE channel IN ('Direct','Direct App','Bing CPC Brand','Google CPC Brand','Organic Search Brand')
	AND DATETIME(s.date_hour_minute) BETWEEN DATETIME(pl.block_start_time) AND DATETIME(pl.block_start_time, '5 Minutes')
;