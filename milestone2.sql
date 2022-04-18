SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ClubsTableToImportUTF8.csv' 
INTO TABLE club FIELDS TERMINATED BY ',';


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\AllPlayersWithWeightFinal.csv' 
INTO TABLE player FIELDS TERMINATED BY ',';

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PlayersCopyUTF8.csv' 
INTO TABLE player_club_season FIELDS TERMINATED BY ',';

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\StadiumsTableAgainFinalUTF8.csv' 
INTO TABLE stadium FIELDS TERMINATED BY ',';


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ClubsTableToImportUTF8.csv' 
INTO TABLE club FIELDS TERMINATED BY ',';


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\AllMatchesTableWithFoulsToImportUTF8.csv' 
INTO TABLE match_game FIELDS TERMINATED BY ',';

















