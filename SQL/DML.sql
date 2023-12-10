-- Populate Members & Login Info
INSERT INTO MemberProfile (member_id, fName, lName, phone, DOB, weight, height )
VALUES (1, 'Roscoe', 'B-C', '1234567890', '2001-05-05', 60, 180 );
INSERT INTO Login (email, password, member_id) VALUES ('rbc@email.com', 'password1', 1);

INSERT INTO MemberProfile (member_id, fName, lName, phone, weight, height )
VALUES (2, 'Erika', 'E', 1111111111, 60.5, 181.1 );
INSERT INTO Login (email, password, member_id) VALUES ('ee@email.com', 'password2', 2);

INSERT INTO MemberProfile (member_id, fName, lName, phone, weight, height )
VALUES (3, 'Liz', 'R', 2222222222, 61, 182.2 );
INSERT INTO Login (email, password, member_id) VALUES ('lr@email.com', 'password3', 3);

INSERT INTO MemberProfile (member_id, fName, lName, phone, DOB, weight, height )
VALUES (4, 'Alicia', 'B', 3333333333, '1991-08-19', 61.5, 183.3 );
INSERT INTO Login (email, password, member_id) VALUES ('ab@email.com', 'password4', 4);

INSERT INTO MemberProfile (member_id, fName, lName, phone, weight, height )
VALUES (5, 'Martin', 'F', 4444444444, 62, 183.5 );
INSERT INTO Login (email, password, member_id) VALUES ('mf@email.com', 'password5', 5);

INSERT INTO MemberProfile (member_id, fName, lName, phone, weight, height )
VALUES (6, 'Sam', 'F', 5555555555, 62.5, 184 );
INSERT INTO Login (email, password, member_id) VALUES ('sf@email.com', 'password6', 6);

INSERT INTO MemberProfile (member_id, fName, lName, phone, weight, height )
VALUES (7, 'Hashmat', 'K', 6666666666, 63, 185.2 );
INSERT INTO Login (email, password, member_id) VALUES ('hk@email.com', 'password7', 7);

INSERT INTO MemberProfile (member_id, fName, lName, phone, DOB, weight, height )
VALUES (8, 'Magnus', 'C', 7777777777, '1998-04-05', 63.5, 186 );
INSERT INTO Login (email, password, member_id) VALUES ('mc@email.com', 'password8', 8);

INSERT INTO MemberProfile (member_id, fName, lName, phone, weight, height )
VALUES (9, 'Sonia', 'C', 8888888888, 64, 187.2 );
INSERT INTO Login (email, password, member_id) VALUES ('sc@email.com', 'password9', 9);

-- Populate some member goals
INSERT INTO MemberGoal VALUES (1, 'strength', False);
INSERT INTO MemberGoal VALUES (1, 'flexibility', True);
INSERT INTO MemberGoal VALUES (1, 'cardio', False);
INSERT INTO MemberGoal VALUES (2, 'strength', False);
INSERT INTO MemberGoal VALUES (4, 'strength', True);
INSERT INTO MemberGoal VALUES (4, 'cardio', False);
INSERT INTO MemberGoal VALUES (5, 'flexibility', False);
INSERT INTO MemberGoal VALUES (6, 'flexibility', True);
INSERT INTO MemberGoal VALUES (7, 'cardio', False);
INSERT INTO MemberGoal VALUES (9, 'strength', True);
INSERT INTO MemberGoal VALUES (9, 'cardio', True);
INSERT INTO MemberGoal VALUES (9, 'felxibility', True);

-- Turn Members into Trainers & set Availability
INSERT INTO Trainer (trainer_id) SELECT member_id FROM MemberProfile WHERE fName = 'Liz' AND lName = 'R';
INSERT INTO TrainerAvailability VALUES (3, '2023-11-20 10:00:00', '2023-11-20 11:59:59');
INSERT INTO TrainerAvailability VALUES (3, '2023-11-20 13:00:00', '2023-11-20 13:59:59');
INSERT INTO TrainerAvailability VALUES (3, '2023-11-20 14:30:00', '2023-11-20 14:59:59');
INSERT INTO TrainerAvailability VALUES (3, '2023-11-21 10:00:00', '2023-11-21 11:59:59');
INSERT INTO TrainerAvailability VALUES (3, '2023-11-22 10:00:00', '2023-11-22 11:59:59');
INSERT INTO TrainerAvailability VALUES (3, '2023-11-23 10:00:00', '2023-11-23 11:59:59');
INSERT INTO TrainerAvailability VALUES (3, '2023-11-23 13:00:00', '2023-11-23 13:59:59');
INSERT INTO TrainerAvailability VALUES (3, '2023-11-23 14:30:00', '2023-11-23 14:59:59');
INSERT INTO TrainerAvailability VALUES (3, '2023-11-24 10:00:00', '2023-11-24 11:59:59');


INSERT INTO Trainer (trainer_id) SELECT member_id FROM MemberProfile WHERE fName = 'Magnus' AND lName = 'C';
UPDATE Trainer SET hourly_pay = 20.56 WHERE trainer_id = 8;
INSERT INTO TrainerAvailability VALUES (8, '2023-11-20 10:00:00', '2023-11-20 11:59:59');
INSERT INTO TrainerAvailability VALUES (8, '2023-11-20 13:00:00', '2023-11-20 13:59:59');
INSERT INTO TrainerAvailability VALUES (8, '2023-11-20 14:30:00', '2023-11-20 14:59:59');
INSERT INTO TrainerAvailability VALUES (8, '2023-11-21 10:00:00', '2023-11-21 11:59:59');
INSERT INTO TrainerAvailability VALUES (8, '2023-11-22 10:00:00', '2023-11-22 11:59:59');
INSERT INTO TrainerAvailability VALUES (8, '2023-11-23 10:00:00', '2023-11-23 11:59:59');
INSERT INTO TrainerAvailability VALUES (8, '2023-11-23 13:00:00', '2023-11-23 13:59:59');
INSERT INTO TrainerAvailability VALUES (8, '2023-11-23 14:30:00', '2023-11-23 14:59:59');
INSERT INTO TrainerAvailability VALUES (8, '2023-11-24 10:00:00', '2023-11-24 11:59:59');

INSERT INTO Trainer (trainer_id) SELECT member_id FROM MemberProfile WHERE fName = 'Sonia' AND lName = 'C';
UPDATE Trainer SET hourly_pay = 24.50 WHERE trainer_id = 9;
INSERT INTO TrainerAvailability VALUES (9, '2023-11-20 10:00:00', '2023-11-20 11:59:59');
INSERT INTO TrainerAvailability VALUES (9, '2023-11-20 13:00:00', '2023-11-20 13:59:59');
INSERT INTO TrainerAvailability VALUES (9, '2023-11-20 14:30:00', '2023-11-20 14:59:59');
INSERT INTO TrainerAvailability VALUES (9, '2023-11-21 10:00:00', '2023-11-21 11:59:59');
INSERT INTO TrainerAvailability VALUES (9, '2023-11-22 10:00:00', '2023-11-22 11:59:59');
INSERT INTO TrainerAvailability VALUES (9, '2023-11-23 10:00:00', '2023-11-23 11:59:59');
INSERT INTO TrainerAvailability VALUES (9, '2023-11-23 13:00:00', '2023-11-23 13:59:59');
INSERT INTO TrainerAvailability VALUES (9, '2023-11-23 14:30:00', '2023-11-23 14:59:59');
INSERT INTO TrainerAvailability VALUES (9, '2023-11-24 10:00:00', '2023-11-24 11:59:59');

-- Sign members up for Personal Training sessions
INSERT INTO RoomBooking VALUES (1, '2023-11-20 14:00:00', '2023-11-20 14:29:59', 'PT Studio A');
INSERT INTO PersonalTrainingSession (booking_id, member_id, trainer_id) VALUES (1, 1, 3);

INSERT INTO RoomBooking VALUES (2, '2023-11-20 14:00:00', '2023-11-20 14:29:59', 'PT Studio B');
INSERT INTO PersonalTrainingSession (booking_id, member_id, trainer_id) VALUES (2, 2, 8);

INSERT INTO RoomBooking VALUES (3, '2023-11-20 14:00:00', '2023-11-20 14:29:59', 'PT Studio C');
INSERT INTO PersonalTrainingSession (booking_id, member_id, trainer_id) VALUES (3, 4, 9);

INSERT INTO RoomBooking VALUES (4, '2023-11-23 14:00:00', '2023-11-23 14:29:59', 'PT Studio A');
INSERT INTO PersonalTrainingSession (booking_id, member_id, trainer_id) VALUES (4, 5, 9);

INSERT INTO RoomBooking VALUES (5, '2023-11-24 13:00:00', '2023-11-24 13:29:59', 'PT Studio A');
INSERT INTO PersonalTrainingSession (booking_id, member_id, trainer_id) VALUES (5, 6, 9);

-- Populate trainer notes into Personal Training sessions
UPDATE PersonalTrainingSession SET notes = 'Good work. We will focus on core strength next week.' WHERE booking_id = 1;
UPDATE PersonalTrainingSession SET notes = 'Excellent job!' WHERE booking_id = 2;
UPDATE PersonalTrainingSession SET notes = 'Please focus on mindfulness.' WHERE booking_id = 3;


-- Create & Book group Classes
INSERT INTO RoomBooking VALUES (6, '2023-11-24 13:00:00', '2023-11-24 13:29:59', 'Combatives Studio');
INSERT INTO GroupClass VALUES (1, 'Dynamic Kickboxing', 6, 9, 55, True);

INSERT INTO RoomBooking VALUES (7, '2023-11-22 13:00:00', '2023-11-22 13:29:59', 'Ice House');
INSERT INTO GroupClass VALUES (2, 'Skating Beginner/Intermediate', 7, 3, 0, False);

INSERT INTO RoomBooking VALUES (8, '2023-11-24 13:00:00', '2023-11-24 13:29:59', 'Activity Room');
INSERT INTO GroupClass VALUES (3, 'Run + Strength Series', 8, 8, 100, False);

-- Sign members up for group Classes
INSERT INTO ClassSignup VALUES (2, 1);
INSERT INTO ClassSignup VALUES (4, 1);

INSERT INTO ClassSignup VALUES (1, 2);
INSERT INTO ClassSignup VALUES (2, 2);
INSERT INTO ClassSignup VALUES (4, 2);
INSERT INTO ClassSignup VALUES (5, 2);

INSERT INTO ClassSignup VALUES (7, 3);
INSERT INTO ClassSignup VALUES (5, 3);
INSERT INTO ClassSignup VALUES (1, 3);

-- Populate Routine Tracking
INSERT INTO RoutineTracking VALUES (1, 'skating', 60, '2023-11-22');
INSERT INTO RoutineTracking VALUES (1, 'running', 60, '2023-11-24');
INSERT INTO RoutineTracking VALUES (1, 'strength', 60, '2023-11-20');

-- Populate Admin Staff
INSERT INTO AdminStaff VALUES (1, 'Steve', 'J');
INSERT INTO AdminStaff VALUES (2, 'Bill', 'G');