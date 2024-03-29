PRAGMA foreign_keys = ON;

INSERT INTO Plan(price, maxdevicequantity, maxmobilequantity, imgquality)
VALUES (7.99,1,1,1),(11.99,2,2,2),(15.99,4,4,3);

INSERT INTO Country(countryname,nativelanguage)
VALUES ("Portugal","Portuguese"),("Germany","German"),("France","French");

INSERT INTO AgeGroup(agegroupname,minimumage)
VALUES ("Mature",17),("Everyone",3),("M/12", 12);

INSERT INTO User(planID,countryID, username, cc, email, password) 
VALUES 
  ( (SELECT planID FROM Plan WHERE price = 11.99),
	(SELECT countryID FROM Country WHERE countryname = "Portugal"),
	"Rodrigo Monteiro",
	1234567891234567,
	"rodrigo@gmail.com",
	"QWERTYqwerty"),

	((SELECT planID FROM Plan WHERE price = 7.99),
	(SELECT countryID FROM Country WHERE countryname = "Portugal"),
	"Diogo Nunes",
	4567891236453231,
	"diogo@gmail.com",
	"123");


INSERT INTO Genre(genrename)
VALUES	("Action"),("Comedy"),("Romance"),
		("Horror"),("Sitcom"),("Mockumentary"),
		("Animation"),("Adventure"),("Drama"),
		("Crime"),("Thriller");

INSERT INTO Role(rolename)
VALUES 	("Producer"),("Director"),("Actor"),
		("Voice Actor"),("Writer");

INSERT INTO Image(imgname,imglink)
VALUES 	("The_Office_normal_cover","shorturl.at/qczBN2"),
		("The_Office_Profile_Image_Michael","shorturl.at/sAMO5"),
		("Shrek_normal_cover","shorturl.at/mJL69"),
		("The_Nutty_Professor_normal_cover","shorturl.at/cxMTZ"),
		("Default_Profile_Image","www.image.com"),
		("Matrix_Normal_Cover","shorturl.at/qasCF3"),
		("John_Wick_Normal_Cover","shorturl.at/qasKFC3"),
		("Knock_Knock_Normal_Cover","shorturl.at/qasmaC3"),
		("Siberia_Normal_Cover","shorturl.at/qashrb3"),
		("Peaky_Blinders_Cover","shorturl.at/qasmaC21"),
		("MR_Robot_Cover", "shorturl.at/qasmaBOA1");



INSERT INTO Profile(userID,countryID,imgID,favgenre,profilename,birthdate,language)
VALUES( (SELECT userID FROM User WHERE email = "rodrigo@gmail.com"),
		(SELECT countryID FROM User WHERE email = "rodrigo@gmail.com"),
		(SELECT imgID FROM Image WHERE imgname = "The_Office_Profile_Image_Michael"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy"),
		 "Abel Asdrubal",
		 '1978-02-15',
		 "Português"),
		
	  ( (SELECT userID FROM User WHERE email = "rodrigo@gmail.com"),
	  	(SELECT countryID FROM User WHERE email = "rodrigo@gmail.com"),
		(SELECT imgID FROM Image WHERE imgname = "The_Office_Profile_Image_Michael"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy"),
		 "Rodrigo Monteiro",
		 '2007-03-25',
		 "Português"),

	  ( (SELECT userID FROM User WHERE email = "diogo@gmail.com"),
	  	(SELECT countryID FROM User WHERE email = "diogo@gmail.com"),
		(SELECT imgID FROM Image WHERE imgname = "The_Office_Profile_Image_Michael"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy"),
		 "Diogo Nunes",
		 '1965-10-21',
		 "Português");
		

INSERT INTO Show(showname, year,agegroupID, description,coverimg)
VALUES ("The Office",
		("2005"),
		(SELECT agegroupID FROM AgeGroup WHERE minimumage = 17),
		"A mockumentary on a group of typical office workers,
		 where the workday consists of ego clashes,
		  inappropriate behavior, and tedium.",
		(SELECT imglink FROM Image WHERE imgname = "The_Office_normal_cover")),

		("Mr Robot",
		("2013"),
		(SELECT agegroupID FROM AgeGroup WHERE minimumage = 17),
		"Elliot, a brilliant but highly unstable young cyber-security engineer 
		and vigilante hacker, becomes a key figure in a complex game of global 
		dominance when he and his shadowy allies try to take down the corrupt 
		corporation he works for.",
		(SELECT imglink FROM Image WHERE imgname = "MR_Robot_Cover")),
		
		("Peaky Blinders",
		("2013"),
		(SELECT agegroupID FROM AgeGroup WHERE minimumage = 16),
		"A gangster family epic set in 1900s England, centering on a gang who 
		sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby.",
		(SELECT imglink FROM Image WHERE imgname = "Peaky_Blinders_Cover"));

INSERT INTO CastMember(cmembername) 
VALUES ("John Krasinski"),("Jenna Fischer"),("Steve Carrel"),
		("Rainn Wilson"),("Creed Bratton"),("Andrew Adamson"),
		("William Steig"),("Mike Myers"),("Eddie Murphy"),
		("Cillian Murphy"),("Tom Shadyac"),("Keanu Reeves"),
		("Rami Malek");

INSERT INTO Season(seasonnumber,showID,showname)
VALUES (1,
			(SELECT showID FROM Show WHERE showname = "The Office"),
			"The Office"),

			(2,
			(SELECT showID FROM Show WHERE showname = "The Office"),
			"The Office"),

			(1,
			(SELECT showID FROM Show WHERE showname = "Mr Robot"),
			"Mr Robot"),

			(2,
			(SELECT showID FROM Show WHERE showname = "Mr Robot"),
			"Mr Robot"),

			(3,
			(SELECT showID FROM Show WHERE showname = "Mr Robot"),
			"Mr Robot"),

			(4,
			(SELECT showID FROM Show WHERE showname = "Mr Robot"),
			"Mr Robot"),

			(1,
			(SELECT showID FROM Show WHERE showname = "Peaky Blinders"),
			"Peaky Blinders"),

			(2,
			(SELECT showID FROM Show WHERE showname = "Peaky Blinders"),
			"Peaky Blinders"),

			(3,
			(SELECT showID FROM Show WHERE showname = "Peaky Blinders"),
			"Peaky Blinders"),

			(4,
			(SELECT showID FROM Show WHERE showname = "Peaky Blinders"),
			"Peaky Blinders"),

			(5,
			(SELECT showID FROM Show WHERE showname = "Peaky Blinders"),
			"Peaky Blinders");

INSERT INTO Content(imglink, contentname, description, imgquality, videolink, duration)
VALUES  ((SELECT imgiD FROM Image WHERE imgname = "The_Office_normal_cover"),
		"The Office - First Episode",
		"First episode of The Office",
		 2,
		 "www.fakelink.com",
		 "22:28"),

		((SELECT imgID FROM Image WHERE imgname = "The_Office_normal_cover"),
		"The Office - Diversity Day",
		"Michael's controversial imitation of a Chris Rock routine forces
		 the staff to undergo a racial diversity seminar. A consultant 
		 (guest star Larry Wilmore) arrives to teach the staff about tolerance 
		 and diversity, but Michael insists on imparting his own knowledge, 
		 aggravating both the consultant and the entire office staff, and creates 
		 his own diversity seminar. He eventually assigns each staff member an index 
		 card with a different race on it, causing tempers to slowly simmer until 
		 they finally snap. Meanwhile, Jim struggles to keep hold of a lucrative 
		 contract extension, but Dwight makes the sale for himself. Nevertheless, 
		 when Pam falls asleep on Jim's shoulder at the end of the meeting, he 
		 concludes that it was not a bad day.",
		 2,
		 "www.fakelink2.com",
		 "21:47"),

		((SELECT imgID FROM Image WHERE imgname = "The_Office_normal_cover"),
		"The Office - Health Care",
		"In an effort to save money to prevent downsizing, Michael puts
		 Dwight in charge of choosing the company's new health care plan.
		 Dwight's chosen plan slashes benefits, much to the chagrin of the
		 other employees. In an attempt to appease them, Michael promises
		 the entire office a surprise, and then spends the rest of the day
		 scrambling to come through with his promise. The employees wait for 
		 Michael's surprise, which he awkwardly never delivers. Meanwhile, 
		 Jim and Pam amuse themselves with Dwight's medical forms.",
		 2,
		 "www.fakelink3.com",
		 "22:30"),

		((SELECT imgID FROM Image WHERE imgname = "The_Office_normal_cover"),
		"The Office - The Dundies",
		"Michael Scott, regional manager of Dunder Mifflin, announces that it is time
		for the annual Dundie Awards that the employees loathe due to the insulting
		awards Michael bestows on them. At the awards, receptionist Pam Beesly
		tells off her fiancé Roy Anderson, one of the warehouse workers,
		when he insists they leave, and she later gets drunk. Michael becomes
		the bumbling emcee and bestows the regularly embarrassing awards on them.",
		 2,
		 "www.fakelink4.com",
		 "22:47"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - hello friend",
		"A notorious hacker takes an interest in cyber security engineer and vigilante 
		styled computer hacker Elliot, while an evil corporation is hacked",
		 2,
		 "www.fakelink15.com",
		 "50:00"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - ones and zeros",
		"Elliot is hesitant about fsociety; Elliot is offered a new job; Elliot worries 
		about Shayla's association with Fernando Vera; 
		Ollie is given a CD outside of Allsafe; 
		Mr. Robot makes Elliot talk about his father",
		 2,
		 "www.fakelink16.com",
		 "51:00"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - debug",
		"Elliot tries to live a bug-free life, but is quickly drawn back in; 
		Tyrell takes matters into his own hands when the CTO position becomes available; 
		Ollie gets blackmailed; Gideon starts getting suspicious of the infected server.",
		 2,
		 "www.fakelink17.com",
		 "52:00"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - da3m0ns",
		"While dealing with his withdrawal, Elliot suffers a series of 
		hallucinations about his life, while Shayla helps Angela take an unexpected trip.",
		 2,
		 "www.fakelink18.com",
		 "53:00"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - 3xpl0its",
		"Fsociety attempts to penetrate Steel Mountain, the most secure data facility in America, 
		while Angela makes an important decision.",
		 2,
		 "www.fakelink19.com",
		 "54:00"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - br4ve travel",
		"Elliot attempts to hack Vera out of jail in order to save someone he cares about; 
		Tyrell's game gets crazy; 
		and Angela digs deeper into her mother's death.",
		 2,
		 "www.fakelink20.com",
		 "56:00"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - vi3w s0urce",
		"Elliot misses Shayla. Angela makes a deal with Colby. Sharon Knowles has an encounter with Tyrell",
		 2,
		 "www.fakelink21.com",
		 "57:00"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - wh1ter0se",
		"Allsafe is hacked and Elliot is meeting White Rose. Tyrell is interrogated by the police and Elliot 
		remembers who he really is.",
		 2,
		 "www.fakelink22.com",
		 "58:00"),


		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - m1rr0r1ng",
		"Elliot has to face the challenges of his past, and become accustomed to his new found family.",
		 2,
		 "www.fakelink23.com",
		 "59:00"),

		((SELECT imgID FROM Image WHERE imgname = "MR_Robot_Cover"),
		"Mr Robot - zer0-day",
		"Another huge discovery for Elliot surrounding his family and fsociety, Tyrell's world starts to close 
		around him and Angela has a rather unexpected visitor.",
		 2,
		 "www.fakelink24.com",
		 "59:00"),

		((SELECT imgID FROM Image WHERE imgname = "Peaky_Blinders_Cover"),
		"Peaky Blinders - The Noose",
		"It is Christmas and Tommy Shelby receives a letter that makes him realize 
		that he and every member of the family are in danger. He knows that it is 
		time for the family to bury their differences and face the enemy together.",
		 2,
		 "www.fakelink11.com",
		 "55:47"),

		((SELECT imgID FROM Image WHERE imgname = "Peaky_Blinders_Cover"),
		"Peaky Blinders - Heathens",
		"As the Shelbys come to terms with shocking events, Tommy makes a decision 
		he may come to regret. Meanwhile, a bold new enemy makes his move.",
		 2,
		 "www.fakelink12.com",
		 "55:00"),

		((SELECT imgID FROM Image WHERE imgname = "Peaky_Blinders_Cover"),
		"Peaky Blinders - Blackbird",
		"Luca Changretta understands the complexity of his enemy, as the weight of gypsy 
		tradition hangs upon Arthur. But could there be a traitor within the Peaky Blinders' 
		midst?",
		 2,
		 "www.fakelink13.com",
		 "53:00"),

		((SELECT imgID FROM Image WHERE imgname = "Peaky_Blinders_Cover"),
		"Peaky Blinders - Dangerous",
		"In a daring cat and mouse chase, will Tommy be outwitted by his enemies? And with 
		the return of an old friend, Tommy tries to distract himself with other pursuits.",
		 2,
		 "www.fakelink14.com",
		 "56:00"),

		((SELECT imgID FROM Image WHERE imgname = "Shrek_normal_cover"),
		"Shrek",
		"A mean lord exiles fairytale creatures to the swamp of a grumpy ogre,
		 who must go on a quest and rescue a princess for the lord in order to
		 get his land back.",
		 1,
		 "www.fakelink5.com",
		 "01:30:00"),

		((SELECT imgID FROM Image WHERE imgname = "The_Nutty_Professor_normal_cover"),
		"The Nutty Professor",
		"Grossly overweight yet good-hearted professor Sherman Klump takes a 
		special chemical that turns him into the slim but obnoxious Buddy Love.",
		 1,
		 "www.fakelink6.com",
		 "01:28:00"),

		((SELECT imgID FROM Image WHERE imgname = "Matrix_Normal_Cover"),
		"Matrix",
		"When a beautiful stranger leads computer hacker Neo to a forbidding underworld, 
		he discovers the shocking truth--the life he knows is the elaborate deception of 
		an evil cyber-intelligence.",
		 1,
		 "www.fakelink7.com",
		 "02:16:00"),

		((SELECT imgID FROM Image WHERE imgname = "John_Wick_Normal_Cover"),
		"John Wick",
		"An ex-hit-man comes out of retirement to track down the gangsters that 
		killed his dog and took everything from him.",
		 2,
		 "www.fakelink8.com",
		 "01:41:00"),

		((SELECT imgID FROM Image WHERE imgname = "Knock_Knock_Normal_Cover"),
		"Knock Knock",
		"A devoted father helps two stranded young women who knock on his door, 
		but his kind gesture turns into a dangerous seduction and a deadly game of cat and 
		mouse.",
		 2,
		 "www.fakelink9.com",
		 "01:39:00"),

		((SELECT imgID FROM Image WHERE imgname = "Siberia_Normal_Cover"),
		"Siberia",
		"When an American diamond trader's Russian partner goes missing, 
		he journeys to Siberia in search of him, but instead begins a love affair.",
		 2,
		 "www.fakelink10.com",
		 "01:44:00");


INSERT INTO Episode
VALUES ((SELECT contentID FROM Content WHERE contentname = "The Office - First Episode"),
		1,(SELECT seasonID FROM Season WHERE showname = "The Office" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "The Office - Diversity Day"),
		2,(SELECT seasonID FROM Season WHERE showname = "The Office" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "The Office - Health Care"),
		3,(SELECT seasonID FROM Season WHERE showname = "The Office" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "The Office - The Dundies"),
		1,(SELECT seasonID FROM Season WHERE showname = "The Office" AND seasonnumber = 2)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - hello friend"),
		1,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - ones and zeros"),
		2,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - debug"),
		3,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - da3m0ns"),
		4,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - 3xpl0its"),
		5,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - br4ve travel"),
		6,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - vi3w s0urce"),
		7,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - wh1ter0se"),
		8,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - m1rr0r1ng"),
		9,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot - zer0-day"),
		10,(SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "Peaky Blinders - The Noose"),
		1,(SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 5)),
		
		((SELECT contentID FROM Content WHERE contentname = "Peaky Blinders - Heathens"),
		2,(SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 5)),
		
		((SELECT contentID FROM Content WHERE contentname = "Peaky Blinders - Blackbird"),
		3,(SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 5)),
		
		((SELECT contentID FROM Content WHERE contentname = "Peaky Blinders - Dangerous"),
		4,(SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 5));


INSERT INTO Movie
VALUES 	((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		("2001"),
		(SELECT agegroupid FROM AgeGroup WHERE minimumage = 3)),

		((SELECT contentID FROM Content WHERE contentname = "The Nutty Professor"),
		("1996"),
		(SELECT agegroupid FROM AgeGroup WHERE minimumage = 3)),

		((SELECT contentID FROM Content WHERE contentname = "Matrix"),
		("1999"),
		(SELECT agegroupid FROM AgeGroup WHERE minimumage = 12)),

		((SELECT contentID FROM Content WHERE contentname = "John Wick"),
		("2014"),
		(SELECT agegroupid FROM AgeGroup WHERE minimumage = 17)),

		((SELECT contentID FROM Content WHERE contentname = "Knock Knock"),
		("2015"),
		(SELECT agegroupid FROM AgeGroup WHERE minimumage = 17)),

		((SELECT contentID FROM Content WHERE contentname = "Siberia"),
		("2018"),
		(SELECT agegroupid FROM AgeGroup WHERE minimumage = 17));

INSERT INTO GenreShow
VALUES 	((SELECT showID FROM Show WHERE showname = "The Office"),
		(SELECT genreID FROM Genre WHERE genrename = "Sitcom")),

		((SELECT showID FROM Show WHERE showname = "The Office"),
		(SELECT genreID FROM Genre WHERE genrename = "Mockumentary")),

		((SELECT showID FROM Show WHERE showname = "The Office"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy")),

		((SELECT showID FROM Show WHERE showname = "Mr Robot"),
		(SELECT genreID FROM Genre WHERE genrename = "Crime")),

		((SELECT showID FROM Show WHERE showname = "Mr Robot"),
		(SELECT genreID FROM Genre WHERE genrename = "Drama")),

		((SELECT showID FROM Show WHERE showname = "Mr Robot"),
		(SELECT genreID FROM Genre WHERE genrename = "Thriller")),

		((SELECT showID FROM Show WHERE showname = "Peaky Blinders"),
		(SELECT genreID FROM Genre WHERE genrename = "Crime")),

		((SELECT showID FROM Show WHERE showname = "Peaky Blinders"),
		(SELECT genreID FROM Genre WHERE genrename = "Thriller"));

INSERT INTO GenreMovie
VALUES	((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT genreID FROM Genre WHERE genrename = "Adventure")),

		((SELECT contentID FROM content WHERE contentname = "Shrek"),
		(SELECT genreID FROM Genre WHERE genrename = "Animation")),

		((SELECT contentID FROM content WHERE contentname = "Shrek"),
		(SELECT genreID FROM Genre WHERE genrename = "Romance")),

		((SELECT contentID FROM Content WHERE contentname = "The Nutty Professor"),
		(SELECT genreID FROM Genre WHERE genrename = "Romance")),

		((SELECT contentID FROM content WHERE contentname = "Shrek"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy")),

		((SELECT contentID FROM content WHERE contentname = "Matrix"),
		(SELECT genreID FROM Genre WHERE genrename = "Action")),

		((SELECT contentID FROM content WHERE contentname = "John Wick"),
		(SELECT genreID FROM Genre WHERE genrename = "Action")),

		((SELECT contentID FROM content WHERE contentname = "Knock Knock"),
		(SELECT genreID FROM Genre WHERE genrename = "Action")),

		((SELECT contentID FROM content WHERE contentname = "Siberia"),
		(SELECT genreID FROM Genre WHERE genrename = "Action"));


INSERT INTO RolePlayedInMovie
VALUES 	((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Mike Myers"),
		(SELECT roleID FROM Role WHERE rolename = "Voice Actor")),

		((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Eddie Murphy"),
		(SELECT roleID FROM Role WHERE rolename = "Voice Actor")),

		((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Andrew Adamson"),
		(SELECT roleID FROM Role WHERE rolename = "Director")),

		((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "William Steig"),
		(SELECT roleID FROM Role WHERE rolename = "Writer")),

		((SELECT contentID FROM Content WHERE contentname = "Mr Robot"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Rami Malek"),
		(SELECT roleID FROM Role WHERE rolename = "Actor")),

		((SELECT contentID FROM Content WHERE contentname = "Matrix"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Keanu Reeves"),
		(SELECT roleID FROM Role WHERE rolename = "Actor")),
		
		((SELECT contentID FROM Content WHERE contentname = "John Wick"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Keanu Reeves"),
		(SELECT roleID FROM Role WHERE rolename = "Actor")),

		((SELECT contentID FROM Content WHERE contentname = "Knock Knock"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Keanu Reeves"),
		(SELECT roleID FROM Role WHERE rolename = "Actor")),

		((SELECT contentID FROM Content WHERE contentname = "Siberia"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Keanu Reeves"),
		(SELECT roleID FROM Role WHERE rolename = "Actor")),

		((SELECT contentID FROM Content WHERE contentname = "Peaky Blinders"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Cillian Murphy"),
		(SELECT roleID FROM Role WHERE rolename = "Actor"));


INSERT INTO Trailer(seasonID,movieID,thumbnaillink,duration,videolink)
VALUES	((SELECT seasonID FROM Season WHERE showname = "The Office" AND seasonnumber = 1),
		NULL,"https://i3.ytimg.com/vi/CwXOrWvPBPk/maxresdefault.jpg","2:17","https://www.youtube.com/watch?v=CwXOrWvPBPk"),

		((SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 1),
		NULL,"https://i3.ytimg.com/vi/CwXOrWvggGk/maxresdefault.jpg","3:17","https://www.youtube.com/watch?v=CwXOrWvGGkkk"),	

		((SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 2),
		NULL,"https://i3.ytimg.com/vi/CwXOrWvgkkk/maxresdefault.jpg","3:20","https://www.youtube.com/watch?v=CwXOrWvGGFPk"),

		((SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 3),
		NULL,"https://i3.ytimg.com/vi/CwXOrWvglll/maxresdefault.jpg","3:00","https://www.youtube.com/watch?v=CwXOrWvGGlll"),

		((SELECT seasonID FROM Season WHERE showname = "Mr Robot" AND seasonnumber = 3),
		NULL,"https://i3.ytimg.com/vi/CwXOrWvgjpg/maxresdefault.jpg","3:00","https://www.youtube.com/watch?v=CwXOrWvGGjpg"),

		((SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 1),
		NULL,"https://i3.ytimg.com/vi/2iKZmRR9lh4/hqdefault.jpg","3:54","https://www.youtube.com/watch?v=2iKZmLH9AR4"),

		((SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 2),
		NULL,"https://i3.ytimg.com/vi/2iKZmCL9lh4/hqdefault.jpg","4:51","https://www.youtube.com/watch?v=2iCLZmLH9AR4"),

		((SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 3),
		NULL,"https://i3.ytimg.com/vi/2iKZmTT9lh4/hqdefault.jpg","3:51","https://www.youtube.com/watch?v=2icZmLH9AR4"),

		((SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 4),
		NULL,"https://i3.ytimg.com/vi/2iKZoaR9lh4/hqdefault.jpg","3:30","https://www.youtube.com/watch?v=2iboaLH9AR4"),
		
		((SELECT seasonID FROM Season WHERE showname = "Peaky Blinders" AND seasonnumber = 5),
		NULL,"https://i3.ytimg.com/vi/2ifcmRR9lh4/hqdefault.jpg","3:10","https://www.youtube.com/watch?v=2ifcmLH9AR4"),

		(NULL, (SELECT contentID FROM Content WHERE contentname = "Shrek"),
		"https://i3.ytimg.com/vi/2iKZmRR9AR4/hqdefault.jpg","3:51","https://www.youtube.com/watch?v=2iKZmRR9AR4"),

		(NULL, (SELECT contentID FROM Content WHERE contentname = "Matrix"),
		"https://i3.ytimg.com/vi/2iKZmRR8AR5/hqdefault.jpg","3:00","https://www.youtube.com/watch?v=2iKZmDD8AR5"),

		(NULL, (SELECT contentID FROM Content WHERE contentname = "John Wick"),
		"https://i3.ytimg.com/vi/2iKZmKK8AR5/hqdefault.jpg","3:01","https://www.youtube.com/watch?v=2iKZmDD2AR5"),

		(NULL, (SELECT contentID FROM Content WHERE contentname = "Knock Knock"),
		"https://i3.ytimg.com/vi/2iJSmLL8AR5/hqdefault.jpg","2:23","https://www.youtube.com/watch?v=2iKZMGm3R5"),

		(NULL, (SELECT contentID FROM Content WHERE contentname = "Siberia"),
		"https://i3.ytimg.com/vi/2iJSmLL1AF1/hqdefault.jpg","3:23","https://www.youtube.com/watch?v=3gMaMGm3R7");

INSERT INTO ContentView
VALUES 	((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - First Episode"),
				'2022-01-03',"12:10","22:28",5),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - Diversity Day"),
				'2022-01-04',"12:40","21:47",5),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - Health Care"),
				'2022-01-05',"13:58","22:30",4),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "Siberia"),
				'2022-01-06',"12:48","50:30",4),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - The Dundies"),
				'2022-01-07',"13:30","20:47",5),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - 3xpl0its"),
				'2022-01-08',"22:10","41:00",4),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - br4ve travel"),
				'2022-01-09',"19:00","40:00",4),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - vi3w s0urce"),
				'2022-01-10',"22:00","43:00",4),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "John Wick"),
				'2022-01-11',"23:00","01:41:00",5),

				((SELECT profileID FROM Profile WHERE profilename = "Rodrigo Monteiro"),
				(SELECT contentID FROM Content WHERE contentname = "Shrek"),
				'2022-01-14',"10:20","01:15:32",0),

				((SELECT profileID FROM Profile WHERE profilename = "Rodrigo Monteiro"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - First Episode"),
				'2022-01-15',"09:50","10:15",0),

				((SELECT profileID FROM Profile WHERE profilename = "Rodrigo Monteiro"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - wh1ter0se"),
				'2022-01-16',"20:50","10:15",5),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - m1rr0r1ng"),
				'2022-01-07',"13:10","30:18",4),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - zer0-day"),
				'2022-01-08',"14:10","35:18",4),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Matrix"),
				'2022-01-09',"17:48","23:00",3),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - ones and zeros"),
				'2022-01-11',"17:16","46:00",4),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - debug"),
				'2022-01-12',"17:20","50:00",4),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - 3xpl0its"),
				'2022-01-14',"22:25","49:00",4),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Mr Robot - da3m0ns"),
				'2022-01-15',"22:25","45:00",4),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Peaky Blinders - The Noose"),
				'2022-01-16',"17:48","32:00",5),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Peaky Blinders - Heathens"),
				'2022-01-17-',"17:49","49:00",5),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Peaky Blinders - Blackbird"),
				'2022-01-18-',"17:50","35:00",5),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Peaky Blinders - Dangerous"),
				'2022-01-19',"17:51","23:00",5),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "John Wick"),
				'2022-01-15',"17:45","01:41:00",4),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Knock Knock"),
				'2022-01-16',"11:17","45:09",4),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "Siberia"),
				'2022-01-22',"13:27","50:09",4);