CREATE TABLE MemberProfile (
	member_id	SERIAL PRIMARY KEY,
	fName	VARCHAR(255) NOT NULL,
	lName	VARCHAR(255) NOT NULL,
	phone		VARCHAR(10) NOT NULL UNIQUE,
	loyalty_points	INT NOT NULL DEFAULT 0,
	fees_charged	NUMERIC(5,2) NOT NULL DEFAULT 0.00,
	fees_paid		NUMERIC(5,2) NOT NULL DEFAULT 0.00,
	DOB			DATE NOT NULL DEFAULT '2000-01-01',
	weight		NUMERIC(4,1),
	height		NUMERIC(4,1)
);
CREATE TABLE Login (
	email		VARCHAR(255) PRIMARY KEY,
	password	VARCHAR(16) NOT NULL,
	member_id	INT UNIQUE,
	FOREIGN KEY (member_id) REFERENCES MemberProfile
);
CREATE TABLE MemberGoal (
	member_id	INT,
	goal		TEXT,
	achieved	BOOLEAN DEFAULT FALSE,
	PRIMARY KEY(member_id, goal),
	FOREIGN KEY (member_id) REFERENCES MemberProfile
);
CREATE TABLE Trainer (
	trainer_id	INT PRIMARY KEY,
	hourly_pay	NUMERIC(5,2) NOT NULL DEFAULT 15.00,
	FOREIGN KEY (trainer_id) REFERENCES MemberProfile(member_id)
);
CREATE TABLE TrainerAvailability (
	trainer_id	INT,
	start_time	TIMESTAMP NOT NULL,
	end_time	TIMESTAMP NOT NULL,
	PRIMARY KEY (trainer_id, start_time),
	FOREIGN KEY (trainer_id) REFERENCES Trainer
);
CREATE TABLE RoomBooking (
	booking_id		SERIAL PRIMARY KEY,
	start_time		TIMESTAMP NOT NULL,
	end_time		TIMESTAMP NOT NULL,
	room_name		VARCHAR(32)
);
CREATE TABLE PersonalTrainingSession (
	booking_id	INT,
	member_id	INT,
	trainer_id	INT,
	notes		TEXT,
	PRIMARY KEY (booking_id, member_id, trainer_id),
	FOREIGN KEY (booking_id) REFERENCES RoomBooking,
	FOREIGN KEY (member_id) REFERENCES MemberProfile,
	FOREIGN KEY (trainer_id) REFERENCES Trainer
);
CREATE TABLE GroupClass (
	class_id		SERIAL PRIMARY KEY,
	name			VARCHAR(128) NOT NULL,
	booking_id		INT,
	trainer_leader	INT,
	cost_per_member	NUMERIC(5,2) NOT NULL DEFAULT 150.00,
	women_only		BOOLEAN,
	FOREIGN KEY (booking_id) REFERENCES RoomBooking,
	FOREIGN KEY (trainer_leader) REFERENCES Trainer
);
CREATE TABLE ClassSignup (
	member_id		INT,
	class_id		INT,
	PRIMARY KEY (member_id, class_id),
	FOREIGN KEY (member_id) REFERENCES MemberProfile,
	FOREIGN KEY (class_id) REFERENCES GroupClass
);
CREATE TABLE RoutineTracking (
	member_id		INT,
	exercise_type	VARCHAR(32) NOT NULL,
	duration		INT NOT NULL,
	exercise_date	DATE DEFAULT CURRENT_DATE,
	PRIMARY KEY (member_id, exercise_type, exercise_date),
	FOREIGN KEY (member_id) REFERENCES MemberProfile
);
CREATE TABLE AdminStaff (
	staff_id	SERIAL PRIMARY KEY,
	first_name	VARCHAR(255) NOT NULL,
	last_name	VARCHAR(255) NOT NULL
);