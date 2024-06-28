-- 1) Which tracks have the most streams?
SELECT track_name, artist_name, streams
FROM music
WHERE streams IS NOT NULL
ORDER BY streams DESC
LIMIT 10;

-- 2) Do certain artists have a pattern of BPM? (Taylor Swift?)
SELECT track_name, bpm
FROM music
WHERE bpm IS NOT NULL AND artist_name = 'Taylor Swift'
ORDER BY BPM DESC;
-- Varies (range of 126 bpm)

-- 3) Which songs have the highest BPMs?
SELECT track_name, artist_name, bpm
FROM music
WHERE bpm IS NOT NULL
ORDER BY bpm DESC
LIMIT 10;

-- 4) What is the average number of streams per song?
SELECT ROUND(AVG(streams), 2) AS AvgStreamsPerSong
FROM music;
-- 535432384.40

-- 5) What is the relationship between bpm and danceability?
SELECT track_name, bpm, danceability
FROM music
WHERE bpm IS NOT NULL AND danceability IS NOT NULL
ORDER BY BPM ASC;
-- As BPM increases, danceability fluctauates

-- 6) Do songs on more playlists have higher streams (on Spotify)?
SELECT track_name, streams, spotify_playlists, artist_name
FROM music
WHERE streams IS NOT NULL AND spotify_playlists IS NOT NULL
ORDER BY spotify_playlists DESC;
-- Overall seems that way- maybe attach graph

-- 7) Does having more artists contributing lead to higher energy?
SELECT artist_count, energy, track_name, artist_name
FROM music
WHERE energy IS NOT NULL
ORDER BY artist_count ASC;
-- Seems unrelated- as artist count increases, energy fluctuates

-- 8) Does positive content lead to more streams?
SELECT valence, streams, track_name, artist_name
FROM music
WHERE energy IS NOT NULL AND streams IS NOT NULL
ORDER BY valence ASC;
-- Seems unrelated- as positivity (valence) increases, number of streams varies

-- 9) Does danceability correlate to more streams?
SELECT danceability, streams, track_name, artist_name
FROM music
WHERE danceability IS NOT NULL AND streams IS NOT NULL
ORDER BY danceability ASC;
-- Seems unrelated- as danceability increases, number of streams varies

-- 10) How does speechiness (amount of words spoken) impact streams?
SELECT speechiness, streams, track_name, artist_name
FROM music
WHERE speechiness IS NOT NULL AND streams IS NOT NULL
ORDER BY speechiness ASC;
-- Seems unrelated- as speechiness increases, number of streams varies

-- 11) Does the danceability/energy of a song correlate to positivity?
SELECT valence, danceability, energy, track_name, artist_name
FROM music
WHERE valence IS NOT NULL
	AND danceability IS NOT NULL
	AND energy IS NOT NULL
ORDER BY valence ASC;
-- Very low correlation- slight upward trend for both

-- 12) Are more popular songs newer?
UPDATE music
SET sumcharts = (spotify_charts + apple_charts)
WHERE spotify_charts IS NOT NULL
	AND apple_charts IS NOT NULL;

SELECT sumcharts, release_year, track_name, artist_name
FROM music
ORDER BY sumcharts ASC, release_year DESC;
-- The most popular songs (on both the Spotify and
-- Apple Music charts) are mainly from 2022, and almost all of them are from
-- 2019 or earlier (the past 5 years)

UPDATE music
SET sumcharts2 = (spotify_charts + apple_charts + deezer_charts +
	shazam_charts)
WHERE spotify_charts IS NOT NULL
	AND apple_charts IS NOT NULL
	AND deezer_charts IS NOT NULL
	AND shazam_charts IS NOT NULL;

SELECT sumcharts2, release_year, track_name, artist_name
FROM music
ORDER BY release_year DESC;
-- The most popular songs (that reached number 1 on Spotify, Apple Music,
-- Shazam, and Deezer) are mainly from 2022, and almost all of them are from
-- 2021 or earlier (the past 3 years)

-- 13) Which songs (and how many) reached number one on all four platforms?
SELECT COUNT(sumcharts2) AS all_4_charts_number1
FROM music
WHERE sumcharts2 = 4;

SELECT sumcharts2, track_name, artist_name
FROM music
WHERE sumcharts2 = 4;
-- 37 songs reached number 1 on Spotify, Apple Music, Shazam, and Deezer

-- 14) Which tracks/artists are on the most playlists (Apple and Spotify)?
SELECT sumplaylists, track_name, artist_name
FROM music
WHERE sumplaylists IS NOT NULL
ORDER BY sumplaylists DESC
LIMIT 10;

SELECT artist_name, SUM(sumplaylists) AS total_sum
FROM music
GROUP BY artist_name
ORDER BY total_sum DESC;
-- Get Lucky - Radio Edit, Mr. Brightside, Wake Me Up - Radio Edit,
-- and Smells Like Teen Spirit - Remastered 2021 are the top 4
-- tracks on the most Spotify and Apple Music playlists as well as the only
-- tracks on more than 50,000 playlists.

-- The Weeknd, Ed Sheeran, and Taylor Swift are the artists on the most
-- playlists (each on over 125,000).

-- 15) Do certain artists have more speechiness?
SELECT artist_name, SUM(speechiness) AS sum_speechiness
FROM music
WHERE speechiness IS NOT NULL
	AND artist_name IS NOT NULL
GROUP BY artist_name
ORDER BY sumspeechiness DESC
LIMIT 10;
-- Put in table

-- 16) Are more songs major or minor?
SELECT SUM(CASE WHEN mvm LIKE 'Majo%'  THEN 1 ELSE 0 END) AS Major,
	SUM(CASE WHEN mvm LIKE 'Mino%' THEN 1 ELSE 0 END) AS Minor
FROM music;
-- More songs are major than minor (Major: 498 songs, Minor: 349 songs)

-- 17) Which day of the month are songs typically released?
SELECT released_day, COUNT (track_name) AS number_of_songs_released
FROM music
WHERE track_name IS NOT NULL
GROUP BY released_day
ORDER BY number_of_songs_released DESC; 
-- Most songs were released on the 1st of the month, more than double the 
-- amount released on the next highest day, the 21st

-- 18) Is there a pattern in BPMs of the most popular songs?
SELECT sumcharts2, bpm, track_name, artist_name
FROM music
WHERE sumcharts2 > 0
ORDER BY sumcharts2 ASC, bpm DESC;
-- Seems unrelated- as popularity (on all charts) increases, bpm varies

-- 19) Are song releases seasonal?
-- 19a) Quarter released
WITH quarter_released AS (
SELECT release_month, artist_name, track_name, CASE
	WHEN release_month BETWEEN 1 AND 3 THEN 1
	WHEN release_month BETWEEN 4 AND 6 THEN 2
	WHEN release_month BETWEEN 7 AND 9 THEN 3
	WHEN release_month BETWEEN 10 AND 12 THEN 4
	END AS quarter_released
FROM music
)
SELECT quarter_released, COUNT(DISTINCT(artist_name, track_name)) AS song_count
FROM quarter_released
GROUP BY quarter_released
ORDER BY song_count DESC;
/*-- Quarter 1 and Quarter 2 (the top two) had a very similar number of songs
released. */

-- 19b) Month released
WITH month_released AS (
	SELECT release_month, COUNT(DISTINCT(artist_name, track_name)) AS song_count
	FROM music
	GROUP BY release_month
	ORDER BY release_month DESC
)
SELECT *
FROM month_released
ORDER BY song_count DESC;
-- January and May had the highest number of songs released which is evident
-- in the higher number of songs released during Q1 and Q2.

-- 20) Which collaborations between artists have been most successful
--     in terms of chart performance?
SELECT track_name, artist_name, sumcharts2, artist_count
FROM music
WHERE artist_count > 1
ORDER BY sumcharts2 ASC;
-- Insert table

-- 21) Which songs went #1 on Spotify and Apple?
--CREATE VIEW sc1_view AS
--SELECT spotify_charts, track_name, artist_name
--FROM music
--WHERE spotify_charts = 1;
SELECT sc1_view.spotify_charts, sc1_view.track_name, sc1_view.artist_name, music.apple_charts
FROM sc1_view
INNER JOIN music
ON sc1_view.spotify_charts = music.apple_charts;