-- MOVIE BOOKING SYSTEM
-- FRESH RENDER SEED DATA
-- Static catalog data only.
-- users, bookings and booking_seats are intentionally NOT seeded.
-- Run this on a fresh MOVIE_BOOKING database after the tables exist.
USE defaultdb;

SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- 1. CITIES
-- IDs are explicit so theater city_id references cannot mismatch.
-- ============================================================
INSERT INTO cities (id, name, state) VALUES

                                         (1,'Mumbai','Maharashtra'),
                                         (2,'Delhi','Delhi'),
                                         (3,'Bangalore','Karnataka'),
                                         (4,'Hyderabad','Telangana'),
                                         (39,'Chennai','Tamil Nadu'),
                                         (40,'Kolkata','West Bengal'),
                                         (41,'Pune','Maharashtra'),
                                         (42,'Ahmedabad','Gujarat'),
                                         (43,'Jaipur','Rajasthan'),
                                         (44,'Lucknow','Uttar Pradesh'),
                                         (45,'Bhopal','Madhya Pradesh'),
                                         (46,'Indore','Madhya Pradesh'),
                                         (47,'Nagpur','Maharashtra'),
                                         (48,'Surat','Gujarat'),
                                         (49,'Kanpur','Uttar Pradesh'),
                                         (50,'Patna','Bihar'),
                                         (51,'Chandigarh','Chandigarh'),
                                         (52,'Visakhapatnam','Andhra Pradesh'),
                                         (53,'Coimbatore','Tamil Nadu'),
                                         (54,'Kochi','Kerala'),
                                         (55,'Thiruvananthapuram','Kerala'),
                                         (56,'Guwahati','Assam'),
                                         (57,'Bhubaneswar','Odisha'),
                                         (58,'Ranchi','Jharkhand'),
                                         (59,'Raipur','Chhattisgarh'),
                                         (60,'Dehradun','Uttarakhand'),
                                         (61,'Amritsar','Punjab'),
                                         (62,'Ludhiana','Punjab'),
                                         (63,'Varanasi','Uttar Pradesh'),
                                         (64,'Agra','Uttar Pradesh'),
                                         (65,'Vadodara','Gujarat'),
                                         (66,'Nashik','Maharashtra'),
                                         (67,'Mysuru','Karnataka'),
                                         (68,'Vijayawada','Andhra Pradesh');


-- ============================================================
-- 2. MOVIES
-- 49 movies. IDs are explicit so shows.movie_id cannot mismatch.
-- Poster URLs use the verified URLs collected earlier where available.
-- Vikram and Aavesham retain their source URLs because a direct URL
-- was not verified in the available source material.
-- ============================================================
INSERT INTO movies
(id, title, description, genre, language, duration_minutes, rating, release_date, poster_url)
VALUES

    (1,'Pushpa 2','The rule of Pushpa Raj continues','Action','Telugu',150,8.2,'2025-12-05','https://upload.wikimedia.org/wikipedia/en/1/11/Pushpa_2-_The_Rule.jpg'),
    (2,'Jawan','A high-energy action thriller','Action','Hindi',160,7.9,'2025-09-07','https://upload.wikimedia.org/wikipedia/en/3/39/Jawan_film_poster.jpg'),
    (3,'Animal','A son and his complicated relationship with his father','Drama','Hindi',180,7.5,'2023-12-01','https://images.filmibeat.com/ph-big/2023/01/animal-2023_167264941510.jpg'),
    (4,'Leo','A cafe owner hides a violent past','Thriller','Tamil',155,7.0,'2023-10-19','https://upload.wikimedia.org/wikipedia/en/7/75/Leo_%282023_Indian_film%29.jpg'),
    (5,'Dunki','A story about friendship and immigration','Comedy','Hindi',140,6.8,'2023-12-21','https://upload.wikimedia.org/wikipedia/en/4/4f/Dunki_poster.jpg'),
    (6,'RRR','Two revolutionaries form an unlikely friendship','Action','Telugu',182,8.0,'2022-03-25','https://upload.wikimedia.org/wikipedia/en/d/d7/RRR_Poster.jpg'),
    (7,'KGF Chapter 2','Rocky faces powerful enemies','Action','Kannada',168,8.4,'2022-04-14','https://upload.wikimedia.org/wikipedia/en/d/d0/K.G.F_Chapter_2.jpg'),
    (8,'Kantara','A village story involving tradition and mystery','Drama','Kannada',148,8.0,'2022-09-30','https://upload.wikimedia.org/wikipedia/en/8/84/Kantara_poster.jpeg'),
    (9,'Drishyam 2','A family struggles to protect its secret','Crime','Hindi',140,8.2,'2022-11-18','https://upload.wikimedia.org/wikipedia/en/3/3f/Drishyam_2.jpg'),
    (10,'Brahmastra','A young man discovers a mysterious power','Fantasy','Hindi',167,5.5,'2022-09-09','https://upload.wikimedia.org/wikipedia/en/e/ea/Brahmastra_Part_One_Shiva.jpg'),
    (11,'12th Fail','A student fights against difficult circumstances','Drama','Hindi',147,9.0,'2023-10-27','https://upload.wikimedia.org/wikipedia/en/f/f2/12th_Fail_poster.jpeg'),
    (12,'Stree 2','A mysterious force returns to a small town','Horror','Hindi',149,7.5,'2024-08-15','https://upload.wikimedia.org/wikipedia/en/a/a1/Stree_2.jpg'),
    (13,'Bhool Bhulaiyaa 3','A supernatural mystery with unexpected twists','Horror','Hindi',158,6.0,'2024-11-01','https://upload.wikimedia.org/wikipedia/en/e/e4/Bhool_Bhulaiyaa_3_poster.jpg'),
    (14,'Kalki 2898 AD','A futuristic story set in a distant world','Sci-Fi','Telugu',181,8.0,'2024-06-27','https://upload.wikimedia.org/wikipedia/en/4/4c/Kalki_2898_AD.jpg'),
    (15,'Salaar','A powerful friendship is tested by a violent conflict','Action','Telugu',175,6.5,'2023-12-22','https://upload.wikimedia.org/wikipedia/en/a/a6/Salaar_Part_1_%E2%80%93_Ceasefire.jpg'),
    (16,'Vikram','A special team investigates a mysterious drug network','Action','Tamil',174,8.3,'2022-06-03','https://example.com/posters/vikram.jpg'),
    (17,'Jailer','A retired jailer returns to action','Action','Tamil',168,7.1,'2023-08-10','https://upload.wikimedia.org/wikipedia/en/c/cb/Jailer_2023_Tamil_film_poster.jpg'),
    (18,'Sita Ramam','A love story built around letters','Romance','Telugu',163,8.6,'2022-08-05','https://upload.wikimedia.org/wikipedia/en/1/1d/Sita_Ramam.jpg'),
    (19,'Hi Nanna','A father and daughter face an emotional journey','Drama','Telugu',155,8.0,'2023-12-07','https://upload.wikimedia.org/wikipedia/en/d/d7/Hi_Nanna_poster.jpg'),
    (20,'Premalu','A young romance develops in a new city','Romance','Malayalam',156,7.9,'2024-02-09','https://upload.wikimedia.org/wikipedia/en/c/c5/Premalu_film_poster.jpg'),
    (21,'Manjummel Boys','Friends attempt a dangerous rescue','Adventure','Malayalam',135,8.3,'2024-02-22','https://upload.wikimedia.org/wikipedia/en/9/99/Manjummel_Boys_poster.jpg'),
    (22,'Aavesham','Three friends meet an eccentric gangster','Comedy','Malayalam',158,8.0,'2024-04-11','https://example.com/posters/aavesham.jpg'),
    (23,'The Greatest of All Time','A former operative faces a dangerous mission','Action','Tamil',183,6.0,'2024-09-05','https://upload.wikimedia.org/wikipedia/en/1/1e/The_Greatest_of_All_Time.jpg'),
    (24,'Amaran','A soldier story based on courage and sacrifice','War','Tamil',169,8.2,'2024-10-31','https://upload.wikimedia.org/wikipedia/en/5/54/Amaran_2024_poster.jpg'),
    (25,'Maharaja','A barber searches for something stolen from his home','Thriller','Tamil',140,8.4,'2024-06-14','https://upload.wikimedia.org/wikipedia/en/8/82/Maharaja_2024_film_poster.jpg'),
    (26,'Laapataa Ladies','Two brides get separated after marriage','Comedy','Hindi',124,8.5,'2024-03-01','https://upload.wikimedia.org/wikipedia/en/5/52/Laapataa_Ladies_poster.jpg'),
    (27,'Fighter','Air force officers face a national threat','Action','Hindi',166,7.0,'2024-01-25','https://upload.wikimedia.org/wikipedia/en/d/df/Fighter_film_teaser.jpg'),
    (28,'Article 370','An intelligence officer works on a high-stakes mission','Political Thriller','Hindi',158,7.8,'2024-02-23','https://upload.wikimedia.org/wikipedia/en/b/b2/Article_370_film_poster.jpeg'),
    (29,'Maidaan','A football coach builds a strong team','Sports','Hindi',181,8.0,'2024-04-10','https://upload.wikimedia.org/wikipedia/en/3/3d/Maidaan_Poster.jpg'),
    (30,'Crew','Three airline workers get involved in a risky scheme','Comedy','Hindi',118,6.0,'2024-03-29','https://upload.wikimedia.org/wikipedia/en/8/8f/Crew_2024_film_poster.jpeg'),
    (31,'Rockstar','A musician searches for his artistic identity','Musical','Hindi',159,7.7,'2011-11-11','https://upload.wikimedia.org/wikipedia/en/6/68/Rockstar-Movie-Poster.jpg'),
    (32,'Zindagi Na Milegi Dobara','Three friends take a life-changing road trip','Adventure','Hindi',155,8.2,'2011-07-15','https://upload.wikimedia.org/wikipedia/en/1/17/Zindagi_Na_Milegi_Dobara.jpg'),
    (33,'3 Idiots','Three engineering students challenge conventional thinking','Comedy','Hindi',170,8.4,'2009-12-25','https://upload.wikimedia.org/wikipedia/en/d/df/3_idiots_poster.jpg'),
    (34,'Dangal','A father trains his daughters to become wrestlers','Sports','Hindi',161,8.3,'2016-12-23','https://upload.wikimedia.org/wikipedia/en/9/99/Dangal_Poster.jpg'),
    (35,'Andhadhun','A pianist becomes involved in a mysterious crime','Thriller','Hindi',139,8.2,'2018-10-05','https://upload.wikimedia.org/wikipedia/en/4/47/Andhadhun_poster.jpg'),
    (36,'Badhaai Ho','A family deals with an unexpected pregnancy','Comedy','Hindi',124,7.9,'2018-10-18','https://upload.wikimedia.org/wikipedia/en/f/f5/Badhaai_Ho_Official_Poster.jpg'),
    (37,'Tumbbad','A man searches for a hidden treasure','Horror','Hindi',104,8.2,'2018-10-12','https://upload.wikimedia.org/wikipedia/en/4/41/Tumbbad_poster.jpg'),
    (38,'Kahaani','A pregnant woman searches for her missing husband','Mystery','Hindi',122,8.1,'2012-03-09','https://upload.wikimedia.org/wikipedia/en/f/f2/Kahaani_poster.jpg'),
    (39,'Queen','A woman travels alone after her wedding is cancelled','Comedy','Hindi',146,8.2,'2014-03-07','https://upload.wikimedia.org/wikipedia/en/4/45/QueenMoviePoster7thMarch.jpg'),
    (40,'Barfi','A man and two women navigate love and friendship','Romance','Hindi',151,8.1,'2012-09-14','https://upload.wikimedia.org/wikipedia/en/2/2e/Barfi%21_poster.jpg'),
    (41,'Piku','A daughter and father take a road trip','Comedy','Hindi',123,7.6,'2015-05-08','https://upload.wikimedia.org/wikipedia/en/9/98/Piku.jpg'),
    (42,'Drishyam','A family tries to protect itself from a crime investigation','Crime','Hindi',163,8.2,'2015-07-31','https://upload.wikimedia.org/wikipedia/en/8/8a/Drishyam_2015_film.jpg'),
    (43,'URI The Surgical Strike','A military operation follows a major attack','War','Hindi',138,8.2,'2019-01-11','https://upload.wikimedia.org/wikipedia/en/3/3b/URI_-_New_poster.jpg'),
    (44,'Tanhaji','A warrior fights to capture a strategic fort','Historical','Hindi',135,7.5,'2020-01-10','https://upload.wikimedia.org/wikipedia/en/3/3f/Tanaji_film_poster.jpg'),
    (45,'Soorarai Pottru','An ambitious man tries to make air travel affordable','Drama','Tamil',153,8.6,'2020-11-12','https://upload.wikimedia.org/wikipedia/en/6/61/Soorarai_Pottru.JPG'),
    (46,'Kumbalangi Nights','Four brothers deal with family and relationships','Drama','Malayalam',135,8.5,'2019-02-07','https://upload.wikimedia.org/wikipedia/en/9/98/Kumbalangi_Nights_poster.jpg'),
    (47,'Sairat','Two young people fall in love despite social barriers','Romance','Marathi',174,8.2,'2016-04-29','https://upload.wikimedia.org/wikipedia/en/a/a1/Sairat_Marathi_Film_Poster.jpg'),
    (48,'Karthik Calling Karthik','A mysterious caller changes a mans life','Thriller','Hindi',135,7.0,'2010-02-26','https://upload.wikimedia.org/wikipedia/en/d/db/Karthik_Calling_Karthik.jpg'),
    (49,'Wake Up Sid','A young man discovers his purpose in life','Drama','Hindi',138,7.6,'2009-10-02','https://upload.wikimedia.org/wikipedia/en/9/9f/Wake_up_Sid.jpg');


-- ============================================================
-- 3. THEATERS
-- 48 unique theaters. IDs are explicit.
-- ============================================================
INSERT INTO theaters (id, name, address, city_id) VALUES

                                                      (1,'PVR INOX Mumbai','Mumbai',1),
                                                      (2,'Cinepolis Mumbai','Mumbai',1),
                                                      (3,'PVR INOX Delhi','Delhi',2),
                                                      (4,'Cinepolis Delhi','Delhi',2),
                                                      (5,'PVR INOX Bangalore','Bangalore',3),
                                                      (6,'Cinepolis Bangalore','Bangalore',3),
                                                      (7,'PVR INOX Hyderabad','Hyderabad',4),
                                                      (8,'Cinepolis Hyderabad','Hyderabad',4),
                                                      (9,'PVR INOX Chennai','Chennai',39),
                                                      (10,'AGS Cinemas Chennai','Chennai',39),
                                                      (11,'INOX South City Kolkata','Kolkata',40),
                                                      (12,'PVR INOX Kolkata','Kolkata',40),
                                                      (13,'PVR INOX Pune','Pune',41),
                                                      (14,'Cinepolis Pune','Pune',41),
                                                      (15,'PVR INOX Ahmedabad','Ahmedabad',42),
                                                      (16,'Cinepolis Ahmedabad','Ahmedabad',42),
                                                      (17,'Raj Mandir Cinema','Jaipur',43),
                                                      (18,'PVR INOX Jaipur','Jaipur',43),
                                                      (19,'PVR INOX Lucknow','Lucknow',44),
                                                      (20,'Cinepolis Lucknow','Lucknow',44),
                                                      (21,'PVR INOX Bhopal','Bhopal',45),
                                                      (22,'Cinepolis Bhopal','Bhopal',45),
                                                      (23,'PVR INOX Indore','Indore',46),
                                                      (24,'Cinepolis Indore','Indore',46),
                                                      (25,'PVR INOX Nagpur','Nagpur',47),
                                                      (26,'Cinepolis Nagpur','Nagpur',47),
                                                      (27,'PVR INOX Surat','Surat',48),
                                                      (28,'Cinepolis Surat','Surat',48),
                                                      (29,'PVR INOX Kanpur','Kanpur',49),
                                                      (30,'PVR INOX Patna','Patna',50),
                                                      (31,'PVR INOX Chandigarh','Chandigarh',51),
                                                      (32,'INOX Visakhapatnam','Visakhapatnam',52),
                                                      (33,'PVR INOX Coimbatore','Coimbatore',53),
                                                      (34,'PVR INOX Kochi','Kochi',54),
                                                      (35,'PVR INOX Trivandrum','Thiruvananthapuram',55),
                                                      (36,'PVR INOX Guwahati','Guwahati',56),
                                                      (37,'PVR INOX Bhubaneswar','Bhubaneswar',57),
                                                      (38,'PVR INOX Ranchi','Ranchi',58),
                                                      (39,'PVR INOX Raipur','Raipur',59),
                                                      (40,'PVR INOX Dehradun','Dehradun',60),
                                                      (41,'PVR INOX Amritsar','Amritsar',61),
                                                      (42,'PVR INOX Ludhiana','Ludhiana',62),
                                                      (43,'PVR INOX Varanasi','Varanasi',63),
                                                      (44,'PVR INOX Agra','Agra',64),
                                                      (45,'PVR INOX Vadodara','Vadodara',65),
                                                      (46,'PVR INOX Nashik','Nashik',66),
                                                      (47,'PVR INOX Mysuru','Mysuru',67),
                                                      (48,'PVR INOX Vijayawada','Vijayawada',68);


-- ============================================================
-- 4. SCREENS
-- 2 screens per theater = 96 screens.
-- Screen 1 = 150 seats; Screen 2 = 200 seats.
-- ============================================================
INSERT INTO screens (id, name, total_seats, theater_id) VALUES

                                                            (1,'Screen 1',150,1),
                                                            (2,'Screen 2',200,1),
                                                            (3,'Screen 1',150,2),
                                                            (4,'Screen 2',200,2),
                                                            (5,'Screen 1',150,3),
                                                            (6,'Screen 2',200,3),
                                                            (7,'Screen 1',150,4),
                                                            (8,'Screen 2',200,4),
                                                            (9,'Screen 1',150,5),
                                                            (10,'Screen 2',200,5),
                                                            (11,'Screen 1',150,6),
                                                            (12,'Screen 2',200,6),
                                                            (13,'Screen 1',150,7),
                                                            (14,'Screen 2',200,7),
                                                            (15,'Screen 1',150,8),
                                                            (16,'Screen 2',200,8),
                                                            (17,'Screen 1',150,9),
                                                            (18,'Screen 2',200,9),
                                                            (19,'Screen 1',150,10),
                                                            (20,'Screen 2',200,10),
                                                            (21,'Screen 1',150,11),
                                                            (22,'Screen 2',200,11),
                                                            (23,'Screen 1',150,12),
                                                            (24,'Screen 2',200,12),
                                                            (25,'Screen 1',150,13),
                                                            (26,'Screen 2',200,13),
                                                            (27,'Screen 1',150,14),
                                                            (28,'Screen 2',200,14),
                                                            (29,'Screen 1',150,15),
                                                            (30,'Screen 2',200,15),
                                                            (31,'Screen 1',150,16),
                                                            (32,'Screen 2',200,16),
                                                            (33,'Screen 1',150,17),
                                                            (34,'Screen 2',200,17),
                                                            (35,'Screen 1',150,18),
                                                            (36,'Screen 2',200,18),
                                                            (37,'Screen 1',150,19),
                                                            (38,'Screen 2',200,19),
                                                            (39,'Screen 1',150,20),
                                                            (40,'Screen 2',200,20),
                                                            (41,'Screen 1',150,21),
                                                            (42,'Screen 2',200,21),
                                                            (43,'Screen 1',150,22),
                                                            (44,'Screen 2',200,22),
                                                            (45,'Screen 1',150,23),
                                                            (46,'Screen 2',200,23),
                                                            (47,'Screen 1',150,24),
                                                            (48,'Screen 2',200,24),
                                                            (49,'Screen 1',150,25),
                                                            (50,'Screen 2',200,25),
                                                            (51,'Screen 1',150,26),
                                                            (52,'Screen 2',200,26),
                                                            (53,'Screen 1',150,27),
                                                            (54,'Screen 2',200,27),
                                                            (55,'Screen 1',150,28),
                                                            (56,'Screen 2',200,28),
                                                            (57,'Screen 1',150,29),
                                                            (58,'Screen 2',200,29),
                                                            (59,'Screen 1',150,30),
                                                            (60,'Screen 2',200,30),
                                                            (61,'Screen 1',150,31),
                                                            (62,'Screen 2',200,31),
                                                            (63,'Screen 1',150,32),
                                                            (64,'Screen 2',200,32),
                                                            (65,'Screen 1',150,33),
                                                            (66,'Screen 2',200,33),
                                                            (67,'Screen 1',150,34),
                                                            (68,'Screen 2',200,34),
                                                            (69,'Screen 1',150,35),
                                                            (70,'Screen 2',200,35),
                                                            (71,'Screen 1',150,36),
                                                            (72,'Screen 2',200,36),
                                                            (73,'Screen 1',150,37),
                                                            (74,'Screen 2',200,37),
                                                            (75,'Screen 1',150,38),
                                                            (76,'Screen 2',200,38),
                                                            (77,'Screen 1',150,39),
                                                            (78,'Screen 2',200,39),
                                                            (79,'Screen 1',150,40),
                                                            (80,'Screen 2',200,40),
                                                            (81,'Screen 1',150,41),
                                                            (82,'Screen 2',200,41),
                                                            (83,'Screen 1',150,42),
                                                            (84,'Screen 2',200,42),
                                                            (85,'Screen 1',150,43),
                                                            (86,'Screen 2',200,43),
                                                            (87,'Screen 1',150,44),
                                                            (88,'Screen 2',200,44),
                                                            (89,'Screen 1',150,45),
                                                            (90,'Screen 2',200,45),
                                                            (91,'Screen 1',150,46),
                                                            (92,'Screen 2',200,46),
                                                            (93,'Screen 1',150,47),
                                                            (94,'Screen 2',200,47),
                                                            (95,'Screen 1',150,48),
                                                            (96,'Screen 2',200,48);


-- ============================================================
-- 5. SEATS
-- 96 screens = 16,800 seats.
-- Odd screen IDs: 150 seats (A-O).
-- Even screen IDs: 200 seats (A-T).
-- 70% REGULAR, 20% PREMIUM, 10% VIP.
-- ============================================================
INSERT INTO seats
(seat_number, seat_row, seat_col, seat_type, screen_id)
WITH RECURSIVE seat_numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM seat_numbers
    WHERE n < 200
)
SELECT
    CONCAT(
        CHAR(65 + FLOOR((sn.n - 1) / 10)),
            MOD(sn.n - 1, 10) + 1
    ) AS seat_number,
    CHAR(65 + FLOOR((sn.n - 1) / 10)) AS seat_row,
    MOD(sn.n - 1, 10) + 1 AS seat_col,
    CASE
    WHEN sn.n <= ROUND(s.total_seats * 0.70) THEN 'REGULAR'
    WHEN sn.n <= ROUND(s.total_seats * 0.90) THEN 'PREMIUM'
    ELSE 'VIP'
END AS seat_type,
    s.id AS screen_id
FROM screens s
JOIN seat_numbers sn ON sn.n <= s.total_seats;

-- ============================================================
-- 6. SHOWS
-- 96 screens x 7 days x 4 shows/day = 2,688 shows.
-- Dates are generated from CURDATE() so the fresh Render DB
-- always gets shows for the next 7 days.
-- ============================================================
INSERT INTO shows
(end_time, show_date, start_time, ticket_price, movie_id, screen_id)
WITH RECURSIVE
    days AS (
        SELECT 0 AS d
        UNION ALL
        SELECT d + 1
        FROM days
        WHERE d < 6
    ),
    slots AS (
        SELECT 1 AS slot_no, '10:00:00' AS start_t, '12:30:00' AS end_t
        UNION ALL SELECT 2, '13:30:00', '16:00:00'
        UNION ALL SELECT 3, '17:00:00', '19:30:00'
        UNION ALL SELECT 4, '20:30:00', '23:00:00'
    )
SELECT
    sl.end_t,
    DATE_ADD(CURDATE(), INTERVAL d.d DAY),
    sl.start_t,
    CASE WHEN MOD(s.id,2)=1 THEN 180 ELSE 220 END,
    MOD((s.id - 1) * 4 + sl.slot_no + d.d - 1, 49) + 1,
    s.id
FROM screens s
         CROSS JOIN days d
         CROSS JOIN slots sl;

-- ============================================================
-- 7. RUNTIME TABLES
-- users: EMPTY - registration creates users.
-- bookings: EMPTY - booking flow creates bookings.
-- booking_seats: EMPTY - booking flow creates booking-seat rows.
-- ============================================================

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 8. VERIFICATION
-- Expected:
-- cities = 34 rows in this seed (IDs 1-4 and 39-68)
-- movies = 49
-- theaters = 48
-- screens = 96
-- seats = 16800
-- shows = 2688
-- users/bookings/booking_seats = 0 inserted by this file
-- ============================================================

SELECT COUNT(*) AS total_cities FROM cities;
SELECT COUNT(*) AS total_movies FROM movies;
SELECT COUNT(*) AS total_theaters FROM theaters;
SELECT COUNT(*) AS total_screens FROM screens;
SELECT COUNT(*) AS total_seats FROM seats;
SELECT COUNT(*) AS total_shows FROM shows;
SELECT COUNT(*) AS total_users FROM users;
SELECT COUNT(*) AS total_bookings FROM bookings;
SELECT COUNT(*) AS total_booking_seats FROM booking_seats;
