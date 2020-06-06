-- Query 2: Most number of tracks in each playlist

SELECT
  p.Name,
  COUNT(pT.TrackId) AS "NumberOfTracks"
FROM Playlist p
JOIN PlaylistTrack pT
  ON p.PlaylistId = pT.PlaylistId
GROUP BY p.name;
