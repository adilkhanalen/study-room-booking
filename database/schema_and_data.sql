CREATE TABLE users (
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('Team Lead', 'Standard Student'))
);

CREATE TABLE rooms (
    room_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_name VARCHAR(50) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE bookings (
    booking_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    room_id INT NOT NULL REFERENCES rooms(room_id) ON DELETE CASCADE,
    booking_date DATE NOT NULL,
    time_slot VARCHAR(20) NOT NULL,
    status VARCHAR(20) DEFAULT 'CONFIRMED' CHECK (status IN ('CONFIRMED', 'CANCELLED')),
    CONSTRAINT unique_room_slot UNIQUE (room_id, booking_date, time_slot)
);

INSERT INTO users (full_name, email, role) VALUES
('Adilkhan Alen', '260913@astanait.edu.kz', 'Team Lead'),
('Rauan Zhumatay', '261340@astanait.edu.kz', 'Team Lead'),
('tester 1', '260001@astanait.edu.kz', 'Standard Student'),
('tester 2', '260002@astanait.edu.kz', 'Standard Student'),
('tester 3', '260003@astanait.edu.kz', 'Team Lead'),
('tester 4', '260004@astanait.edu.kz', 'Standard Student'),
('tester 5', '260005@astanait.edu.kz', 'Standard Student'),
('tester 6', '260006@astanait.edu.kz', 'Team Lead'),
('tester 7', '260007@astanait.edu.kz', 'Standard Student'),
('tester 8', '260008@astanait.edu.kz', 'Standard Student');

INSERT INTO rooms (room_name) VALUES
('C1.1.139'),
('C1.1.140'),
('C1.1.141'),
('C1.1.142'),
('C1.1.143'),
('C1.1.155'),
('C1.1.156'),
('C1.1.163'),
('C1.1.164'),
('C1.1.165'),
('C1.1.168');

INSERT INTO bookings (user_id, room_id, booking_date, time_slot, status) VALUES
(1, 1, '2026-10-15', '09:00–10:30', 'CONFIRMED'),
(2, 2, '2026-10-15', '10:30–12:00', 'CONFIRMED'),
(5, 3, '2026-10-15', '13:00–14:30', 'CONFIRMED'),
(8, 4, '2026-10-15', '14:30–16:00', 'CONFIRMED'),
(1, 5, '2026-10-16', '09:00–10:30', 'CONFIRMED'),
(2, 6, '2026-10-16', '10:30–12:00', 'CONFIRMED'),
(5, 7, '2026-10-16', '13:00–14:30', 'CONFIRMED'),
(8, 8, '2026-10-16', '14:30–16:00', 'CONFIRMED'),
(1, 9, '2026-10-17', '09:00–10:30', 'CONFIRMED'),
(2, 10, '2026-10-17', '10:30–12:00', 'CONFIRMED');
