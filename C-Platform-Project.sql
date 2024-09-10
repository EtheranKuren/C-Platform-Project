CREATE SCHEMA `cplatform`;

CREATE TABLE `cplatform`.`initiative` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `initiative_name` varchar(99),
  `titleID` int
);

CREATE TABLE `cplatform`.`title` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `TitleName` varchar(99)
);

CREATE TABLE `cplatform`.`regional` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `RegionName` varchar(99),
  `RegionShortName` varchar(99),
  `siteID` int
);

CREATE TABLE `cplatform`.`site` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `SiteName` varchar(99),
  `SiteShortName` varchar(99)
);

CREATE TABLE `cplatform`.`nature` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `NatureName` varchar(99)
);

CREATE TABLE `cplatform`.`category` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `CategoryName` varchar(99),
  `natureID` int
);

CREATE TABLE `cplatform`.`focal_point` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `FocalName` varchar(99),
  `email` email,
  `SIP` varchar(99),
  `department` varchar(255),
  `initiativeID` int
);

CREATE TABLE `cplatform`.`c_platform_view` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `titleID` int,
  `titleName` varchar(99),
  `initiativeID` int,
  `initiativeName` varchar(99),
  `focalPointID` int,
  `FocalPointName` varchar(255),
  `email` email,
  `department` varchar(255),
  `SiteID` int,
  `SiteName` varchar(255),
  `RegionID` int,
  `regionName` varchar(255),
  `NatureID` int,
  `NatureName` varchar(255),
  `CategoryID` int,
  `CategoryName` varchar(255),
  `ConfirmedStartUP` bool,
  `StartUpDateReal` date,
  `EndDate` date,
  `GHGReduction` int,
  `EnergyReduction` int,
  `CToolSaved` bool,
  `CToolValidated` bool,
  `Comment` varchar(255),
  `Created` date,
  `LastModified` date,
  `ApprovalStatus` varchar(15),
  `FolderChild` int
);

ALTER TABLE `cplatform`.`initiative` ADD FOREIGN KEY (`titleID`) REFERENCES `cplatform`.`title` (`ID`);

ALTER TABLE `cplatform`.`focal_point` ADD FOREIGN KEY (`initiativeID`) REFERENCES `cplatform`.`initiative` (`ID`);

ALTER TABLE `cplatform`.`c_platform_view` ADD FOREIGN KEY (`focalPointID`) REFERENCES `cplatform`.`focal_point` (`ID`);

ALTER TABLE `cplatform`.`regional` ADD FOREIGN KEY (`siteID`) REFERENCES `cplatform`.`site` (`ID`);

ALTER TABLE `cplatform`.`c_platform_view` ADD FOREIGN KEY (`RegionID`) REFERENCES `cplatform`.`regional` (`ID`);

ALTER TABLE `cplatform`.`c_platform_view` ADD FOREIGN KEY (`NatureID`) REFERENCES `cplatform`.`nature` (`ID`);

ALTER TABLE `cplatform`.`c_platform_view` ADD FOREIGN KEY (`CategoryID`) REFERENCES `cplatform`.`category` (`ID`);
