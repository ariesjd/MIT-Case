-- TV Visits View for Analysis
-- Query to determine which sessions are tv relevant (within 5 minutes and that comes from the required channels)
-- Analyst: Jose David Perez 26/06/2021

CREATE VIEW v_tv_visits_full 
AS
SELECT 	tv.origin,
		tv.channel,
		tv.identifier,
		tv.date_hour_minute,
		tv.tvp_id,
		pl.tv_show_id,
		a.tv_show,
		a.reach,
		pl.block_size,
		pl.block_position,
		pl.spot_id,
		s.spot_name,
		tv.spot_weight,
		s.duration_secs spot_duration,
		tv.tv_probability
FROM tv_visits tv
INNER JOIN tv_planning pl ON tv.tvp_id = pl.tvp_id
INNER JOIN audience a ON pl.tv_show_id = a.tv_show_id
INNER JOIN tv_spots s ON pl.spot_id = s.spot_id
;
