CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Guest`(
  `Id_invitation` INT NOT NULL,
  `Fname` VARCHAR(15) NOT NULL,
  `Lname` VARCHAR(15) NULL,
  `Job` VARCHAR(20) NULL,
  `Phone` INT NULL,
  `Nationality` VARCHAR(20) NULL,
  PRIMARY KEY (`Id_invitation`),
  UNIQUE INDEX `Id_invitation_UNIQUE` (`Id_invitation` ASC))
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Award`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Award` (
  `Award_id` INT NOT NULL,
  `Award_Name` VARCHAR(55) NULL,
  `Sponsor` VARCHAR(25) NULL,
  PRIMARY KEY (`Award_id`))
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Compitations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Compitations` (
  `number` INT NOT NULL,
  `classfication` VARCHAR(45) NULL,
  `Header` VARCHAR(25) NULL,
  `member1` VARCHAR(25) NULL,
  `member2` VARCHAR(25) NULL,
  `member3` VARCHAR(25) NULL,
  `member4` VARCHAR(25) NULL,
  PRIMARY KEY (`number`))
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Film` (
  `Name` VARCHAR(45) NOT NULL,
  `Director_name` VARCHAR(25) NULL,
  `Duration` TIME NULL,
  `Compitations_number` INT NOT NULL,
  PRIMARY KEY (`Name`),
  CONSTRAINT `fk_Film_Compitations1`
    FOREIGN KEY (`Compitations_number`)
    REFERENCES `ELGOUNA FESTIVAL`.`Compitations` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Halls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Halls` (
  `Hall_name` VARCHAR(20) NOT NULL,
  `Hall_number` INT NOT NULL,
  `Capacity` INT NULL,
  PRIMARY KEY (`Hall_number`))
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Staff` (
  `Id` INT NOT NULL,
  `Fname` VARCHAR(15) NULL,
  `Lname` VARCHAR(15) NULL,
  `Phone` INT NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Eventss`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Eventss` (
  `Name` VARCHAR(65) NOT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `Location` VARCHAR(20) NULL,
  `Time` TIME NULL,
  `Halls_Hall_number` INT NOT NULL,
  PRIMARY KEY (`Name`),
  CONSTRAINT `fk_Event_Halls1`
    FOREIGN KEY (`Halls_Hall_number`)
    REFERENCES `ELGOUNA FESTIVAL`.`Halls` (`Hall_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Media` (
  `Rank` VARCHAR(20) NOT NULL,
  `Staff_Id` INT NOT NULL,
  `Role` VARCHAR(25) NULL,
  PRIMARY KEY (`Staff_Id`),
  CONSTRAINT `fk_Media_Staff1`
    FOREIGN KEY (`Staff_Id`)
    REFERENCES `ELGOUNA FESTIVAL`.`Staff` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Share`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Share` (
  `Guest_Id_invitation` INT NOT NULL,
  `Film_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Guest_Id_invitation`, `Film_Name`),
  CONSTRAINT `fk_Share_Guest1`
    FOREIGN KEY (`Guest_Id_invitation`)
    REFERENCES `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Share_Film1`
    FOREIGN KEY (`Film_Name`)
    REFERENCES `ELGOUNA FESTIVAL`.`Film` (`Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Organizor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Organizor` (
  `Staff_Id` INT NOT NULL,
  `language` VARCHAR(25) NULL,
  `Supervisor` INT NULL,
  PRIMARY KEY (`Staff_Id`),
  CONSTRAINT `fk_Organizor_Staff1`
    FOREIGN KEY (`Staff_Id`)
    REFERENCES `ELGOUNA FESTIVAL`.`Staff` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Organizor_Organizor1`
    FOREIGN KEY (`Supervisor`)
    REFERENCES `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Get`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Get` (
  `Film_Name` VARCHAR(45) NOT NULL,
  `Award_Award_id` INT NOT NULL,
  PRIMARY KEY (`Film_Name`, `Award_Award_id`),
  CONSTRAINT `fk_Get_Film1`
    FOREIGN KEY (`Film_Name`)
    REFERENCES `ELGOUNA FESTIVAL`.`Film` (`Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Get_Award1`
    FOREIGN KEY (`Award_Award_id`)
    REFERENCES `ELGOUNA FESTIVAL`.`Award` (`Award_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`security`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ELGOUNA FESTIVAL`.`security` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`security` (
  `Staff_Id` INT NOT NULL,
  `Shefts` VARCHAR(45) NULL,
  PRIMARY KEY (`Staff_Id`),
  CONSTRAINT `fk_table1_Staff1`
    FOREIGN KEY (`Staff_Id`)
    REFERENCES `ELGOUNA FESTIVAL`.`Staff` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Shows`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Shows` (
  `Guest_Id_invitation` INT NOT NULL,
  `Film_Name` VARCHAR(45) NOT NULL,
  `no_of_days` INT NULL,
  `Halls_Hall_number` INT NOT NULL,
  PRIMARY KEY (`Guest_Id_invitation`, `Film_Name`, `Halls_Hall_number`),
  CONSTRAINT `fk_attend_Guest1`
    FOREIGN KEY (`Guest_Id_invitation`)
    REFERENCES `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_attend_Film1`
    FOREIGN KEY (`Film_Name`)
    REFERENCES `ELGOUNA FESTIVAL`.`Film` (`Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_attend_Halls2`
    FOREIGN KEY (`Halls_Hall_number`)
    REFERENCES `ELGOUNA FESTIVAL`.`Halls` (`Hall_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`attend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`attend` (
  `Guest_Id_invitation` INT NOT NULL,
  `Event_Name` VARCHAR(65) NOT NULL,
  `Halls_Hall_number` INT NOT NULL,
  PRIMARY KEY (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`),
  CONSTRAINT `fk_attend_Guest2`
    FOREIGN KEY (`Guest_Id_invitation`)
    REFERENCES `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_attend_Event1`
    FOREIGN KEY (`Event_Name`)
    REFERENCES `ELGOUNA FESTIVAL`.`Eventss` (`Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_attend_Halls1`
    FOREIGN KEY (`Halls_Hall_number`)
    REFERENCES `ELGOUNA FESTIVAL`.`Halls` (`Hall_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`work`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`work` (
  `Event_Name` VARCHAR(65) NOT NULL,
  `Staff_Id` INT NOT NULL,
  `Halls_Hall_number` INT NOT NULL,
  PRIMARY KEY (`Event_Name`, `Staff_Id`, `Halls_Hall_number`),
  CONSTRAINT `fk_work_Event1`
    FOREIGN KEY (`Event_Name`)
    REFERENCES `ELGOUNA FESTIVAL`.`Eventss` (`Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_work_Staff1`
    FOREIGN KEY (`Staff_Id`)
    REFERENCES `ELGOUNA FESTIVAL`.`Staff` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_work_Halls1`
    FOREIGN KEY (`Halls_Hall_number`)
    REFERENCES `ELGOUNA FESTIVAL`.`Halls` (`Hall_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- Table `ELGOUNA FESTIVAL`.`Recieve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELGOUNA FESTIVAL`.`Recieve` (
  `Award_Award_id` INT NOT NULL,
  `about` VARCHAR(35) NULL,
  `Guest_Id_invitation` INT NOT NULL,
  PRIMARY KEY (`Award_Award_id`, `Guest_Id_invitation`),
  CONSTRAINT `fk_Get_Award2`
    FOREIGN KEY (`Award_Award_id`)
    REFERENCES `ELGOUNA FESTIVAL`.`Award` (`Award_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recieve_Guest1`
    FOREIGN KEY (`Guest_Id_invitation`)
    REFERENCES `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Guest`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (1, 'Asmaa', 'Galal', 'Actress', 1258746999, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (2, 'Amir', 'Eid', 'Singer', 1189751452, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (3, 'Kinda', 'Alloush', 'Actress', 1287546232, 'syrian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (4, 'Tara', 'Emad', 'Actress', 1584256551, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (5, 'Ahmed', 'Hatem', 'Actor', 1178964236, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (6, 'Huda', 'Elmufti', 'Actress', 1589645775, 'Edyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (7, 'Aziz', 'Maraka', 'Singer', 1587255469, 'Jordanian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (8, 'Hend', 'Sabry', 'Actress', 1258756369, 'Tunisian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (9, 'Mohammed', 'Samy', 'director', 1475854875, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (10, 'Gamal', 'Eladel', 'producer', 1258554484, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (11, 'Nandita', 'Das', 'Actress', 1159859885, 'Indian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (12, 'Adam', 'bessa', 'Actor', 1258484555, 'Tunisian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (13, 'laura', 'Wessemar', 'Actress', 1584845551, 'British');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (14, 'Joanna', 'Hadji', 'Director', 1258548841, 'Lebanese');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (15, 'Rania', 'Youssif', 'Actress', 1536987154, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (16, 'Mahmoud', 'Hemida', 'Actor', 1255857455, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (17, 'Sylvester', 'Stallone', 'Actor', 1255484156, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (18, 'Khalil', 'Joreige', 'Director', 1584841567, 'Lebanese');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (19, 'Youssef', 'Chahine', 'Director', 1123456001, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (20, 'Hany', 'Abdel Hafez', 'Writer', 1112345036, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (21, 'Amr', 'Waked', 'Actor', 1587654003, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (22, 'Huda', 'Benyamina', 'Producer', 1259873455, 'France');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (23, 'Ali', 'Mostafa', 'Director', 1259873456, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (24, 'Mona', 'Zaki', 'Actor', 1112345006, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (25, 'Asghar', 'Farhadi', 'Writer', 1136987455, 'Iran');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (26, 'Salma', 'Hayek', 'Actor', 1232325987, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (27, 'Khaled', 'Abdelrahman', 'Cinematographer', 1598877009, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (28, 'Marwan', 'Hamed', 'Director', 1554433010, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (29, 'Rami', 'Malek', 'Actor', 1236963687, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (30, 'Haifaa', 'Al-Mansour', 'Director', 1123654789, 'Saudi Arabia');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (31, 'Noura', 'Sami', 'Screenwriter', 1123456013, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (32, 'Karim', 'Abdel Aziz', 'Actor', 1287654014, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (33, 'Layla', 'Bakir', 'Producer', 1236987878, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (34, 'Tamer', 'Hosny', 'Singer', 1112345016, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (35, 'Zainab', 'Omar', 'Director', 1598877017, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (36, 'Omar', 'Sharif', 'Actor', 1554433018, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (37, 'Mohamed', 'Diab', 'Director', 1587654019, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (38, 'Mai', 'Ezz Eldin', 'Actor', 1123456020, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (39, 'Hend', 'Sabri', 'Actor', 1112369698, 'Tunisian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (40, 'Ahmed', 'Helmy', 'Actor', 1234567022, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (41, 'Jonathon', 'millet ', 'director ', 1145456358, 'French');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (42, 'Wissam ', 'charaf', 'director ', 1145876325, 'Lebanese');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (43, 'Schuchi', ' talati', 'director ', 1011256987, 'Indian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (44, 'Maryam ', 'joobeur', 'director ', 1121548796, 'Tunisian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (45, 'Anas', 'zawahri', 'director ', 1254897635, 'Palestinian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (46, 'Julay', ' esparbes', 'producer', 1258798763, 'Palestinian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (47, 'Tawfiq', ' barhoum', 'actor', 1025987896, 'Palestinian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (48, 'Maria', ' Zamora', 'producer', 1154548796, 'SPanish');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (49, 'Hina', ' atallah', 'producer', 1022365498, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (50, 'Yasmine ', 'almasry', 'actress', 1158793654, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (51, 'Quentin', 'Tarantino ', 'Director', 1118887953, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (52, 'Bong ', 'Joon-ho', 'Director', 1213325683, 'South Korean');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (53, 'Kevin ', 'Feige', 'Producer', 1022259874, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (54, 'Emma ', 'Thomas', 'Producer', 1111398752, 'British');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (55, 'Barbara ', 'Broccoli', 'Producer', 1228965478, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (56, 'Hossam', ' El-Din', 'Producer', 1144789653, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (57, 'Sahar', ' Abdel-Rahman', 'Producer', 1212336587, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (58, 'Mohamed ', ' Salah ', 'Director', 1114876532, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (59, 'Nicholas', 'Leaks', 'Producer', 1567894337, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (60, 'Falk', 'Bain', 'Actress', 1256377475, 'Swedish');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (61, 'Silje', 'Evensmo', 'Director', 1135263764, 'Norway');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (62, 'Claire', 'Simon', 'Director', 1234865899, 'Frensh');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (63, 'Michelle', 'Klien', 'Producer', 1563753279, 'British');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (64, 'Sheren', 'Reda', 'Actress', 1163846444, 'Egyrtian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (65, 'Fares', 'Saed', 'Actor', 1237568475, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (66, 'Mohamed', 'Fathy', 'Actor', 1587243782, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (67, 'Ebtsam', 'Modbouly', 'Actress', 1236783648, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (68, 'Saif', 'Madbouly', 'Director', 1142637388, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (69, 'Hend', 'Sohail', 'Director', 1235478490, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (70, 'Norman', 'Yaser', 'Producer', 1173963839, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (71, 'Emad', 'Yakoub', 'Actor', 1564883838, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (72, 'Osama', 'Taha', 'Actor', 1253768847, 'Egyptian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (73, 'Sarah', 'Mollean', 'Director', 1162838399, 'Frensh');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (74, 'Abid', 'Suril', 'Actor', 1567851793, 'Syrian');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (75, 'Utrik', 'Mirso', 'Actor', 1249752649, 'American');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (76, 'Sherif', 'Arafa', 'Director', 1554433024, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (78, 'Fatima', 'Hassan', 'Cinematographer', 1245896235, 'UAE');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (79, 'Dina', 'El Sherbiny', 'Actor', 1123456026, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (80, 'Nelly', 'Karim', 'Actor', 1187654027, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (81, 'Ruba', 'Nadda', 'Director', 1553697423, 'Canada');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (82, 'Khaled', 'El Nabawy', 'Actor', 1112345029, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (83, 'Amira', 'Selim', 'Singer', 1598877030, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (84, 'Sherine', 'Abdel Wahab', 'Singer', 1123456031, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (85, 'Lina', 'Khoury', 'Producer', 1141526387, 'Lebanon');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (86, 'Faten', 'Hamama', 'Actor', 1234567034, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (87, 'Ahmed', 'Ezz', 'Actor', 1087654035, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (88, 'Hany', 'Abdel Hafez', 'Writer', 1112345036, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (89, 'Sherif', 'Fouad', 'Cinematographer', 1554433037, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (90, 'Nour', 'El Tayeb', 'Actor', 1198877038, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (91, 'Wael', 'Hafez', 'Producer', 1687654039, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (92, 'Tarek', 'Zaki', 'Director', 1234567041, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (93, 'Reem', 'Saad', 'Actor', 1587654042, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (94, 'Ola', 'Farouk', 'Producer', 1112345043, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (95, 'Nader', 'El Gendy', 'Writer', 1554433044, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (96, 'Farida', 'Hassan', 'Actor', 1198877045, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (97, 'Sami', 'Tarek', 'Director', 1187654046, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (98, 'Rasha', 'Fouad', 'Cinematographer', 1123456047, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (99, 'Mariam', 'Ali', 'Actor', 1234567048, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (100, 'Hatem', 'Nabil', 'Writer', 1087654049, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (101, 'Hassan', 'Ramadan', 'Director', 1087654032, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (102, 'Lamis', 'Nabil', 'Writer', 1123456040, 'Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Guest` (`Id_invitation`, `Fname`, `Lname`, `Job`, `Phone`, `Nationality`) VALUES (103, 'Laila', 'Salem', 'Actor', 1112345050, 'Egypt');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Award`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (700, 'El Gouna Golden Star For Novilest Film', 'El Gouna Red Sea');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (701, 'El Gouna Silver Star For Novilest Film', 'Owest');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (702, 'El Gouna Bronze Star For Novilest Film', 'CIB');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (703, 'El Gouna  Star For The Best Arabic  Novilest Film', 'BMW');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (704, 'creative Achievement', 'Impact BBDO');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (705, 'El Gouna Silver Star For Sort Film', 'I Productions');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (706, 'El Gouna Bronze Star For Sort Film', 'El Gouna Red Sea');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (707, 'El Gouna Star For The Best Sort Film', 'Ievents');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (708, 'El Gouna Golden Star For Sort Film', 'Concrete');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (709, 'El Gouna Star for Best Actress', 'Al Sagheer');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (710, 'El Gouna Star for Best Actor', 'Abou Ghaly Motors');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (711, 'El Gouna Golden Star for Documentary Film', 'CIB');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (712, 'El Gouna Silver Star for Documentary Film', 'Ticket Egypt');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (713, 'El Gouna Bronze  Star for Documentary Film', 'OWST');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (714, 'El Gouna Green Star', 'Dolato');
INSERT INTO `ELGOUNA FESTIVAL`.`Award` (`Award_id`, `Award_Name`, `Sponsor`) VALUES (715, 'El Gouna  Star forThe Best Arabic  Documentary Film', 'Al Sagheer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Compitations`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Compitations` (`number`, `classfication`, `Header`, `member1`, `member2`, `member3`, `member4`) VALUES (1, ' Novelist ', 'Nandita Das', 'Menna shalaby', 'Sofia gama', 'Charl toson', 'Sibel kekilli');
INSERT INTO `ELGOUNA FESTIVAL`.`Compitations` (`number`, `classfication`, `Header`, `member1`, `member2`, `member3`, `member4`) VALUES (2, 'Documentry', 'Eliane Raheb', 'Hisham Falah', 'Najib Balkadhi', 'Staffi Niederzoll', 'Jerome Bayar');
INSERT INTO `ELGOUNA FESTIVAL`.`Compitations` (`number`, `classfication`, `Header`, `member1`, `member2`, `member3`, `member4`) VALUES (3, 'short Films', 'Amir Elmasry', 'Rakeen Saad', 'Lina Soualem', 'Sam Manaksa', 'Amina Khalil');
INSERT INTO `ELGOUNA FESTIVAL`.`Compitations` (`number`, `classfication`, `Header`, `member1`, `member2`, `member3`, `member4`) VALUES (4, 'El Gouna green star', 'Ahmed Magdy', 'Enemc Fan Der Hel', 'Tara Emad', 'Arwa Tag Elden', 'Fransesco Ferara');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Film`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('اثر الاشباح', 'jonathan MiLLet', '01:45:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('مشقلب', 'Wissam Charaf', '01:31:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('الفتيات يبقين فتيات', 'Shuchi Talati', '01:58:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('الصراع لاجل لايكيبيا', 'peter murimi', '01:34:00', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('المملكة', 'julien colonna', '01:50:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('شكرا لانك تحلم معنا', 'Laila Abbas', '01:32:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('ماء العين', 'meryam joobeur', '02:00:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('رفعت عيني للسماء', 'Ayman El Amir', '01:40:00', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('السلام عليك يا ماريا', 'Mar coll', '01:52:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('ذاكرتي مليئة بالاشباح', 'Anas Zawahri', '01:15:00', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('نوع جديد من البرية', 'Silje Evensmo', '01:24:00', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('الموسيقة التصويرية للانقلاب', 'Johan Grimonprez', '01:45:00', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('لحن في الداخل', 'Farah Kassem', '02:52:00', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('امانة البحر', 'Hend sohel', '00:14:00', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('ما بعد', 'Maha Hai', '00:33:00', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('برتقاله من يافة', 'Mohammed Almughanni', '00:26:00', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('كيف استعدنا والدتنا', 'Goncalo Waddington', '00:29:00', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('مد وجزر', 'Nay Tabbara', '00:19:00', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('اضواء صغيرة', 'Beata Parkanova', '01:16:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('احكيلهم عنك', 'Rand Beiruty', '01:32:00', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('من التراب واليه ', 'Kosay Skinny', '01:29:00', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('تدفق', 'Victor Kosakovsky', '01:25:00', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('المعماري', 'Gentz Zibaludis', '01:38:00', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('اوليفيا والغيوم', 'Tomas Pichardo Espailla', '01:21:00', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('حوريات البحر', 'Claire Simon', '01:05:00', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('بتعلم', 'Saif Modbouly', '00:16:00', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Film` (`Name`, `Director_name`, `Duration`, `Compitations_number`) VALUES ('اخر رساله', 'Sarah Malleon', '00:16:00', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Halls`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Halls` (`Hall_name`, `Hall_number`, `Capacity`) VALUES ('El Gouna center', 1, 300);
INSERT INTO `ELGOUNA FESTIVAL`.`Halls` (`Hall_name`, `Hall_number`, `Capacity`) VALUES ('Audimax Hall', 2, 100);
INSERT INTO `ELGOUNA FESTIVAL`.`Halls` (`Hall_name`, `Hall_number`, `Capacity`) VALUES ('C Cinema 1', 3, 75);
INSERT INTO `ELGOUNA FESTIVAL`.`Halls` (`Hall_name`, `Hall_number`, `Capacity`) VALUES ('C Cinema 2', 4, 75);
INSERT INTO `ELGOUNA FESTIVAL`.`Halls` (`Hall_name`, `Hall_number`, `Capacity`) VALUES ('C Cinema 3', 5, 75);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Staff`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1000, 'Ahmed', 'Ramy', 01025469735, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1001, 'Adel', 'Mohamed', 01297534861, 10000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1002, 'Amir ', 'Wael', 01254879364, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1003, 'Belal', 'Saied', 01258793354, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1004, 'Fares', 'Ahmed', 01225479365, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1005, 'Mohamed', 'Ahmed', 01026478934, 10000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1010, 'Ramy', 'Radwan', 01239696345, 20000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1011, 'Sally', 'Sheheen', 01024587935, 20000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1012, 'Noha ', 'abd Elaziz', 01146987325, 20000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1013, 'Jasmine', 'taha', 01159732486, 20000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1014, 'Jomana', ' Maher', 01125469873, 20000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1015, 'Tarek', 'Hassan', 01155698743, 18000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1016, 'Ahmed', 'Salem', 01125944632, 18000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1017, 'Arwa', 'tag', 01022259476, 18000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1018, 'Ahmed', 'Goda', 01123684575, 18000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1019, 'Sameh', 'Talaat', 01136984556, 13000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1020, 'Gamal', 'Elmosry', 01159876542, 13000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1021, 'Asmaa', 'Khadrawy', 01536987425, 13000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1022, 'salah', 'Ramadan', 01563987245, 13000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1023, 'Samy', 'Emad', 01598763245, 13000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1024, 'Ahmed', 'Amin', 0124589552, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1025, 'Ramy', 'Mohamed', 0151548488, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1026, 'Mostafa', 'Saeed', 0118489512, 10000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1027, 'Ali', 'Kher', 0124849845, 12000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1028, 'Farah', 'Mohamed', 0124589745, 15000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1029, 'Emad', 'Ayman', 0115448545, 12000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1006, 'Mariam', 'Mohammed', 0128489452, 10000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1007, 'Mostafa', 'Said', 0158485555, 14000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1008, 'Osman', 'said', 0114854132, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1009, 'Salah', 'Elsaied', 0128451265, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1030, 'Said', 'Salah', 0113698745, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1031, 'Kher', 'Mohammed', 0101987562, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1032, 'Amin', 'Samy', 0118798745, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1033, 'Ramadan', 'Ahmed', 0102323658, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1034, 'Salah', 'Amin', 0158762369, 13000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1035, 'Mohamed', 'Kher', 0155569874, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1036, 'Ahmed', 'Mohamed', 0155587987, 8000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1037, 'Ramadan', 'Samy', 0154447896, 9000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1038, 'Ramadan', 'Amin', 0123666987, 7000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1039, 'Tarek', 'Tamer', 0125988756, 7000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1040, 'Tarek', 'Abdalhamid', 0155589998, 7000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1041, 'Azza ', 'Ahmed', 0156698755, 7000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1042, 'Samy', 'Magdy', 0123336987, 7000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1043, 'Caroline', 'Tamer', 0122369875, 7000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1044, 'Donia', 'Ahmed', 0125448796, 7000);
INSERT INTO `ELGOUNA FESTIVAL`.`Staff` (`Id`, `Fname`, `Lname`, `Phone`, `Salary`) VALUES (1045, 'Esraa', 'Gamal', 0122365478, 7000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Eventss`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Eventss` (`Name`, `start_date`, `end_date`, `Location`, `Time`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', '2024-10-24', '2024-10-24', 'Gouna Center', '20:00:00', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Eventss` (`Name`, `start_date`, `end_date`, `Location`, `Time`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', '2024-10-27', '2024-10-27', 'plaza', '20:00:00', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`Eventss` (`Name`, `start_date`, `end_date`, `Location`, `Time`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', '2024-10-25', '2024-10-31', 'Plaza', '19:00:00', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Eventss` (`Name`, `start_date`, `end_date`, `Location`, `Time`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', '2024-10-24', '2024-11-1', 'Siny Market', '10:00:00', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Eventss` (`Name`, `start_date`, `end_date`, `Location`, `Time`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', '2024-10-26', '2024-11-1', 'Siny Market', '10:00:00', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Eventss` (`Name`, `start_date`, `end_date`, `Location`, `Time`, `Halls_Hall_number`) VALUES ('Closing Ceremony', '2024-11-1', '2024-11-1', 'Gouna Center', '20:00:00', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Media`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('DMC', 1010, 'Announcer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('On', 1011, 'Announcer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('AL Watan', 1012, 'Announcer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('DMC', 1013, 'Announcer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('ON', 1014, 'Announcer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('Rouya', 1015, 'Photographer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('DMC', 1016, 'Photographer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('Foshia', 1017, 'Photographer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('Youm 7', 1018, 'Photographer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('ON', 1019, 'Photographer');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('Youm 7', 1020, 'Journalist');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('Youm 7', 1021, 'Journalist');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('Rouya', 1022, 'Journalist');
INSERT INTO `ELGOUNA FESTIVAL`.`Media` (`Rank`, `Staff_Id`, `Role`) VALUES ('Foshia', 1023, 'Journalist');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Share`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (60, 'نوع جديد من البرية');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (61, 'نوع جديد من البرية');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (62, 'يتعلم');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (63, 'يتعلم');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (64, 'اخر رساله');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (65, 'اخر رساله');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (66, 'اخر رساله');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (67, 'اخر رساله');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (68, 'اخر رساله');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (69, 'امانة البحر');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (70, 'امانة البحر');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (71, 'امانة البحر');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (72, 'امانة البحر');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (73, 'حوريات البحر ');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (74, 'حوريات البحر ');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (75, 'حوريات البحر ');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (59, 'حوريات البحر ');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (41, 'اثر الاشباح');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (47, 'اثر الاشباح');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (50, 'شكراا لانك تحلم معنا');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (42, 'مشقلب');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (43, 'الفتيات يبقين فتيات');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (44, 'ماء العين');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (45, 'ذاكرتي مليئة بالاشباح');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (46, 'اثر الاشباح');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (48, 'السلام عليك يا ماريا');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (49, 'شكرا لانك تحلم معنا ');
INSERT INTO `ELGOUNA FESTIVAL`.`Share` (`Guest_Id_invitation`, `Film_Name`) VALUES (12, 'اثر الاشباح');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Organizor`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1024, 'Frensh', 1028);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1025, 'German', 1027);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1026, 'indian', 1027);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1027, 'Spanish', null);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1028, 'German', null);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1029, 'indian', 1028);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1030, 'Frensh', 1027);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1031, 'German', 1028);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1032, 'Italian', 1028);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1033, 'Frensh', 1028);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1034, 'Spanish', null);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1035, 'Turkish', 1034);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1036, 'Spanish', 1034);
INSERT INTO `ELGOUNA FESTIVAL`.`Organizor` (`Staff_Id`, `language`, `Supervisor`) VALUES (1037, 'indian', 1034);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Get`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('الفتيات يبقين فتيات', 702);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('الصراع لاجل لايكيبيا', 714);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('المملكة', 701);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('شكرا لانك تحلم معنا', 703);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('ماء العين', 703);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('رفعت عيني للسماء', 715);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('ذاكرتي مليئة بالاشباح', 715);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('نوع جديد من البرية', 713);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('الموسيقة التصويرية للانقلاب', 712);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('لحن في الداخل', 711);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('امانة البحر', 707);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('ما بعد', 708);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('برتقاله من يافة', 705);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('كيف استعدنا والدتنا', 705);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('مد وجزر', 706);
INSERT INTO `ELGOUNA FESTIVAL`.`Get` (`Film_Name`, `Award_Award_id`) VALUES ('اثر الاشباح', 700);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`security`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1000, 'morning');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1001, 'afternoon');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1002, 'evining');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1003, 'evining');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1004, 'morning');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1005, 'afternoon');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1006, 'afternoon');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1007, 'evining');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1008, 'morning');
INSERT INTO `ELGOUNA FESTIVAL`.`security` (`Staff_Id`, `Shefts`) VALUES (1009, 'evining');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Shows`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (1 , 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (3, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (5, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (6, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (7, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (80, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (90, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (65, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (45, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (16, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (18, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (19, 'اثر الاشباح ', 2, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (70, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (40, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (80, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (90, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (100, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (30, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (32, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (85, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (56, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (55, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (102, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (103, 'اوليفيا و الغيوم', 3, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (1, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (2, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (5, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (6, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (8, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (9, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (10, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (80, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (60, 'اضواء صغيرة', 1, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (44, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (55, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (95, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (66, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (77, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (88, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (20, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (22, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (33, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (45, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (16, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (18, 'تدفق', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (20, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (10, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (71, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (73, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (75, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (66, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (67, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (68, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (94, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (93, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (92, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (55, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (95, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (96, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (97, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (43, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (50, 'مشقلب', 4, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (60, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (70, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (80, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (30, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (14, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (95, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (96, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (100, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (101, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (102, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (33, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (99, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (98, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (55, 'شكرا لانك تحلم معنا', 2, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (65, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (23, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (21, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (98, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (68, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (53, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (35, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (57, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (59, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (58, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (55, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (10, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (13, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (16, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (19, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (18, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (17, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (14, 'نوع جديد من البرية', 1, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (15, 'نوع جديد من البرية', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (10, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (54, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (45, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (65, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (67, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (85, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (95, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (68, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (64, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (32, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (20, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (21, 'الفتيات يبقين فتيات', 2, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (25, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (32, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (33, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (65, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (89, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (52, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (15, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (48, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (6, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (8, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (4, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (5, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (3, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (78, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (45, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (12, 'من التراب و اليه', 1, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`Shows` (`Guest_Id_invitation`, `Film_Name`, `no_of_days`, `Halls_Hall_number`) VALUES (55, 'من التراب و اليه', 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`attend`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (1, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (2, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (3, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (4, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (5, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (10, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (11, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (12, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (13, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (14, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (20, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (21, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (22, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (23, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (24, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (30, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (31, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (32, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (33, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (34, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (40, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (41, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (42, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (43, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (44, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (45, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (46, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (47, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (48, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (49, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (50, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (51, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (52, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (53, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (54, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (55, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (56, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (57, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (58, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (59, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (60, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (61, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (62, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (63, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (64, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (65, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (66, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (67, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (68, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (69, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (70, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (71, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (72, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (73, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (74, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (75, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (76, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (77, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (78, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (79, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (80, 'Oppening Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (1 , 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (3, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (5, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (7, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (9, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (11, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (13, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (15, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (17, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (19, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (21, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (23, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (25, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (27, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (29, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (31, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (33, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (35, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (37, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (39, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (41, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (43, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (45, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (47, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (49, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (51, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (53, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (55, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (57, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (90, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (92, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (95, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (96, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (98, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (100, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (101, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (102, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (103, 'Concert(Hesham Nazeh)', 2);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (60, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (61, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (62, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (63, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (64, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (65, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (66, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (67, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (68, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (69, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (70, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (71, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (72, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (73, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (74, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (75, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (76, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (77, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (78, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (79, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (80, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (81, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (82, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (83, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (84, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (85, 'Exhibtion of Egyptian Cities that embraced cinema', 3);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (40, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (41, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (42, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (43, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (44, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (45, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (46, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (47, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (48, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (49, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (50, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (51, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (52, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (53, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (54, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (55, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (56, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (57, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (58, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (59, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (60, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (61, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (62, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (63, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (64, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (65, 'Siny Gouna for emerging talents', 4);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (80 , 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (81, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (82, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (83, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (84, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (85, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (86, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (87, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (88, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (89, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (90, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (91, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (92, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (93, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (94, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (95, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (96, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (97, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (98, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (99, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (100, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (101, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (102, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (103, 'Siny Gouna for short films', 5);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (10, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (11, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (12, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (13, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (14, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (15, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (20, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (21, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (22, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (23, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (24, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (25, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (30, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (31, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (34, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (35, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (36, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (40, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (41, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (42, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (43, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (44, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (50, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (66, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (75, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (80, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (90, 'Closing Ceremony', 1);
INSERT INTO `ELGOUNA FESTIVAL`.`attend` (`Guest_Id_invitation`, `Event_Name`, `Halls_Hall_number`) VALUES (95, 'Closing Ceremony', 1);
COMMIT;
-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`work`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1024, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1009, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1001, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1037, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1004, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1011, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1015, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1018, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1007, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Oppening Ceremony', 1005, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1008, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1010, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1000, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1024, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1028, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1030, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1011, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1015, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1013, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Concert(Hesham Nazeh)', 1035, 2);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1036, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1018, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1016, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1012, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1004, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1006, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1003, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1022, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1023, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Exhibtion of Egyptian Cities that embraced cinema', 1024, 3);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1025, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1028, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1031, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1033, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1001, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1008, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1009, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1005, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1014, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for emerging talents', 1015, 4);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1018, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1003, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1019, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1021, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1020, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1000, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1001, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1004, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Siny Gouna for short films', 1007, 5);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1030, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1035, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1036, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1037, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1004, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1007, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1009, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1011, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1014, 1);
INSERT INTO `ELGOUNA FESTIVAL`.`work` (`Event_Name`, `Staff_Id`, `Halls_Hall_number`) VALUES ('Closing Ceremony', 1015, 1);
COMMIT;
-- -----------------------------------------------------
-- Data for table `ELGOUNA FESTIVAL`.`Recieve`
-- -----------------------------------------------------
START TRANSACTION;
USE `ELGOUNA FESTIVAL`;
INSERT INTO `ELGOUNA FESTIVAL`.`Recieve` (`Award_Award_id`, `about`, `Guest_Id_invitation`) VALUES (704, 'Creative Achievement', 16);
INSERT INTO `ELGOUNA FESTIVAL`.`Recieve` (`Award_Award_id`, `about`, `Guest_Id_invitation`) VALUES (704, 'Creative Achievement', 14);
INSERT INTO `ELGOUNA FESTIVAL`.`Recieve` (`Award_Award_id`, `about`, `Guest_Id_invitation`) VALUES (704, 'Creative Achievement', 18);
INSERT INTO `ELGOUNA FESTIVAL`.`Recieve` (`Award_Award_id`, `about`, `Guest_Id_invitation`) VALUES (709, 'فيلم السلام عليك يا ماريا', 13);
INSERT INTO `ELGOUNA FESTIVAL`.`Recieve` (`Award_Award_id`, `about`, `Guest_Id_invitation`) VALUES (710, 'فيلم اثر الاشباح', 12);

COMMIT;

