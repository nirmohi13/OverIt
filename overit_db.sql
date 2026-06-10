-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2026 at 04:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `overit_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(150) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `created_at`) VALUES
(1, 'System Admin', 'admin@overit.com', 'admin123', '2026-05-12 15:22:34'),
(2, 'admin1', 'admin1@gmail.com', 'Admin123@', '2026-05-12 18:45:58'),
(3, 'Sanjana', 'sanjana23@overit.com', 'Sanjana234@', '2026-05-13 05:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `analytics_report`
--

CREATE TABLE `analytics_report` (
  `report_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `report_title` varchar(200) DEFAULT NULL,
  `report_description` text DEFAULT NULL,
  `avg_burnout` double DEFAULT NULL,
  `severe_cases` int(11) DEFAULT NULL,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `analytics_report`
--

INSERT INTO `analytics_report` (`report_id`, `admin_id`, `report_title`, `report_description`, `avg_burnout`, `severe_cases`, `generated_at`) VALUES
(1, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-12 16:53:38'),
(2, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-12 16:54:05'),
(3, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-12 16:57:10'),
(4, 1, 'Stress Risk Analysis', 'Shows students affected by high stress.', 72.5, 5, '2026-05-12 16:57:27'),
(5, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-12 16:57:42'),
(6, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-12 16:57:52'),
(7, 1, 'Sleep Deficiency Report', 'Shows students affected by poor sleep.', 72.5, 5, '2026-05-12 16:58:00'),
(8, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-12 16:59:29'),
(9, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-12 17:40:17'),
(10, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-12 18:46:47'),
(11, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-13 05:34:27'),
(12, 1, 'Stress Risk Analysis', 'Shows students affected by high stress.', 72.5, 5, '2026-05-13 05:59:00'),
(13, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-13 08:58:30'),
(14, 1, 'Stress Risk Analysis', 'Shows students affected by high stress.', 72.5, 5, '2026-05-13 09:00:38'),
(15, 1, 'Sleep Deficiency Report', 'Shows students affected by poor sleep.', 72.5, 5, '2026-05-13 09:01:15'),
(16, 1, 'High Burnout Students Report', 'Shows students with severe burnout risk.', 72.5, 5, '2026-05-14 05:51:34'),
(17, 1, 'Sleep Deficiency Report', 'Shows students affected by poor sleep.', 72.5, 5, '2026-05-14 05:51:54');

-- --------------------------------------------------------

--
-- Table structure for table `burnout_score`
--

CREATE TABLE `burnout_score` (
  `analysis_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `burnout_score` double DEFAULT NULL,
  `risk_category` varchar(50) DEFAULT NULL,
  `health_index` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `submission_id` int(11) DEFAULT NULL,
  `recommendation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `burnout_score`
--

INSERT INTO `burnout_score` (`analysis_id`, `student_id`, `burnout_score`, `risk_category`, `health_index`, `created_at`, `submission_id`, `recommendation_id`) VALUES
(1, 1, 60.50000000000001, 'Moderate Burnout', 39.49999999999999, '2026-05-12 10:14:50', 1, 2),
(2, 1, 71.5, 'Moderate Burnout', 28.5, '2026-05-12 10:54:45', 1, 2),
(3, 1, 71.5, 'Moderate Burnout', 28.5, '2026-05-12 10:56:26', 1, 2),
(4, 1, 70.00000000000001, 'Moderate Burnout', 29.999999999999986, '2026-05-12 10:57:32', 1, 2),
(5, 1, 39.5, 'Low Burnout', 60.5, '2026-05-12 11:02:26', 1, 3),
(6, 1, 82, 'Severe Burnout', 18, '2026-03-31 18:30:00', 1, 1),
(7, 2, 74, 'Moderate Burnout', 26, '2026-04-01 18:30:00', 8, 2),
(8, 3, 55, 'Moderate Burnout', 45, '2026-04-07 18:30:00', 9, 2),
(9, 4, 91, 'Severe Burnout', 9, '2026-04-09 18:30:00', 10, 1),
(10, 5, 32, 'Low Burnout', 68, '2026-04-14 18:30:00', 11, 3),
(11, 6, 79, 'Severe Burnout', 21, '2026-04-17 18:30:00', 12, 1),
(12, 7, 69, 'Moderate Burnout', 31, '2026-04-19 18:30:00', 13, 2),
(13, 8, 40, 'Low Burnout', 60, '2026-04-24 18:30:00', 14, 3),
(14, 10, 43, 'Low Burnout', 57, '2026-05-12 16:14:07', NULL, 3),
(15, 10, 43.00000000000001, 'Low Burnout', 56.99999999999999, '2026-05-12 18:07:29', NULL, 3),
(16, 10, 41, 'Low Burnout', 59, '2026-05-12 18:49:05', NULL, 3),
(17, 10, 49.5, 'Low Burnout', 50.5, '2026-05-13 05:33:08', NULL, 3),
(18, 15, 62.000000000000014, 'Moderate Burnout', 37.999999999999986, '2026-05-13 07:00:04', NULL, 2),
(19, 15, 62.000000000000014, 'Moderate Burnout', 37.999999999999986, '2026-05-13 07:11:50', NULL, 2),
(20, 15, 48.00000000000001, 'Low Burnout', 51.99999999999999, '2026-05-13 07:12:45', NULL, 3),
(21, 15, 49.5, 'Low Burnout', 50.5, '2026-05-13 07:16:25', 22, 3),
(22, 15, 81, 'Severe Burnout', 19, '2026-05-13 07:29:24', 23, 1),
(23, 1, 50, 'Moderate Burnout', 50, '2026-05-13 07:31:48', 24, 2),
(24, 15, 83.5, 'Severe Burnout', 16.5, '2026-05-13 07:36:43', 25, 1),
(25, 10, 59.000000000000014, 'Moderate Burnout', 40.999999999999986, '2026-05-13 08:50:28', 26, 2),
(26, 10, 78, 'Severe Burnout', 22, '2026-05-13 08:52:02', 27, 1),
(27, 10, 62.999999999999986, 'Moderate Burnout', 37.000000000000014, '2026-05-14 04:51:54', 28, 2),
(28, 10, 70.00000000000001, 'Moderate Burnout', 29.999999999999986, '2026-05-14 05:48:44', 29, 2);

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `recommendation_id` int(11) NOT NULL,
  `recommendation_title` varchar(150) DEFAULT NULL,
  `recommendation_text` text NOT NULL,
  `recommendation_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recommendation`
--

INSERT INTO `recommendation` (`recommendation_id`, `recommendation_title`, `recommendation_text`, `recommendation_type`, `created_at`) VALUES
(1, 'Critical Burnout Recovery', 'Immediate stress management, counseling, and wellness monitoring recommended.', 'Severe Burnout', '2026-05-12 15:23:11'),
(2, 'Moderate Burnout Recovery', 'Maintain balanced study routines and improve sleep consistency.', 'Moderate Burnout', '2026-05-12 15:23:11'),
(3, 'Positive Wellness Maintenance', 'Continue maintaining healthy productivity and wellness habits.', 'Low Burnout', '2026-05-12 15:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `risk_alert`
--

CREATE TABLE `risk_alert` (
  `alert_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `analysis_id` int(11) DEFAULT NULL,
  `recommendation_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `risk_level` varchar(100) DEFAULT NULL,
  `alert_message` text DEFAULT NULL,
  `alert_status` varchar(50) DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `risk_alert`
--

INSERT INTO `risk_alert` (`alert_id`, `admin_id`, `analysis_id`, `recommendation_id`, `report_id`, `student_id`, `risk_level`, `alert_message`, `alert_status`, `created_at`) VALUES
(1, 1, 1, 1, 1, 1, 'HIGH', 'Student showing severe academic stress and irregular sleep cycle.', 'Pending', '2026-05-13 09:07:31'),
(2, 1, 2, 2, 1, 2, 'CRITICAL', 'Immediate wellness intervention recommended due to extreme burnout indicators.', 'Reviewed', '2026-05-13 09:07:31'),
(3, 1, 3, 3, 2, 3, 'MEDIUM', 'Student displaying moderate emotional exhaustion and assignment overload.', 'Pending', '2026-05-13 09:07:31'),
(7, 1, 101, 201, 301, 401, 'LOW', 'Minor stress indicators detected. Recommend light workload adjustment.', 'Resolved', '2026-05-13 09:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `email`, `password`, `department`, `created_at`, `admin_id`) VALUES
(1, 'testStudent', 'test@gmail.com', 'test123@', 'MCA', '2026-05-12 10:01:10', 1),
(2, 'Rahul Sharma', 'rahul@gmail.com', '123', 'MCA', '2026-05-12 11:26:45', 1),
(3, 'Priya Mehta', 'priya@gmail.com', '123', 'MCA', '2026-05-12 11:26:45', 1),
(4, 'Arjun Patil', 'arjun@gmail.com', '123', 'MCA', '2026-05-12 11:26:45', 1),
(5, 'Sneha Joshi', 'sneha@gmail.com', '123', 'MCA', '2026-05-12 11:26:45', 1),
(6, 'Karan Verma', 'karan@gmail.com', '123', 'MCA', '2026-05-12 11:26:45', 1),
(7, 'Neha Kulkarni', 'neha@gmail.com', '123', 'MCA', '2026-05-12 11:26:45', 1),
(8, 'Amit Desai', 'amit@gmail.com', '123', 'MCA', '2026-05-12 11:26:45', 1),
(9, 'Pooja Nair', 'pooja@gmail.com', '123', 'MCA', '2026-05-12 11:26:45', 1),
(10, 'moh', 'moh13@gmail.com', 'Nirmohi13@', 'MCA', '2026-05-12 15:56:02', 1),
(11, 'Sanjana', 'sanjana23@overit.com', 'Sanjana23@', 'MCA', '2026-05-12 16:16:36', 1),
(12, 'Sakshi', 'sakshijawade@overit.com', 'Sakshi13@', 'MCA', '2026-05-12 18:01:41', 1),
(13, 'blah', 'blah1@gmail.com', 'Blah123@', 'MCA', '2026-05-12 18:13:42', 1),
(14, 'Divya Bhosale', 'divya29@gmail.com', 'Divya23@', 'MCA', '2026-05-13 05:31:54', 1),
(15, 'Sheefa', 'sheefa123@gmail.com', 'Sheefa123@', 'MCA', '2026-05-13 06:47:02', 1),
(16, 'Nirmohi', 'nirmohi13@gmail.com', 'Nirmohi13@', 'MCA', '2026-05-13 08:36:17', 1),
(17, 'vaishnavi', 'vaishanavi@gmail.com', 'Vaishnavi13@', 'MCA', '2026-05-14 05:46:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `survey_submission`
--

CREATE TABLE `survey_submission` (
  `response_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `sleep_hours` int(11) DEFAULT NULL,
  `sleep_quality` int(11) DEFAULT NULL,
  `stress_level` int(11) DEFAULT NULL,
  `academic_pressure` int(11) DEFAULT NULL,
  `study_hours` int(11) DEFAULT NULL,
  `assignment_load` int(11) DEFAULT NULL,
  `deadline_proximity` int(11) DEFAULT NULL,
  `physical_activity` int(11) DEFAULT NULL,
  `social_interaction` int(11) DEFAULT NULL,
  `break_freq` int(11) DEFAULT NULL,
  `mood_lvl` int(11) DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `survey_submission`
--

INSERT INTO `survey_submission` (`response_id`, `student_id`, `sleep_hours`, `sleep_quality`, `stress_level`, `academic_pressure`, `study_hours`, `assignment_load`, `deadline_proximity`, `physical_activity`, `social_interaction`, `break_freq`, `mood_lvl`, `submitted_at`) VALUES
(1, 1, 8, 8, 8, 10, 0, 1, 9, 1, 7, 8, 5, '2026-05-12 10:09:26'),
(2, 1, 8, 8, 9, 9, 0, 1, 9, 1, 6, 8, 3, '2026-05-12 10:14:50'),
(3, 1, 0, 4, 9, 8, 5, 5, 6, 3, 5, 1, 1, '2026-05-12 10:54:45'),
(4, 1, 0, 4, 9, 8, 5, 5, 6, 3, 5, 1, 1, '2026-05-12 10:56:26'),
(5, 1, 2, 2, 7, 7, 7, 6, 3, 1, 1, 1, 1, '2026-05-12 10:57:32'),
(6, 1, 4, 9, 8, 2, 3, 2, 1, 1, 3, 4, 4, '2026-05-12 11:02:26'),
(7, 1, 5, 4, 8, 9, 7, 8, 9, 3, 4, 3, 4, '2026-03-31 18:30:00'),
(8, 2, 6, 5, 7, 8, 6, 7, 8, 4, 5, 4, 5, '2026-04-01 18:30:00'),
(9, 3, 7, 6, 5, 6, 5, 5, 5, 6, 7, 6, 7, '2026-04-07 18:30:00'),
(10, 4, 4, 3, 9, 9, 8, 9, 9, 2, 3, 2, 3, '2026-04-09 18:30:00'),
(11, 5, 8, 8, 3, 4, 4, 3, 4, 8, 8, 7, 8, '2026-04-14 18:30:00'),
(12, 6, 5, 4, 8, 8, 7, 8, 8, 3, 4, 3, 4, '2026-04-17 18:30:00'),
(13, 7, 6, 5, 7, 7, 6, 7, 7, 4, 5, 4, 5, '2026-04-19 18:30:00'),
(14, 8, 7, 7, 4, 5, 5, 4, 5, 7, 7, 6, 7, '2026-04-24 18:30:00'),
(15, 10, 1, 2, 3, 3, 4, 4, 5, 7, 9, 7, 1, '2026-05-12 16:14:07'),
(16, 10, 2, 2, 2, 2, 1, 4, 6, 5, 8, 3, 2, '2026-05-12 18:07:29'),
(17, 10, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, '2026-05-12 18:49:05'),
(18, 10, 1, 4, 2, 5, 5, 6, 5, 4, 6, 4, 1, '2026-05-13 05:33:08'),
(19, 15, 7, 8, 9, 7, 5, 6, 4, 2, 8, 1, 1, '2026-05-13 07:00:04'),
(20, 15, 7, 8, 9, 7, 5, 6, 4, 2, 8, 1, 1, '2026-05-13 07:11:50'),
(21, 15, 1, 6, 2, 7, 3, 6, 3, 6, 3, 1, 6, '2026-05-13 07:12:45'),
(22, 15, 1, 2, 3, 4, 5, 6, 7, 7, 8, 9, 1, '2026-05-13 07:16:25'),
(23, 15, 2, 2, 9, 9, 8, 8, 6, 4, 3, 2, 1, '2026-05-13 07:29:24'),
(24, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, '2026-05-13 07:31:48'),
(25, 15, 2, 2, 9, 9, 6, 8, 8, 4, 2, 2, 1, '2026-05-13 07:36:43'),
(26, 10, 3, 2, 2, 4, 5, 7, 8, 2, 2, 2, 1, '2026-05-13 08:50:28'),
(27, 10, 5, 4, 8, 8, 1, 8, 9, 3, 2, 2, 1, '2026-05-13 08:52:02'),
(28, 10, 4, 4, 8, 8, 1, 1, 6, 3, 3, 4, 1, '2026-05-14 04:51:54'),
(29, 10, 2, 3, 8, 8, 7, 3, 7, 2, 2, 3, 1, '2026-05-14 05:48:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`);

--
-- Indexes for table `analytics_report`
--
ALTER TABLE `analytics_report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `burnout_score`
--
ALTER TABLE `burnout_score`
  ADD PRIMARY KEY (`analysis_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fk_burnout_recommendation` (`recommendation_id`),
  ADD KEY `fk_burnout_submission` (`submission_id`);

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`recommendation_id`);

--
-- Indexes for table `risk_alert`
--
ALTER TABLE `risk_alert`
  ADD PRIMARY KEY (`alert_id`),
  ADD UNIQUE KEY `analysis_id` (`analysis_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `survey_submission`
--
ALTER TABLE `survey_submission`
  ADD PRIMARY KEY (`response_id`),
  ADD KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `analytics_report`
--
ALTER TABLE `analytics_report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `burnout_score`
--
ALTER TABLE `burnout_score`
  MODIFY `analysis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `recommendation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `risk_alert`
--
ALTER TABLE `risk_alert`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `survey_submission`
--
ALTER TABLE `survey_submission`
  MODIFY `response_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `analytics_report`
--
ALTER TABLE `analytics_report`
  ADD CONSTRAINT `analytics_report_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `burnout_score`
--
ALTER TABLE `burnout_score`
  ADD CONSTRAINT `burnout_score_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `fk_burnout_recommendation` FOREIGN KEY (`recommendation_id`) REFERENCES `recommendation` (`recommendation_id`),
  ADD CONSTRAINT `fk_burnout_submission` FOREIGN KEY (`submission_id`) REFERENCES `survey_submission` (`response_id`);

--
-- Constraints for table `risk_alert`
--
ALTER TABLE `risk_alert`
  ADD CONSTRAINT `risk_alert_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  ADD CONSTRAINT `risk_alert_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `risk_alert_ibfk_3` FOREIGN KEY (`analysis_id`) REFERENCES `burnout_score` (`analysis_id`),
  ADD CONSTRAINT `risk_alert_ibfk_4` FOREIGN KEY (`recommendation_id`) REFERENCES `recommendation` (`recommendation_id`),
  ADD CONSTRAINT `risk_alert_ibfk_5` FOREIGN KEY (`report_id`) REFERENCES `analytics_report` (`report_id`);

--
-- Constraints for table `survey_submission`
--
ALTER TABLE `survey_submission`
  ADD CONSTRAINT `survey_submission_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
