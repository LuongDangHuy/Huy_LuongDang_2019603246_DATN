CREATE DATABASE QLDL3;

Use QLDL3;

CREATE TABLE Users (
    UserId int NOT NULL IDENTITY,
    Username nvarchar(255) NOT NULL UNIQUE,
    UserPassword nvarchar(255) NOT NULL,
	Email nvarchar(255) NOT NULL UNIQUE,
	Img text null,
	CreateAt datetime null DEFAULT GETDATE() ,
	DeleteAt datetime DEFAULT null,
	UpdateAt datetime DEFAULT null,
	IsActive nvarchar DEFAULT '1',
    IsAdmin nvarchar DEFAULT '0',
	PRIMARY KEY (UserId)
)

CREATE TABLE LocationTypes (
	LocationTypeID int not null,
	LocationTypeName nvarchar(255) NOT NULL,
	PRIMARY KEY (LocationTypeID)
)
	INSERT INTO LocationTypes VALUES(1,N'??a ?i?m du l?ch')
	INSERT INTO LocationTypes VALUES(2,N'??a ?i?m d?ch v?')
	delete from LocationTypes where(LocationTypeID = 2)
	select *from LocationTypes


CREATE TABLE Locations (
	ID int NOT NULL IDENTITY,
	LocationID nvarchar(50) NOT NULL UNIQUE,
	LocationName nvarchar(255) NOT NULL,
	LocationTypeID int NOT NULL,
	LAddress nvarchar(255) NOT NULL,
	IsPublished nvarchar DEFAULT '1' NOT NULL,
	Img text null,
	Latitude float NOT NULL,
	Longitude float NOT NULL,
	CreateAt datetime NULL DEFAULT GETDATE(),
	UpdateAt datetime NULL,
	PlaceDetail text,
	UserId int NOT NULL,
	CONSTRAINT FK_UsersPlaces FOREIGN KEY (UserId)
    REFERENCES Users(UserId) on delete cascade on update cascade,
	CONSTRAINT FK_LocationTypesLocations FOREIGN KEY (LocationTypeID)
    REFERENCES LocationTypes(LocationTypeID) on delete cascade on update cascade,
	PRIMARY KEY (ID)
)
	INSERT INTO Locations(LocationID,LocationName,LocationTypeID,LAddress,Latitude,Longitude,UserId) values('Pl01','Ho Tay',1,'Ha Noi',21.0456,108.34345,1)
	INSERT INTO Locations(LocationID,LocationName,LocationTypeID,LAddress,Latitude,Longitude,UserId) values('Pl02','Ho Tay2',1,'Ha Noi',2199.0456,10822.34345,1)
	
/*CREATE TABLE ServiceTypes (
	ServiceTypeID int not null,
	ServiceTypeName nvarchar(255) NOT NULL,
	PRIMARY KEY (ServiceTypeID)
)

CREATE TABLE Services (
	ID int NOT NULL IDENTITY,
	ServiceID nvarchar(50) NOT NULL UNIQUE,
	ServiceName nvarchar(255) NOT NULL,
	ServiceTypeID int not null,
	SAddress nvarchar(255) NOT NULL,
	IsPublished nvarchar DEFAULT '1' NOT NULL,
	Img text null,
	Latitude float NOT NULL,
	Longitude float NOT NULL,
	CreateAt datetime NULL DEFAULT GETDATE(),
	UpdateAt datetime,
	ServiceDetail text,
	UserId int NOT NULL,
	CONSTRAINT FK_UsersServices FOREIGN KEY (UserId)
    REFERENCES Users(UserId) on delete cascade on update cascade,
	CONSTRAINT FK_ServiceTypesServices FOREIGN KEY (ServiceTypeID)
    REFERENCES ServiceTypes(ServiceTypeID) on delete cascade on update cascade,
	PRIMARY KEY (ID)
)*/

CREATE TABLE Reviews (
	ID int NOT NULL IDENTITY,
	LocationID nvarchar(50) NOT NULL UNIQUE,
	Star int NOT NULL,
	Comment text NOT NULL,
	Img text null,
	CreateAt datetime NULL DEFAULT GETDATE(),
	DeleteAt datetime,
	UpdateAt datetime,
	UserId int NOT NULL,
	CONSTRAINT FK_UsersReviews FOREIGN KEY (UserId)
    REFERENCES Users(UserId) on delete cascade on update cascade,
	CONSTRAINT FK_LocationsReviews FOREIGN KEY (LocationID)
    REFERENCES Locations(LocationID),
	PRIMARY KEY (ID)
)

CREATE TABLE RecentlyViews (
	ID int NOT NULL IDENTITY,
	ViewID nvarchar(50) NOT NULL UNIQUE,
	CreateAt datetime NULL DEFAULT GETDATE(),
	UserId int NOT NULL,
	CONSTRAINT FK_UsersViews FOREIGN KEY (UserId)
    REFERENCES Users(UserId) on delete cascade on update cascade,
	PRIMARY KEY (ID)
)




	insert into Users values ('admin1','123456','admin1@gmail.com','','','','','1','1')
	insert into Users(Username,UserPassword,Email) values ('custom2','123456','custom2@gmail.com')

	insert into Users values ('admin2','123456','admin2@gmail.com','','','','','',1)
	insert into Users values ('admin3','123456','admin3@gmail.com','','','','','',1)
	insert into Users values ('custom1','123456','custom1@gmail.com','','','','','','')
	insert into Users values ('custom2','123456','custom2@gmail.com','','2022-12-24','','','','')

	select*from Users



	insert into Places values('PL2','2','2','2','true','2',2,2,'','','',1)
	select*from Places
	delete from Places where(ID = 2)