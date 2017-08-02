-- Music Tutorial Solutions
-- https://sqlzoo.net/wiki/Music_Tutorial

/*
1) Find the title and artist who recorded the song 'Alison'.
*/
SELECT a.title, a.artist
FROM album AS a, track AS t
WHERE t.song = 'Alison' AND a.asin = t.album

/*
2) Which artist recorded the song 'Exodus'?
*/
SELECT a.artist
FROM album AS a, track AS t
WHERE t.song = 'Exodus' AND a.asin = t.album;

/*
3) Show the song for each track on the album 'Blur'.
*/
SELECT t.song
FROM album AS a, track as t
WHERE a.artist = 'Blur' AND a.asin = t.album;

/*
4) For each album show the title and the total number of track.
*/
SELECT a.title, COUNT(t.song)
FROM album AS a, track as t
WHERE a.asin = t.album
GROUP BY a.title;

/*
5) For each album show the title and the total number of tracks
containing the word 'Heart' (albums with no such tracks need not
be shown).
*/
SELECT a.title, COUNT(t.song)
FROM album as a, track as t
WHERE a.asin = t.album AND t.song LIKE '%heart%'
GROUP BY a.title;

/*
6) A "title track" is where the song is the same as the title.
Find the title tracks.
*/
SELECT t.song
FROM album as a, track as t
WHERE a.asin = t.album AND a.title = t.song
GROUP BY t.song;

/*
7) An "eponymous" album is one where the title is the same as the
artist (for example the album 'Blur' by the band 'Blur'). Show the
eponymous albums.
*/
SELECT DISTINCT title
FROM album
WHERE title = artist;

/*
8) Find the songs that appear on more than 2 albums. Include a count
of the number of times each shows up.
*/
SELECT t.song, COUNT(t.song) AS 'song count'
FROM track AS t, album AS a
WHERE t.album = a.asin
GROUP BY t.song
HAVING COUNT(DISTINCT a.title) > 2;

/*
9) A "good value" album is one where the price per track is less
than 50 pence. Find the good value album - show the title, the price
and the number of tracks.
*/
SELECT a.title, a.price, COUNT(t.song) AS 'track count'
FROM album AS a, track as t
WHERE a.asin = t.album
GROUP BY a.title, a.price
HAVING COUNT(t.song) > price * 2;

/*
10) Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby
clocks up 101 tracks.
List albums so that the album with the most tracks is first.
Show the title and the number of tracks
*/
SELECT a.title, COUNT(t.song) AS 'track count'
FROM album AS a, track as t
WHERE a.asin = t.album
GROUP BY a.title
ORDER BY COUNT(t.song) DESC;
