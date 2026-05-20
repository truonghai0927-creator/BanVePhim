USE movie_ticket_booking;

-- ======================================================================================
-- BƯỚC 1: LÀM SẠCH DỮ LIỆU CŨ (Để tránh trùng lặp hoặc lỗi khóa ngoại)
-- ======================================================================================
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE showtimeseats;
TRUNCATE TABLE tickets;
TRUNCATE TABLE cinema_movies;
TRUNCATE TABLE showtimes;
TRUNCATE TABLE rooms;
TRUNCATE TABLE movies;
TRUNCATE TABLE cinemas;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- ======================================================================================
-- BƯỚC 2: THÊM DỮ LIỆU USERS
-- ======================================================================================
INSERT INTO users (username, password, email, phonenumber, role) VALUES ('admin', '$2a$10$Q7.u.3.r.t.y.u.i.o.p.1', 'admin@cinestar.com.vn', '0909123456', 'ADMIN');

-- ======================================================================================
-- BƯỚC 3: THÊM DỮ LIỆU CINEMAS
-- ======================================================================================
INSERT INTO cinemas (cinema_name, cinema_address) VALUES 
('Cinestar Quốc Thanh', '271 Nguyễn Trãi, Phường Nguyễn Cư Trinh, Quận 1, TP.HCM'),
('Cinestar Hai Bà Trưng', '135 Hai Bà Trưng, Phường Bến Nghé, Quận 1, TP.HCM'),
('Cinestar Sinh Viên', 'Nhà Văn hóa Sinh viên ĐHQG TP.HCM, Dĩ An, Bình Dương'),
('Cinestar Mỹ Tho', '52 Đinh Bộ Lĩnh, Phường 3, TP. Mỹ Tho, Tiền Giang'),
('Cinestar Đà Lạt', 'Quảng trường Lâm Viên, Phường 10, TP. Đà Lạt, Lâm Đồng'),
('Cinestar Huế', '25 Hai Bà Trưng, Phường Vĩnh Ninh, TP. Huế'),
('Cinestar Kiên Giang', 'TTTM Rạch Sỏi, Nguyễn Chí Thanh, TP. Rạch Giá, Kiên Giang'),
('Cinestar ParkCity Hà Nội', 'TTTM The LINC, KĐT ParkCity, Lê Trọng Tấn, Hà Đông, Hà Nội');

-- ======================================================================================
-- BƯỚC 4: THÊM DỮ LIỆU ROOMS
-- ======================================================================================
INSERT INTO rooms (room_name, number_of_columns, number_of_rows, cinema_id) VALUES 
('Screen 01', 15, 12, 1), ('Screen 02', 12, 10, 1), ('Screen 03', 10, 8, 1),
('Screen 01', 14, 12, 2), ('Screen 02', 12, 10, 2),
('Screen 01', 18, 14, 3), ('Screen 02', 18, 14, 3),
('Screen 01', 12, 10, 4), ('Screen 02', 10, 8, 4),
('Screen 01', 12, 10, 5), ('Screen 02', 10, 8, 5),
('Screen 01', 14, 12, 6),
('Screen 01', 12, 10, 7),
('Screen 01', 15, 12, 8), ('Screen 02', 12, 10, 8);

-- ======================================================================================
-- BƯỚC 5: THÊM DỮ LIỆU PHIM
-- ======================================================================================
INSERT INTO movies (movie_name, movie_type, director_name, names_of_actors, movie_description, movie_duration, movie_country, movie_image_url, movie_status) VALUES 
('Avatar 3: Fire and Ash', 'Khoa Học Viễn Tưởng/Hành Động', 'James Cameron', 'Sam Worthington, Zoe Saldana', 'Jake Sully và Neytiri đối mặt với tộc người Ash People - những Na''vi sử dụng lửa tại Pandora. Cuộc chiến khốc liệt nhất bắt đầu.', 190, 'Mỹ', 'https://cinestar.com.vn/_next/image/?url=https%3A%2F%2Fapi-website.cinestar.com.vn%2Fmedia%2Fwysiwyg%2FPosters%2F12-2025%2Favatar-3-poster.jpg&w=1920&q=75', 'NOW_SHOWING'),
('Zootopia 2', 'Hoạt Hình/Hài', 'Byron Howard', 'Ginnifer Goodwin, Jason Bateman', 'Judy Hopps và Nick Wilde trở lại với một vụ án bí ẩn mới đe dọa sự bình yên của thành phố Zootopia.', 105, 'Mỹ', 'https://cinestar.com.vn/_next/image/?url=https%3A%2F%2Fapi-website.cinestar.com.vn%2Fmedia%2Fwysiwyg%2FPosters%2F11-2025%2Fzootopia-2_1.jpg&w=1080&q=75', 'NOW_SHOWING'),
('Hoàng Tử Quỷ', 'Kinh Dị/Cổ Trang', 'Trần Hữu Tấn', 'Anh Tú Atus, Rima Thanh Vy', 'Một bộ phim kinh dị cổ trang Việt Nam lấy bối cảnh thời Lê Trung Hưng, nơi những bí mật đen tối của hoàng tộc dần được hé lộ.', 117, 'Việt Nam', 'https://cinestar.com.vn/_next/image/?url=https%3A%2F%2Fapi-website.cinestar.com.vn%2Fmedia%2Fwysiwyg%2FPosters%2F12-2025%2Fhoang-tu-quy-main.png&w=1080&q=75', 'NOW_SHOWING'),
('Vua các vua', 'Hoạt hình', 'Seong-ho Jang', 'Mark Hamill, Pierce Brosnan, Roman Griffin Davis', 'Vua của Các Vua - Phim hoạt hình về cuộc đời Chúa Giê-su đầu tiên.', 130, 'Hàn Quốc', 'https://cinestar.com.vn/_next/image/?url=https%3A%2F%2Fapi-website.cinestar.com.vn%2Fmedia%2Fwysiwyg%2FPosters%2F12-2025%2Fvua-cua-cac-vua.png&w=1080&q=75', 'NOW_SHOWING'),
('Spongebob: Lời nguyền hải tặc', 'Hoạt Hình', 'Derek Drymon', 'Tom Kenny, Bill Fagerbakke', 'SpongeBob phiêu lưu xuống đáy đại dương để đối mặt với hồn ma của Người Hà Lan bay, vượt qua thử thách và khám phá những bí ẩn dưới biển.', 130, 'Hàn Quốc', 'https://cinestar.com.vn/_next/image/?url=https%3A%2F%2Fapi-website.cinestar.com.vn%2Fmedia%2Fwysiwyg%2FPosters%2F12-2025%2Fspongebob-poster.png&w=1080&q=75', 'NOW_SHOWING'),
('Chợ đen thời tận thế', 'Hồi hộp/Hành Động', 'HONG KI-WON', 'LEE JAE-IN, HONG KYUNG', 'Sau đại địa chấn xóa sổ thế giới, hy vọng mong manh len lỏi giữa toà chung cư cuối cùng biến thành "chợ đen" - Nơi mạng đổi mạng và niềm tin là món đồ xa xỉ.', 130, 'Hàn Quốc', 'https://cinestar.com.vn/_next/image/?url=https%3A%2F%2Fapi-website.cinestar.com.vn%2Fmedia%2Fwysiwyg%2FPosters%2F12-2025%2Fcho-den-thoi-tan-the-poster.jpg&w=1080&q=75', 'NOW_SHOWING');

-- ======================================================================================
-- BƯỚC 6: PHÂN BỐ PHIM VÀO RẠP (CHO TẤT CẢ PHIM ĐANG CHIẾU)
-- ======================================================================================
INSERT INTO cinema_movies (cinema_id, movie_id)
SELECT c.cinema_id, m.movie_id 
FROM cinemas c CROSS JOIN movies m 
WHERE m.movie_status = 'NOW_SHOWING';

-- ======================================================================================
-- BƯỚC 7: TẠO LỊCH CHIẾU CHO TẤT CẢ PHIM (7 NGÀY)
-- ======================================================================================

-- AVATAR 3 (ID 1)
-- Rạp 1 - Quốc Thanh, Phòng Screen 01 (15x12)
-- Giá 105,000đ | Phim 190 phút | Suất chiếu lúc 14:00 và 18:00
INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES
(105000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 14:00:00'), 1, 1, 1),
(105000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 18:00:00'), 1, 1, 1),
(105000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 14:00:00'), 1, 1, 1),
(105000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 18:00:00'), 1, 1, 1),
(105000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 2 DAY), ' 14:00:00'), 1, 1, 1),
(105000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 2 DAY), ' 18:00:00'), 1, 1, 1),
(105000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 3 DAY), ' 14:00:00'), 1, 1, 1),
(105000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 3 DAY), ' 18:00:00'), 1, 1, 1);

-- ZOOTOPIA 2 (ID 2)
-- Rạp 3 - Sinh Viên, Phòng Screen 01 (18x14)
-- Giá 45,000đ | Phim 105 phút | Suất chiếu 9h, 11h, 14h, 17h mỗi ngày
INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 09:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 11:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 14:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 17:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 09:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 11:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 14:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 17:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 2 DAY), ' 09:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 2 DAY), ' 11:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 2 DAY), ' 14:00:00'), 2, 3, 6),
(45000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 2 DAY), ' 17:00:00'), 2, 3, 6);

-- HOÀNG TỬ QUỶ (ID 3)
-- Rạp 1 - Quốc Thanh, Phòng Screen 02 (12x10)
-- Giá 85,000đ | Phim 117 phút | Suất chiếu khuya 21:00 mỗi ngày
INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES
(85000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 21:00:00'), 3, 1, 2),
(85000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 21:00:00'), 3, 1, 2),
(85000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 2 DAY), ' 21:00:00'), 3, 1, 2),
(85000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 3 DAY), ' 21:00:00'), 3, 1, 2),
(85000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 4 DAY), ' 21:00:00'), 3, 1, 2),
(85000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 5 DAY), ' 21:00:00'), 3, 1, 2),
(85000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 6 DAY), ' 21:00:00'), 3, 1, 2);

-- VUA CÁC VUA (ID 4)
-- Rạp 2 - Hai Bà Trưng, Phòng Screen 01 (14x12)
-- Giá 80,000đ | Phim 130 phút | Suất chiếu 10h, 14h, 18h mỗi ngày
INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES
(80000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 10:00:00'), 4, 2, 4),
(80000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 14:00:00'), 4, 2, 4),
(80000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 18:00:00'), 4, 2, 4),
(80000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 10:00:00'), 4, 2, 4),
(80000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 14:00:00'), 4, 2, 4),
(80000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 18:00:00'), 4, 2, 4);

-- SPONGEBOB (ID 5)
-- Rạp 3 - Sinh Viên, Phòng Screen 02 (18x14)
-- Giá 60,000đ | Phim 130 phút | Suất chiếu 8h, 13h, 16h mỗi ngày
INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES
(60000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 08:00:00'), 5, 3, 7),
(60000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 13:00:00'), 5, 3, 7),
(60000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 16:00:00'), 5, 3, 7),
(60000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 08:00:00'), 5, 3, 7),
(60000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 13:00:00'), 5, 3, 7),
(60000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 16:00:00'), 5, 3, 7);

-- CHỢ ĐEN THỜI TẬN THẾ (ID 6)
-- Rạp 2 - Hai Bà Trưng, Phòng Screen 02 (12x10)
-- Giá 70,000đ | Phim 130 phút | Suất chiếu 11h, 15h, 19h mỗi ngày
INSERT INTO showtimes (showtime_price, start_time, movie_id, cinema_id, room_id) VALUES
(70000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 11:00:00'), 6, 2, 5),
(70000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 15:00:00'), 6, 2, 5),
(70000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 0 DAY), ' 19:00:00'), 6, 2, 5),
(70000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 11:00:00'), 6, 2, 5),
(70000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 15:00:00'), 6, 2, 5),
(70000, CONCAT(DATE_ADD(CURDATE(), INTERVAL 1 DAY), ' 19:00:00'), 6, 2, 5);
