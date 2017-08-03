-- Scottish Parliament Solutions
--

/*
1) One MSP was kicked out of the Labour party and has no party.
Find him.
*/
SELECT name
FROM msp
WHERE party IS NULL;

/*
2) Obtain a list of all parties and leaders.
*/
SELECT name, leader
FROM party;

/*
3) Give the party and the leader for the parties which have leaders.
*/
SELECT name, leader
FROM party
WHERE leader IS NOT NULL;

/*
4) Obtain a list of all parties which have at least one MSP.
*/
SELECT DISTINCT p.name
FROM party AS p, msp AS m
WHERE m.party = p.code AND m.name LIKE '%msp%';

/*
5) Obtain a list of all MSPs by name, give the name of the MSP and
the name of the party where available. Be sure that Canavan MSP,
Dennis is in the list. Use ORDER BY msp.name to sort your output by MSP.
*/
SELECT DISTINCT m.name, p.name
FROM msp AS m
LEFT JOIN party AS p ON m.party = p.code
ORDER BY m.name;

/*
6) Obtain a list of parties which have MSPs, include the number of MSPs.
*/
SELECT DISTINCT p.name, COUNT(m.name)
FROM party AS p, msp AS m
WHERE m.name LIKE '%msp%' AND p.code = m.party
GROUP BY p.name;

/*
7) A list of parties with the number of MSPs; include parties
with no MSPs.
*/
SELECT DISTINCT p.name, COUNT(m.name)
FROM party AS p
LEFT JOIN msp AS m ON p.code = m.party
GROUP BY p.name;
