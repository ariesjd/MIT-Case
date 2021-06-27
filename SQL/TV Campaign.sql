-- TV Attribution Waterfall
-- Query to resume the TV campaign across every step
-- Analyst: Jose David Perez 23/06/2021

CREATE VIEW v_tv_waterfall
AS
SELECT	s.channel channel,
		count(*) total_sessions,
		tv_r.tv_relevant_sessions,
		v.tv_sessions
FROM sessions s
LEFT JOIN (
		SELECT channel, count(*) tv_relevant_sessions
		FROM v_tv_relevant_sessions
		GROUP BY channel
		) tv_r
	ON s.channel = tv_r.channel
LEFT JOIN (
		SELECT channel, count(*) tv_sessions
		FROM tv_visits
		GROUP BY channel
		) v
	ON s.channel = v.channel
where s.channel in ('Direct','Direct App','Bing CPC Brand','Google CPC Brand','Organic Search Brand')
GROUP BY 1