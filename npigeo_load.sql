------------------------------------
--  npigeo_stage loaded into npigeo
------------------------------------
--The data returned from the US Census API has a longitude/longitude string separated with a comma. 
--That output was loaded into npigeo_stage and in turn the data must be converted to be loaded to the final
--destination table npigeo by ensuring that the NPI does not yet already exist.

INSERT INTO npigeo
     ( NPI
     , Matchflag
     , Matchtype
     , Longitude
     , Latitude)
SELECT NPI
     , Matchflag
     , Matchtype
     , left(LongitudeLatitude,CHARINDEX(',',LongitudeLatitude)-1)                       Longitude --find comma and to the left of that is Longitude
     , right(LongitudeLatitude,len(LongitudeLatitude)-CHARINDEX(',',LongitudeLatitude)) Latitude  --find comma and to the right of that is Latitude
  FROM npigeo_stage ns
 WHERE NOT EXISTS (SELECT 'x'
                     FROM npigeo n
                    WHERE n.NPI = ns.NPI)

GO