CREATE TABLE ships (
  id   INT          NOT NULL  PRIMARY KEY,
  eqpweight INT NOT NULL,
  flag  VARCHAR(255) NOT NULL,
  length FLOAT NOT NULL,
  maxcarrying INT NOT NULL,
  maxseaguage FLOAT NOT NULL,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  width FLOAT NOT NULL,
  year INT NOT NULL


)
;

INSERT INTO ships VALUES (1,18468,'Belize',145.0,11478,4.7,'Seabreeze','General Cargo',24.0,1996);
INSERT INTO ships VALUES (2,6620,'Malta',129.3,4606,4.5,'Riroil 4','Tanker',16.5,2002);
INSERT INTO ships VALUES (3,26355,'Malta',157.23,15861,7.5,'Sider Moon','Cargo',27.0,2015);
INSERT INTO ships VALUES (4,82138,'Liberia',229.0,43025,12.4,'Tatry','Bulk Cargo',32.0,2013);
