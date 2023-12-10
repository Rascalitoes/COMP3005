-- Show a member profile based on login information (Example: email = rbc@email.com, password = password1)
SELECT m.* FROM MemberProfile m, Login l WHERE l.email = 'rbc@email.com' AND l.password = 'password1' AND l.member_id = m.member_id;

-- See all goals of given member (Example: Alicia B)
SELECT g.goal, g.achieved FROM MemberProfile m, MemberGoal g WHERE m.fName = 'Alicia' AND m.lName = 'B' AND m.member_id = g.member_id;

-- See all personal training sessions of given member (Example: Roscoe B-C)
SELECT m2.fName || ' ' || m2.lName AS trainer, b.start_time, b.end_time, pt.notes FROM PersonalTrainingSession pt, MemberProfile m1, MemberProfile m2, RoomBooking b
WHERE m1.fName = 'Roscoe' AND m1.lName = 'B-C' AND m1.member_id = pt.member_id AND pt.booking_id = b.booking_id AND m2.member_id = pt.trainer_id;

-- View a given member's workout routine sorted by date (Example: Roscoe B-C)
SELECT r.exercise_type, r.duration, r.exercise_date FROM MemberProfile m, RoutineTracking r
WHERE m.fName = 'Roscoe' AND m.lName = 'B-C' AND m.member_id = r.member_id ORDER BY r.exercise_date;

-- View the classes a given member is enrolled in (Example: Erika E)
SELECT c.name, b.start_time, b.end_time FROM MemberProfile m, GroupClass c, RoomBooking b, ClassSignup cs
WHERE m.fName = 'Erika' AND m.lName = 'E' AND m.member_id = cs.member_id AND cs.class_id = c.class_id AND c.booking_id = b.booking_id

-- See availability of all trainers
SELECT m.fName, m.lName, ta.start_time, ta.end_time FROM TrainerAvailability ta, Trainer t, MemberProfile m
WHERE m.member_id = t.trainer_id AND ta.trainer_id = t.trainer_id;

-- See availability of a given trainer (Example: Sonia C)
SELECT m.fName, m.lName, ta.start_time, ta.end_time FROM TrainerAvailability ta, Trainer t, MemberProfile m
WHERE m.fName = 'Sonia' AND m.lName = 'C' AND m.member_id = t.trainer_id AND ta.trainer_id = t.trainer_id;

-- See what classes are available
SELECT c.name, m.fName || ' ' || m.lName AS "taught by", c.women_only, b.start_time, b.end_time FROM MemberProfile m, GroupClass c, RoomBooking b
WHERE c.booking_id = b.booking_id AND c.trainer_leader = m.member_id



-- List all members in a class (Example: Skating Beginner/Intermediate)
SELECT m.fName, m.lName FROM MemberProfile m, GroupClass c, ClassSignup cs WHERE c.name = 'Skating Beginner/Intermediate' AND cs.class_id = c.class_id AND cs.member_id = m.member_id;

-- See all personal training sessions of given trainer (Example: Sonia C)
SELECT m2.fName, m2.lName, b.start_time, b.end_time, pt.notes FROM MemberProfile m1, MemberProfile m2, RoomBooking b, PersonalTrainingSession pt
WHERE m1.fName = 'Sonia' AND m1.lName = 'C' AND m1.member_id = pt.trainer_id AND pt.booking_id = b.booking_id AND pt.member_id = m2.member_id;

-- See all personal training sessions of a given trainer after today (Nov 21)
SELECT m2.fName, m2.lName, b.start_time, b.end_time, pt.notes FROM MemberProfile m1, MemberProfile m2, RoomBooking b, PersonalTrainingSession pt
WHERE m1.fName = 'Sonia' AND m1.lName = 'C' AND m1.member_id = pt.trainer_id AND pt.booking_id = b.booking_id AND pt.member_id = m2.member_id AND b.start_time > '2023-11-21';

-- View booked times of a given room (Example: PT Studio A)
SELECT b.start_time, b.end_time FROM RoomBooking b WHERE b.room_name = 'PT Studio A';

-- View all bookings across the gym and what they were booked for
SELECT b.room_name, m.fName AS "booked for", b.start_time, b.end_time FROM RoomBooking b, PersonalTrainingSession pt, MemberProfile m WHERE b.booking_id = pt.booking_id AND pt.trainer_id = m.member_id
UNION ALL
SELECT b.room_name, c.name AS "booked for", b.start_time, b.end_time FROM RoomBooking b, GroupClass c WHERE b.booking_id = c.booking_id;