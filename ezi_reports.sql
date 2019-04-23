-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 11:48 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ezi_reports`
--

-- --------------------------------------------------------

--
-- Table structure for table `ezi_academic_term`
--

CREATE TABLE `ezi_academic_term` (
  `id` int(11) NOT NULL,
  `school_id` varchar(10) NOT NULL,
  `academic_year_id` varchar(10) NOT NULL,
  `academic_term` enum('1','2','3') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ezi_parents`
--

CREATE TABLE `ezi_parents` (
  `id` int(11) NOT NULL,
  `parent_id` varchar(10) NOT NULL,
  `name` int(11) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `relationship` enum('Father','Mother','Brother','Sister','Uncle','Aunt','Grandfather','Grandmother') NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ezi_schools`
--

CREATE TABLE `ezi_schools` (
  `id` int(11) NOT NULL,
  `school_id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `motto` longtext NOT NULL,
  `address` longtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `is_basic` tinyint(1) NOT NULL,
  `is_secondary` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ezi_school_classes`
--

CREATE TABLE `ezi_school_classes` (
  `id` int(11) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  `class_group` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `teacher_id` varchar(10) DEFAULT NULL,
  `school_id` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ezi_school_grading_system`
--

CREATE TABLE `ezi_school_grading_system` (
  `id` int(11) NOT NULL,
  `min` float NOT NULL,
  `max` float NOT NULL,
  `interpretation` text NOT NULL,
  `school_id` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ezi_school_subjects`
--

CREATE TABLE `ezi_school_subjects` (
  `id` int(11) NOT NULL,
  `subject_id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `school_id` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ezi_students`
--

CREATE TABLE `ezi_students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `status` enum('day','boarding') NOT NULL DEFAULT 'day',
  `school_id` varchar(10) NOT NULL,
  `class_id` varchar(10) DEFAULT NULL,
  `parent_id` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ezi_teachers`
--

CREATE TABLE `ezi_teachers` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(10) NOT NULL,
  `name` int(11) NOT NULL,
  `school_id` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ezi_users`
--

CREATE TABLE `ezi_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('administrator','teacher','parent') NOT NULL,
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `school_academic_year`
--

CREATE TABLE `school_academic_year` (
  `id` int(11) NOT NULL,
  `school_id` varchar(10) NOT NULL,
  `academic_year_id` varchar(10) NOT NULL,
  `academic_year` varchar(9) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ezi_academic_term`
--
ALTER TABLE `ezi_academic_term`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_id` (`school_id`),
  ADD UNIQUE KEY `academic_year_id` (`academic_year_id`);

--
-- Indexes for table `ezi_parents`
--
ALTER TABLE `ezi_parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ezi_schools`
--
ALTER TABLE `ezi_schools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_id` (`school_id`);

--
-- Indexes for table `ezi_school_classes`
--
ALTER TABLE `ezi_school_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_id` (`class_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `ezi_school_grading_system`
--
ALTER TABLE `ezi_school_grading_system`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `ezi_school_subjects`
--
ALTER TABLE `ezi_school_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject_id` (`subject_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `ezi_students`
--
ALTER TABLE `ezi_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD KEY `ezi_students_ibfk_1` (`parent_id`),
  ADD KEY `ezi_students_ibfk_2` (`school_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `ezi_teachers`
--
ALTER TABLE `ezi_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teacher_id` (`teacher_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `ezi_users`
--
ALTER TABLE `ezi_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_academic_year`
--
ALTER TABLE `school_academic_year`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_id` (`school_id`),
  ADD UNIQUE KEY `academic_year_id` (`academic_year_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ezi_academic_term`
--
ALTER TABLE `ezi_academic_term`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ezi_parents`
--
ALTER TABLE `ezi_parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ezi_schools`
--
ALTER TABLE `ezi_schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ezi_school_classes`
--
ALTER TABLE `ezi_school_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ezi_school_grading_system`
--
ALTER TABLE `ezi_school_grading_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ezi_school_subjects`
--
ALTER TABLE `ezi_school_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ezi_students`
--
ALTER TABLE `ezi_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ezi_teachers`
--
ALTER TABLE `ezi_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ezi_users`
--
ALTER TABLE `ezi_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_academic_year`
--
ALTER TABLE `school_academic_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ezi_academic_term`
--
ALTER TABLE `ezi_academic_term`
  ADD CONSTRAINT `ezi_academic_term_ibfk_1` FOREIGN KEY (`academic_year_id`) REFERENCES `school_academic_year` (`academic_year_id`);

--
-- Constraints for table `ezi_parents`
--
ALTER TABLE `ezi_parents`
  ADD CONSTRAINT `ezi_parents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ezi_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ezi_school_classes`
--
ALTER TABLE `ezi_school_classes`
  ADD CONSTRAINT `ezi_school_classes_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ezi_schools` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ezi_school_classes_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `ezi_teachers` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ezi_school_grading_system`
--
ALTER TABLE `ezi_school_grading_system`
  ADD CONSTRAINT `ezi_school_grading_system_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ezi_schools` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ezi_school_subjects`
--
ALTER TABLE `ezi_school_subjects`
  ADD CONSTRAINT `ezi_school_subjects_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ezi_schools` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ezi_students`
--
ALTER TABLE `ezi_students`
  ADD CONSTRAINT `ezi_students_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ezi_parents` (`parent_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ezi_students_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `ezi_schools` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ezi_students_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `ezi_school_classes` (`class_id`);

--
-- Constraints for table `ezi_teachers`
--
ALTER TABLE `ezi_teachers`
  ADD CONSTRAINT `ezi_teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ezi_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ezi_teachers_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `ezi_schools` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `school_academic_year`
--
ALTER TABLE `school_academic_year`
  ADD CONSTRAINT `school_academic_year_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ezi_schools` (`school_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
