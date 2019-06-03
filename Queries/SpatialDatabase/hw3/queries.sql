
/*Table Creation ======================== USED Postgres+PostGIS 

CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

//for adding extension postgis in postgres
*/

CREATE TABLE geo1
(locid integer PRIMARY KEY,
 locname VARCHAR(15),
 locgeom geometry);
 

/*Table Insertion */
INSERT INTO geo1(locid,locname,locgeom)
VALUES
(1,'The Dunes',ST_GeomFromText('POINT(-118.289632 34.0282091)')),
(2,'Expo/Vermont',ST_GeomFromText('POINT(-118.291446 34.018411)')),
(3,'Jeff/Vermont',ST_GeomFromText('POINT(-118.291463 34.025424)')),
(4,'Jeff/Fig',ST_GeomFromText('POINT(-118.280128 34.021897)')),
(5,'Fig/Expo',ST_GeomFromText('POINT(-118.282352 34.018399)')),
(6,'SGM',ST_GeomFromText('POINT(-118.2883177 34.0215008)')),
(7,'Leavey Lib',ST_GeomFromText('POINT(-118.28507 34.0216728)')),
(8,'Lyon Center',ST_GeomFromText('POINT(-118.2906171 34.0244047)')),
(9,'Alumni Park',ST_GeomFromText('POINT(-118.2845154 34.0207963)')),
(10,'Viterbi School',ST_GeomFromText('POINT(-118.2889997 34.0214443)')),
(11,'Parking Lot M',ST_GeomFromText('POINT(-118.2864765 34.0238729)')),
(12,'Cinematic Arts',ST_GeomFromText('POINT(-118.2893487 34.0235218)'));

/* Query 1 */
									 
SELECT ST_CONVEXHULL(ST_MULTI(ST_COLLECT(locgeom)))  as convexHull
INTO convexTb
FROM   geo1;
			
										 
SELECT   ST_ASTEXT(convexHull)   as convexHull
FROM   convexTb;

										 
										 
/* Query 2 */
										 
SELECT A2.locname 
FROM geo1 AS A1, geo1 AS A2 
WHERE  A1.locname = 'The Dunes' AND A1.locname != A2.locname 
ORDER  BY St_distance(A1.locgeom, A2.locgeom) 
LIMIT  4;