CREATE DATABASE prospect;

CREATE TABLE  polls_prospect (
  'id' int(11) NOT NULL AUTO_INCREMENT,
  'firstname' varchar(100) NOT NULL,
  'lastname' varchar(100) NOT NULL,
  'email' varchar(100) NOT NULL,
  PRIMARY KEY ('id')
);

INSERT INTO polls_prospect VALUES (1,'b','n','nnn'),(2,'Bill','Shetti','billshetti@gmail.com'),(3,'Zoe','Shetti','zoe@gmail.com'),(4,'Zoe','Shetti','zoeshetti@gmail.com'),(5,'Emi','Shetti','e@gmail.com'),(6,'Jason','Bourne','jason@supremacy.com'),(7,'Donald','Duck','donald@disney.com'),(8,'Sean','ODell','sean@vmware.com'),(9,'Emi','Smith','emi@gmail.com'),(10,'Chris','Corde','ccorde@vmware.com');
