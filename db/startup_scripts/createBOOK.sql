DROP DATABASE IF EXISTS book;
CREATE DATABASE book;
use book;

CREATE TABLE Author(
   authorID  INT,
   LastName  VARCHAR(50) NOT NULL,
   FirstName VARCHAR(50) NOT NULL,
   Photo     VARCHAR(1),
   constraint author_authorID_pk PRIMARY KEY (authorID)
);

CREATE TABLE Category(
   CatID INT,
   CatDescription VARCHAR(24),
   constraint category_catID_pk PRIMARY KEY (catID)
);

CREATE TABLE State(
   StateCode CHAR(2),
   StateName VARCHAR(50),
   constraint state_statecode_pk PRIMARY KEY (statecode)
);

CREATE TABLE BookCondition(
   Ranks INT,
   Description VARCHAR(50),
   FullDescription VARCHAR(255),
   constraint condition_rank_pk PRIMARY KEY (ranks)
);

CREATE TABLE ConditionEvaluator(
   Evaluator CHAR(3),
   EvaluatorsName VARCHAR(36) NOT NULL,
   constraint condeval_evaluator_pk PRIMARY KEY (evaluator)
);

CREATE TABLE Reviewer(
   ReviewerID INT,
   Name VARCHAR(20) NOT NULL,
   EmployedBy CHAR(30),
   constraint reviewer_reviewerID_pk PRIMARY KEY (reviewerID)
);

CREATE TABLE Owner(
   OwnerID INT,
   LastName VARCHAR(30) NOT NULL,
   FirstName VARCHAR(20) NOT NULL,
   PhoneNumber CHAR(14),
   UserName VARCHAR(30) NOT NULL,
   Password VARCHAR(30) NOT NULL,
   constraint owner_ownerID_pk PRIMARY KEY (ownerID)
);

CREATE TABLE Publisher(
   PublisherID INT,
   Name VARCHAR(50) NOT NULL,
   City VARCHAR(30),
   StateCode CHAR(2),
   constraint publisher_publisherID_pk PRIMARY KEY (publisherID),
   constraint publisher_statecode_fk FOREIGN KEY (StateCode) REFERENCES State(StateCode)
);

CREATE TABLE Book(
   ISBN        CHAR(13),
   Title       VARCHAR(70) NOT NULL,
   Description VARCHAR(100),
   Category    INT,
   Edition     CHAR(30),
   PublisherID INT         NOT NULL,
   constraint book_ISBN_pk PRIMARY KEY (ISBN),
   constraint book_category_fk FOREIGN KEY (Category) REFERENCES Category(CatID),
   constraint book_publisherID_fk FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

CREATE TABLE BookAuthor(
   ISBN CHAR(13) NOT NULL,
   AuthorID INT NOT NULL,
   PrimaryAuthor CHAR(1),
   constraint bookauthor_pk PRIMARY KEY (ISBN, AuthorID),
   constraint bookauthor_ISBN_fk FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
   constraint bookauther_authorID_fk FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE BookReview(
   ISBN CHAR(13) NOT NULL,
   ReviewerID INT NOT NULL,
   Rating INT,
   Comments VARCHAR(255),
   constraint bookreview_pk PRIMARY KEY (ISBN, ReviewerID),
   constraint bookreview_ISBN_fk FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
   constraint bookreview_reviewerID_fk FOREIGN KEY (ReviewerID) REFERENCES Reviewer(ReviewerID)
);

CREATE TABLE OwnersBook(
   OwnerID INT NOT NULL,
   ISBN CHAR(13) NOT NULL,
   Ranks INT,
   Evaluator CHAR(3),
   Comments VARCHAR(255),
   Price DECIMAL(12,2),
   TransactionFlag CHAR(1),
   constraint ownersbook_pk PRIMARY KEY(OwnerID, ISBN),
   constraint ownersbook_ownerid_fk FOREIGN KEY (OwnerID) REFERENCES Owner(OwnerID),
   constraint ownersbook_ISBN_fk FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
   constraint ownersbook_rank_fk FOREIGN KEY (Ranks) REFERENCES BookCondition(Ranks),
   constraint ownersbook_evaluator_fk FOREIGN KEY (Evaluator) REFERENCES ConditionEvaluator(Evaluator)
);

--
-- Dumping data for table 'author'
--

INSERT INTO Author VALUES (1,'Machogeek','Hero','');
INSERT INTO Author VALUES (2,'Stratton','Bill','');
INSERT INTO Author VALUES (3,'Kennedy','Dan','');
INSERT INTO Author VALUES (4,'Sonstein','Jeff','');
INSERT INTO Author VALUES (5,'Troell','Luther','');
INSERT INTO Author VALUES (6,'Lutz','Peter','');
INSERT INTO Author VALUES (7,'Heartthrob','Danielle','');
INSERT INTO Author VALUES (8,'Lawley','Elizabeth','');
INSERT INTO Author VALUES (9,'Weeden','Elissa','');
INSERT INTO Author VALUES (10,'Johnson','Daryl','');
INSERT INTO Author VALUES (11,'Garrison','Dan','');
INSERT INTO Author VALUES (12,'Hartpence','Bruce','');
INSERT INTO Author VALUES (13,'Leone','James','');
INSERT INTO Author VALUES (14,'Phelps','Andrew','');
INSERT INTO Author VALUES (15,'Henderson','Tona','');
INSERT INTO Author VALUES (17,'Webguy','Smerdley','');
INSERT INTO Author VALUES (18,'Jacobs','Steve','');
INSERT INTO Author VALUES (19,'Niemi','Rayno','');
INSERT INTO Author VALUES (20,'Kang','Jai','');
INSERT INTO Author VALUES (21,'Perez-Hardy','Sylvia','');
INSERT INTO Author VALUES (22,'Mason','Sharon','');
INSERT INTO Author VALUES (23,'Perry','Ron','');
INSERT INTO Author VALUES (24,'Whittington','Keith','');
INSERT INTO Author VALUES (25,'Bierre','Kevin','');
INSERT INTO Author VALUES (26,'Holden','Ed','');
INSERT INTO Author VALUES (27,'Axelrod','Mike','');


--
-- Dumping data for table 'category'
--

INSERT INTO Category VALUES (1,'Romance');
INSERT INTO Category VALUES (2,'Comics');
INSERT INTO Category VALUES (3,'Programming');
INSERT INTO Category VALUES (4,'Database');
INSERT INTO Category VALUES (5,'Networking');
INSERT INTO Category VALUES (6,'Library Science');
INSERT INTO Category VALUES (7,'Science');
INSERT INTO Category VALUES (8,'Geography');
INSERT INTO Category VALUES (9,'Sports');


--
-- Dumping data for table 'state'
--

INSERT INTO State VALUES ('AK','ALASKA');
INSERT INTO State VALUES ('AL','ALABAMA');
INSERT INTO State VALUES ('AR','ARKANSAS');
INSERT INTO State VALUES ('AS','AMERICAN SAMOA');
INSERT INTO State VALUES ('AZ','ARIZONA');
INSERT INTO State VALUES ('CA','CALIFORNIA');
INSERT INTO State VALUES ('CO','COLORADO');
INSERT INTO State VALUES ('CT','CONNECTICUT');
INSERT INTO State VALUES ('DC','DISTRICT OF COLUMBIA');
INSERT INTO State VALUES ('DE','DELAWARE');
INSERT INTO State VALUES ('FL','FLORIDA');
INSERT INTO State VALUES ('FM','FEDERATED STATES OF MICRONESIA');
INSERT INTO State VALUES ('GA','GEORGIA');
INSERT INTO State VALUES ('GU','GUAM');
INSERT INTO State VALUES ('HI','HAWAII');
INSERT INTO State VALUES ('IA','IOWA');
INSERT INTO State VALUES ('ID','IDAHO');
INSERT INTO State VALUES ('IL','ILLINOIS');
INSERT INTO State VALUES ('IN','INDIANA');
INSERT INTO State VALUES ('KS','KANSAS');
INSERT INTO State VALUES ('KY','KENTUCKY');
INSERT INTO State VALUES ('LA','LOUISIANA');
INSERT INTO State VALUES ('MA','MASSACHUSETTS');
INSERT INTO State VALUES ('MD','MARYLAND');
INSERT INTO State VALUES ('ME','MAINE');
INSERT INTO State VALUES ('MH','MARSHALL ISLANDS');
INSERT INTO State VALUES ('MI','MICHIGAN');
INSERT INTO State VALUES ('MN','MINNESOTA');
INSERT INTO State VALUES ('MO','MISSOURI');
INSERT INTO State VALUES ('MP','NORTHERN MARIANA ISLANDS');
INSERT INTO State VALUES ('MS','MISSISSIPPI');
INSERT INTO State VALUES ('MT','MONTANA');
INSERT INTO State VALUES ('NC','NORTH CAROLINA');
INSERT INTO State VALUES ('ND','NORTH DAKOTA');
INSERT INTO State VALUES ('NE','NEBRASKA');
INSERT INTO State VALUES ('NH','NEW HAMPSHIRE');
INSERT INTO State VALUES ('NJ','NEW JERSEY');
INSERT INTO State VALUES ('NM','NEW MEXICO');
INSERT INTO State VALUES ('NV','NEVADA');
INSERT INTO State VALUES ('NY','NEW YORK');
INSERT INTO State VALUES ('OH','OHIO');
INSERT INTO State VALUES ('OK','OKLAHOMA');
INSERT INTO State VALUES ('OR','OREGON');
INSERT INTO State VALUES ('PA','PENNSYLVANIA');
INSERT INTO State VALUES ('PR','PUERTO RICO');
INSERT INTO State VALUES ('PW','PALAU');
INSERT INTO State VALUES ('RI','RHODE ISLAND');
INSERT INTO State VALUES ('SC','SOUTH CAROLINA');
INSERT INTO State VALUES ('SD','SOUTH DAKOTA');
INSERT INTO State VALUES ('TN','TENNESSEE');
INSERT INTO State VALUES ('TX','TEXAS');
INSERT INTO State VALUES ('UT','UTAH');
INSERT INTO State VALUES ('VA','VIRGINIA');
INSERT INTO State VALUES ('VI','VIRGIN ISLANDS');
INSERT INTO State VALUES ('VT','VERMONT');
INSERT INTO State VALUES ('WA','WASHINGTON');
INSERT INTO State VALUES ('WI','WISCONSIN');
INSERT INTO State VALUES ('WV','WEST VIRGINIA');
INSERT INTO State VALUES ('WY','WYOMING');


--
-- Dumping data for table 'book condition'
--

INSERT INTO BookCondition VALUES (1,'Bad','Not much is left of the book. Parts are not legible, cover may be missing.');
INSERT INTO BookCondition VALUES (2,'Poor','Pages may be missing. Many pages may be marked.');
INSERT INTO BookCondition VALUES (3,'Average','Less than 3 pages missing. Small markings. Cover intact.');
INSERT INTO BookCondition VALUES (4,'Good','No pages missing, may be marked on less than 5 pages, not obscuring text or diagrams. Cover is in good condition');
INSERT INTO BookCondition VALUES (5,'Excellent','Like new.');


--
-- Dumping data for table 'conditionevaluator'
--

INSERT INTO ConditionEvaluator VALUES ('bgq','Brendle Gottschalk Quakfloat');
INSERT INTO ConditionEvaluator VALUES ('bwq','Brendle Whitehouse Quakfloat');
INSERT INTO ConditionEvaluator VALUES ('bxz','Brendle Xavier Zorfwaite');
INSERT INTO ConditionEvaluator VALUES ('efy','Everest Frandice Yerfwundle');
INSERT INTO ConditionEvaluator VALUES ('evr','Everest Vorble Rufflehouse');
INSERT INTO ConditionEvaluator VALUES ('ews','Everest Whitehouse Xavier');
INSERT INTO ConditionEvaluator VALUES ('ggy','Gertrude Gottschalk Yerfwundle');
INSERT INTO ConditionEvaluator VALUES ('gos','Gertrude Orlando Sweepfuddle');
INSERT INTO ConditionEvaluator VALUES ('jfs','Jamie Frandice Sweepfuddle');
INSERT INTO ConditionEvaluator VALUES ('jwg','Jamie Whitehouse Gruffwinder');
INSERT INTO ConditionEvaluator VALUES ('pap','Paul Alfred Prefwindow');
INSERT INTO ConditionEvaluator VALUES ('pop','Phyllis Orlando Prefwindow');
INSERT INTO ConditionEvaluator VALUES ('pvp','Paul Vorble Prefwindow');
INSERT INTO ConditionEvaluator VALUES ('rxg','Robert Xavier Gruffwinder');
INSERT INTO ConditionEvaluator VALUES ('tag','Thomas Alfred Gruffwinder');
INSERT INTO ConditionEvaluator VALUES ('tgr','Thomas Gottschalk Rufflehouse');
INSERT INTO ConditionEvaluator VALUES ('wwq','William Whitehouse Quakfloat');
INSERT INTO ConditionEvaluator VALUES ('xgz','Xavier Gottschalk Zorfwaite');
INSERT INTO ConditionEvaluator VALUES ('xvx','Xavier Vorble Xavier');


--
-- Dumping data for table 'reviewer'
--

INSERT INTO Reviewer VALUES (1,'Jacobs','Gadget Boy');
INSERT INTO Reviewer VALUES (2,'Troell','Dallas Underground');
INSERT INTO Reviewer VALUES (3,'Bills','The RIT Reporter');
INSERT INTO Reviewer VALUES (4,'Hill','Microsoft News');
INSERT INTO Reviewer VALUES (5,'Kurtz','MacIntosh News');
INSERT INTO Reviewer VALUES (6,'Leone',null);
INSERT INTO Reviewer VALUES (7,'Doubleday','Media Mania');
INSERT INTO Reviewer VALUES (8,'Wells','The RIT Reporter');
INSERT INTO Reviewer VALUES (9,'Worthington','The Annex');
INSERT INTO Reviewer VALUES (10,'Lawson','The Last Word');
INSERT INTO Reviewer VALUES (11,'Lasky',null);
INSERT INTO Reviewer VALUES (12,'Rozanski',null);
INSERT INTO Reviewer VALUES (13,'Whittington','JAVA Rocks');
INSERT INTO Reviewer VALUES (14,'Holden',null);
INSERT INTO Reviewer VALUES (15,'Stratton','Harvard Lampoon');
INSERT INTO Reviewer VALUES (16,'Johnson','NRA Weekly');
INSERT INTO Reviewer VALUES (17,'Mason','BMW Owners Quarterly');
INSERT INTO Reviewer VALUES (18,'Goodman','MacIntosh News');
INSERT INTO Reviewer VALUES (19,'Phelps','Detroit News');
INSERT INTO Reviewer VALUES (20,'Yacci','The Learning Channel');
INSERT INTO Reviewer VALUES (24,'Weeden','Scrye');
INSERT INTO Reviewer VALUES (25,'McVea','Programming Central');
INSERT INTO Reviewer VALUES (26,'Perez-Hardy','The Network Voice');
INSERT INTO Reviewer VALUES (27,'Heartthrob','Journal of Romance');
INSERT INTO Reviewer VALUES (28,'Bierre','JAVA Rocks');
INSERT INTO Reviewer VALUES (29,'Axelrod','JAVA Rocks');



--
-- Dumping data for table 'owner'
--

INSERT INTO Owner VALUES (1,'Fribblestone','Gus','(716) 555-0975','GusBuster@arl.com','democrat');
INSERT INTO Owner VALUES (2,'Scott','Francis','(716) 555-4567','FranTheMan@arl.com','Habib');
INSERT INTO Owner VALUES (3,'Corplestein','Leslie','(716) 555-4567','LesTheLass@hopmail.com','Amit');
INSERT INTO Owner VALUES (4,'Corplestein','Ira','(716) 555-4567','IraBeForever@maybe.com','Peng');
INSERT INTO Owner VALUES (5,'Francis','Scott','(716) 555-0840','scotty@wherever.com','scotty');
INSERT INTO Owner VALUES (6,'Ling','Wei','(716) 555-4567','wxl0101@rit.edu','Cao');
INSERT INTO Owner VALUES (7,'Burblemonger','Mary','(716) 555-8865','GerbilLover@hatmail.com','mymy!');
INSERT INTO Owner VALUES (8,'Rabblewok','George','(716) 555-1989','ForRent@wherever.com','yourmine');
INSERT INTO Owner VALUES (9,'Tripplewander','Martha','(716) 555-2877','TakeMeFirst@quicksend.com','imfirst');
INSERT INTO Owner VALUES (10,'Lumberworker','George','(31) 555-5977','RachetMan@toolbox.net','timthetoolman');
INSERT INTO Owner VALUES (11,'Ferblemander','Frederick','(315) 555-6778','FerbieTheGreat@webSent.net','whoknows');
INSERT INTO Owner VALUES (12,'Ribblemaze','Ronda','(716) 555-2443','RibbleIsHere@webSent.net','idon');


--
-- Dumping data for table 'publisher'
--

INSERT INTO Publisher VALUES (1,'CovertoCover Publishing','Rochester','NY');
INSERT INTO Publisher VALUES (2,'ReadMeFirst House of Publishing','New York','NY');
INSERT INTO Publisher VALUES (3,'TitlesRUs Book Company','Rochester','MN');
INSERT INTO Publisher VALUES (4,'ReadEmandWeep Romance Publishing','Chicago','IL');
INSERT INTO Publisher VALUES (5,'ScanALot Paperback Books','Chicago','IL');
INSERT INTO Publisher VALUES (6,'EZRead Masterpiece Comics','New York','NY');
INSERT INTO Publisher VALUES (7,'CumbersomeText Press','New York','NY');
INSERT INTO Publisher VALUES (8,'PrintingPress Magic','Rochester','NY');
INSERT INTO Publisher VALUES (9,'Guttenberg and Associates','Chicago','IL');
INSERT INTO Publisher VALUES (10,'ReadMeNext House of Publishing','New York','NY');
INSERT INTO Publisher VALUES (11,'ReadEmandSleep Publishing House','Hartford','CT');
INSERT INTO Publisher VALUES (12,'WebTime Publishing Incorporated','Boston','MA');
INSERT INTO Publisher VALUES (13,'The JAVA Press','San Francisco','CA');

--
-- Dumping data for table 'book'
--

INSERT INTO Book VALUES ('1-111-11111-4','Women are From Venus ORACLE is from Beyond Pluto','New York Times Best Seller 27 weeks',1,'4',1);
INSERT INTO Book VALUES ('1-222-32443-7','Calculus for Phys Ed Majors','Carry our 200 lb text book: learn integrals and keep in Shape',7,'3',7);
INSERT INTO Book VALUES ('1-295-84547-1','My Love\'s Last Longing','Volume 1 of 4',1,'1',4);
INSERT INTO Book VALUES ('1-533-73363-8','From the Shores of Lake Erie to IT','One man\'s Journey to IT',8,'2',1);
INSERT INTO Book VALUES ('1-559-68777-1','My Love\'s Last Lingering Lost','Volume 2 of 4',1,'1',4);
INSERT INTO Book VALUES ('1-932-87447-6','The Science of Literature Searching','A Book Worth a Look is Worth a Good Look Up',6,'1',5);
INSERT INTO Book VALUES ('2-089-77869-5','Yes! Networking is for Bills Fans','How to Use a Spanning Tree to Exit Rich Stadium',9,'1',8);
INSERT INTO Book VALUES ('2-122-29058-5','How to Keep your Cellular Bill Down','How to carry 500 Miles of Fiber in Your Wallet',5,'2',2);
INSERT INTO Book VALUES ('2-221-11341-5','Tired of wired? Infrared instead!','500 Ways to pull out your hair while pulling out all your cable',5,'1',2);
INSERT INTO Book VALUES ('3-444-95595-4','ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR','How U can avoid being trapped in Database acronyms',4,'1',3);
INSERT INTO Book VALUES ('3-445-43341-2','Master Wireless Through The Classic Comics','Infrared man triumphs over Cable Guy and CoAx NastyMan',2,'1',6);
INSERT INTO Book VALUES ('3-445-58668-5','How to Keep your Cable Bill Down','How to Avoid Tripping on 500 Miles of Fiber in your wallet',5,'1',10);
INSERT INTO Book VALUES ('4-344-22221-1','I Lasted my Love\'s Last Lingering Longing','Volume 3 of 4',1,'2',4);
INSERT INTO Book VALUES ('4-668-39283-8','From Deep in the Heart of Texas to IT','One man\'s Journey to IT',8,'1',1);
INSERT INTO Book VALUES ('5-538-55746-1','My Lost Love\'s Long Last Lingering','Volume 4 of 4',1,'1',4);
INSERT INTO Book VALUES ('6-449-68668-8','From Brockport to IT','Prof. Johnson\'s Journey to IT (about 25 min via 490)',8,'1',1);
INSERT INTO Book VALUES ('7-999-14432-2','Master HTML Through The Classic Comics','Using his Super Web thrower, Spiderman creates HTML docs',2,'2',6);
INSERT INTO Book VALUES ('8-330-69586-6','The Shortest Book in the World','A Guide to how Detroit will win the World Series in 2001',9,'1',3);
INSERT INTO Book VALUES ('9-333-44441-1','My Love\'s at Long Last Lost his Lingering','Volume 5 of 4',1,'1',4);
INSERT INTO Book VALUES ('9-337-55467-3','How to add Class to your Programming','How to write programs in VB instead of C',3,'3',10);
INSERT INTO Book VALUES ('9-400-55555-2','Master C++ Through The Classic Comics','GeekMan triumphs over C++ program infected with Kryptonite virus',2,'1',6);
INSERT INTO Book VALUES ('9-444-43356-3','A language without Pointers? Priceless.','For Everything Else, there\'s C++',3,'1',13);
INSERT INTO Book VALUES ('9-455-61223-3','JAVA: It\'s more than Just a Programming Language','Achieve enlightenment through the mystery of the Swing package',3,'1',7);

--
-- Dumping data for table 'bookauthor'
--

INSERT INTO BookAuthor VALUES ('1-111-11111-4',9,'Y');
INSERT INTO BookAuthor VALUES ('1-222-32443-7',5,'N');
INSERT INTO BookAuthor VALUES ('1-222-32443-7',11,'N');
INSERT INTO BookAuthor VALUES ('1-222-32443-7',12,'Y');
INSERT INTO BookAuthor VALUES ('1-295-84547-1',7,'Y');
INSERT INTO BookAuthor VALUES ('1-533-73363-8',2,'Y');
INSERT INTO BookAuthor VALUES ('1-559-68777-1',7,'Y');
INSERT INTO BookAuthor VALUES ('1-932-87447-6',8,'Y');
INSERT INTO BookAuthor VALUES ('1-932-87447-6',15,'N');
INSERT INTO BookAuthor VALUES ('2-089-77869-5',6,'Y');
INSERT INTO BookAuthor VALUES ('2-089-77869-5',13,'N');
INSERT INTO BookAuthor VALUES ('2-089-77869-5',14,'N');
INSERT INTO BookAuthor VALUES ('2-122-29058-5',12,'Y');
INSERT INTO BookAuthor VALUES ('2-221-11341-5',12,'Y');
INSERT INTO BookAuthor VALUES ('3-444-95595-4',2,'Y');
INSERT INTO BookAuthor VALUES ('3-445-43341-2',12,'Y');
INSERT INTO BookAuthor VALUES ('3-445-58668-5',12,'Y');
INSERT INTO BookAuthor VALUES ('4-344-22221-1',7,'Y');
INSERT INTO BookAuthor VALUES ('4-668-39283-8',5,'Y');
INSERT INTO BookAuthor VALUES ('5-538-55746-1',7,'Y');
INSERT INTO BookAuthor VALUES ('6-449-68668-8',10,'Y');
INSERT INTO BookAuthor VALUES ('7-999-14432-2',1,'N');
INSERT INTO BookAuthor VALUES ('7-999-14432-2',17,'Y');
INSERT INTO BookAuthor VALUES ('8-330-69586-6',14,'Y');
INSERT INTO BookAuthor VALUES ('9-333-44441-1',7,'Y');
INSERT INTO BookAuthor VALUES ('9-337-55467-3',19,'N');
INSERT INTO BookAuthor VALUES ('9-337-55467-3',20,'Y');
INSERT INTO BookAuthor VALUES ('9-400-55555-2',1,'N');
INSERT INTO BookAuthor VALUES ('9-400-55555-2',17,'Y');
INSERT INTO BookAuthor VALUES ('9-444-43356-3',25,'Y');
INSERT INTO BookAuthor VALUES ('9-444-43356-3',27,'N');
INSERT INTO BookAuthor VALUES ('9-455-61223-3',4,'Y');


--
-- Dumping data for table 'bookreview'
--

INSERT INTO BookReview VALUES ('1-111-11111-4',19,10,'Hold on to your hats, gang! If you think a cookbook or the yellow pages is exciting reading, you gotta read Professor Spada''s remarkable treatise on enriching you personal relationships through your knowledge of ORACLE 8.1.6. In an easy-to-read fashion, s');
INSERT INTO BookReview VALUES ('1-295-84547-1',27,10,'This is one of the most outstanding books ever written. Five thumbs up. Five stars. A must-read for everyone.');
INSERT INTO BookReview VALUES ('1-533-73363-8',20,4,'A rather boring autobiography of a northern Ohio native who migrates to Rochester New York where he becomes a professor of Information Technology at RIT. Other than the chapters devoted to the Cleveland Indians (chapters 1, 2, 3, 6, 10, 11, 12, 13), The C');
INSERT INTO BookReview VALUES ('1-559-68777-1',2,8,'A wonderful romance novel about Matt, a successful editor for the New York Times, who resigns and retreats to a Dude Ranch in New Mexico to find himself.  Matt meets Margaret, a person with cowgirl charm in touch with her masculine self. Matt falls in lov');
INSERT INTO BookReview VALUES ('1-559-68777-1',19,9,'A wonderful romance novel about Margaret, a successful editor for the New York Times, who resigns and retreats to a Dude Ranch in New Mexico to find herself.  Margaret meets Matt, a person with tough cowboy swagger in touch with his feminine self. Margare');

INSERT INTO BookReview VALUES ('2-089-77869-5',5,5,'Definitely don''t buy this book if you are a Giants fan.  Two Giants fans tried this technique at the Giants game several weeks ago and they aren''t back yet.');
INSERT INTO BookReview VALUES ('2-089-77869-5',13,8,'For any networking buff/Bills fan, Dr. Lutz'' treatise on the use of spanning trees to exit a Buffalo Bills game is a must. It is difficult to slog through in spots, but he shows you that by applying his minimalization technique you can get back to Rochest');
INSERT INTO BookReview VALUES ('2-089-77869-5',15,6,'Don''t buy this book unless your are  Bills fan.  Fans of any other team will find their departure time from a Bills game actually triples when the technique is applied. In fact, it probably accounts for why Dr. Lutz (and any other Bills fan who applies it');
INSERT INTO BookReview VALUES ('2-122-29058-5',6,7,'Professor Hartpence shows you how to carry 500 miles of fiber in your wallet.  Warning to the unwary: don''t buy this book unless you have deep pockets.');
INSERT INTO BookReview VALUES ('2-122-29058-5',13,8,'Watch out Jim Carey .. this non-cable guy may leave you out of work. In his book, Professor Hartpence combines his cellular and networking skills with his experience in both the military and the commercial world and the practice of Zen to show you how to');

INSERT INTO BookReview VALUES ('3-444-95595-4',3,4,'U lose if you ever bother to read this book.');
INSERT INTO BookReview VALUES ('3-445-58668-5',6,7,'This book is a follow-up to Professor Hartpence''s book on how to carry 500 miles of fiber in your wallet.');
INSERT INTO BookReview VALUES ('4-344-22221-1',24,7,'A wonderful romance novel about Nelson, a successful editor for the New York Times, who resigns and retreats to a Dude Ranch in New Mexico to find himself.  Nelson meets Laura, a person with cowgirl charm in touch with her masculine self. Nelson falls in');
INSERT INTO BookReview VALUES ('4-668-39283-8',6,6,'A sometimes boring autobiography of a Texan transplanted to Rochester New York where he becomes a professor of Information Technology at RIT. Other than the chapters devoted to the Dallas Cowboys (chapters 1, 2, 3, 6, 10, 11, 12, 13), The Presidential ele');
INSERT INTO BookReview VALUES ('5-538-55746-1',15,9,'A wonderful romance novel about Laura, a successful editor for the New York Times, who resigns and retreats to a Dude Ranch in New Mexico to find herself.  Laura meets Nelson, a person with tough cowboy swagger in touch with his feminine self. Laura falls');

INSERT INTO BookReview VALUES ('6-449-68668-8',20,7,'The funny, often racy, autobiography of Daryl Johnson and his escapades to and from RIT. The book is largely about the excitement of commuting from the west side to RIT every day and how much fun it can be. A great book for those who live on the west side');
INSERT INTO BookReview VALUES ('6-449-68668-8',26,10,'An absolutely outstanding autobiography of a Saint John Fisher Graduate and how he has adapted to his 20 minute ride (mostly on 490) to RIT every morning and his 20 ride (mostly on 490) home from RIT every night. The author uses thirteen chapters to vibra');
INSERT INTO BookReview VALUES ('8-330-69586-6',5,10,'Geez .. no pages, no paragraphs, no words .. not even an illustration. But he did dedicate the book to Tony Clark. Says something for the fervor of this Detroit Tigers fan.');
INSERT INTO BookReview VALUES ('8-330-69586-6',15,10,'Very accurate analysis of a problem that is not NP complete.');
INSERT INTO BookReview VALUES ('9-333-44441-1',24,7,'Throwing the usual themes and twists of a romance novel to the winds, the author tells the store of Laura, a successful Dude Ranch owner in New Mexico, who resigns and moves to New York to seek her fortune as an editor for the New York Times. Laura meets');

INSERT INTO BookReview VALUES ('9-337-55467-3',25,9,'These authors know their way around a coding pad, let me tell you! In clear, bell-shaped tones, with succinct wording and pinpoint accuracy, they nail this subject matter to the wall. Do you like inheritance? How about information hiding? Maybe you like e');
INSERT INTO BookReview VALUES ('9-455-61223-3',13,9,'Professor Sonstein shows how oneness with the spiritual universe can be achieved by bringing the soul into rhytmn with the JAVA runtime machine. He shows that through various forms of self denial, such as writing code without pointers and heavy weight com');


--
-- Dumping data for table 'ownersbook'
--

INSERT INTO OwnersBook VALUES (2,'2-089-77869-5',4,'gos','',40.00,'b');
INSERT INTO OwnersBook VALUES (3,'1-295-84547-1',4,'gos','',50.00,'s');
INSERT INTO OwnersBook VALUES (3,'1-533-73363-8',3,'wwq','',null,'b');
INSERT INTO OwnersBook VALUES (3,'4-668-39283-8',3,'jwg','',null,'s');
INSERT INTO OwnersBook VALUES (4,'2-089-77869-5',4,'pop','',75.00,'s');
INSERT INTO OwnersBook VALUES (4,'2-122-29058-5',5,'pop','',65.00,'s');
INSERT INTO OwnersBook VALUES (4,'3-444-95595-4',2,'pvp','',null,'s');
INSERT INTO OwnersBook VALUES (5,'2-122-29058-5',4,'pvp','',25.00,'s');
INSERT INTO OwnersBook VALUES (5,'3-444-95595-4',3,'pvp','',50.00,'s');
INSERT INTO OwnersBook VALUES (6,'1-932-87447-6',2,'rxg','',60.00,'b');
INSERT INTO OwnersBook VALUES (6,'4-668-39283-8',3,'rxg','',null,'s');
INSERT INTO OwnersBook VALUES (6,'9-333-44441-1',4,'bwq','',100.00,'b');
INSERT INTO OwnersBook VALUES (7,'1-559-68777-1',4,'efy','',80.00,'b');
INSERT INTO OwnersBook VALUES (8,'2-122-29058-5',2,'ggy','',65.00,'s');
INSERT INTO OwnersBook VALUES (9,'3-445-58668-5',1,'jwg','',45.00,'b');
INSERT INTO OwnersBook VALUES (9,'4-344-22221-1',3,'jwg','',null,'s');
INSERT INTO OwnersBook VALUES (9,'5-538-55746-1',4,'jwg','',25.00,'s');
INSERT INTO OwnersBook VALUES (9,'8-330-69586-6',2,'bgq','',35.00,'s');
INSERT INTO OwnersBook VALUES (10,'1-533-73363-8',3,'bgq','',0.00,'s');


