-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2022 at 10:15 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll`
--
CREATE DATABASE IF NOT EXISTS `payroll` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `payroll`;

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` int(30) NOT NULL,
  `allowance` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `allowance`, `description`) VALUES
(5, 'DA', 'Dearness Allowance is provided for converse the inflationary effect from the cost of living of the people.'),
(7, 'Overtime Allowance', 'It is provided to the employee for working more than the regular working hours.'),
(11, 'HRA', 'House rent allowance is offered to meet the residential rent expenses of the employee for its accomadation.'),
(13, 'CA', 'Conveyance allowance is offered to the employees for commuting from home to work and vice-versa. '),
(14, 'Medical Bills Reimbursement Allowance', 'It is offered to the employees for meeting the treatment costs in case the employee or their family fall ill.');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(20) NOT NULL,
  `log_type` tinyint(1) NOT NULL COMMENT '1 = AM IN,2 = AM out, 3= PM IN, 4= PM out\r\n',
  `datetime_log` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `log_type`, `datetime_log`, `date_updated`) VALUES
(31, 11, 1, '2022-04-01 08:00:00', '2022-04-09 13:33:52'),
(32, 11, 2, '2022-04-01 12:00:00', '2022-04-09 13:33:52'),
(33, 11, 3, '2022-04-01 13:00:00', '2022-04-09 13:33:52'),
(34, 11, 4, '2022-04-01 17:00:00', '2022-04-09 13:33:52'),
(35, 12, 2, '2022-04-02 12:00:00', '2022-04-09 13:41:18'),
(36, 12, 1, '2022-04-02 08:00:00', '2022-04-09 13:41:18'),
(37, 12, 3, '2022-04-02 13:00:00', '2022-04-09 13:41:18'),
(38, 12, 4, '2022-04-02 17:00:00', '2022-04-09 13:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` int(30) NOT NULL,
  `deduction` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `deduction`, `description`) VALUES
(4, 'Professional Tax', 'It is a small tax levied by the state government on earning professionals.'),
(5, 'EPF', 'The employee provident fund is the contribution to the provident fund.'),
(6, 'TDS', 'Tax deducted at source is the amount deducted by the employer on behalf of the income tax department.');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'IT Department'),
(2, 'HR Department'),
(3, 'Accounting and Finance Department');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(20) NOT NULL,
  `employee_no` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `department_id` int(30) NOT NULL,
  `position_id` int(30) NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `employee_no`, `firstname`, `middlename`, `lastname`, `department_id`, `position_id`, `salary`) VALUES
(12, '2022-4477', 'Dummy ', '', 'User', 1, 1, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `employee_allowances`
--

CREATE TABLE `employee_allowances` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `allowance_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_allowances`
--

INSERT INTO `employee_allowances` (`id`, `employee_id`, `allowance_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(1, 10, 5, 1, 5000, '2022-04-01', '2022-04-09 11:20:04'),
(3, 10, 7, 1, 1000, '2022-04-01', '2022-04-09 11:20:04'),
(7, 10, 11, 1, 14000, '2022-04-01', '2022-04-09 11:20:04'),
(9, 10, 13, 1, 1600, '2022-04-01', '2022-04-09 11:20:04'),
(10, 10, 14, 1, 15000, '2022-04-01', '2022-04-09 11:20:04'),
(12, 11, 13, 1, 1600, '0000-00-00', '2022-04-09 13:17:50'),
(13, 11, 7, 1, 500, '0000-00-00', '2022-04-09 13:17:50'),
(14, 11, 5, 1, 5000, '0000-00-00', '2022-04-09 13:17:50'),
(15, 11, 11, 1, 10000, '0000-00-00', '2022-04-09 13:17:50'),
(16, 12, 13, 1, 1600, '0000-00-00', '2022-04-09 13:39:08'),
(17, 12, 5, 1, 5000, '0000-00-00', '2022-04-09 13:39:08'),
(18, 12, 11, 1, 10000, '0000-00-00', '2022-04-09 13:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `employee_deductions`
--

CREATE TABLE `employee_deductions` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `deduction_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_deductions`
--

INSERT INTO `employee_deductions` (`id`, `employee_id`, `deduction_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(1, 10, 4, 1, 200, '2022-04-01', '2022-03-15 11:20:04'),
(2, 10, 5, 1, 5400, '2022-04-01', '2022-03-15 11:37:31'),
(3, 10, 6, 1, 0, '2022-04-01', '2022-03-15 11:38:31'),
(4, 11, 4, 1, 2000, '0000-00-00', '2022-04-09 13:19:52'),
(5, 11, 5, 1, 4500, '0000-00-00', '2022-04-09 13:19:52'),
(6, 12, 5, 1, 3600, '0000-00-00', '2022-04-09 13:39:40'),
(7, 12, 4, 1, 2000, '0000-00-00', '2022-04-09 13:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = monthly ,2 semi-monthly',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =New,1 = computed',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `ref_no`, `date_from`, `date_to`, `type`, `status`, `date_created`) VALUES
(8, '2022-5830', '2022-04-01', '2022-04-09', 1, 1, '2022-04-09 13:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_items`
--

CREATE TABLE `payroll_items` (
  `id` int(30) NOT NULL,
  `payroll_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `present` int(30) NOT NULL,
  `absent` int(10) NOT NULL,
  `late` text NOT NULL,
  `salary` double NOT NULL,
  `allowance_amount` double NOT NULL,
  `allowances` text NOT NULL,
  `deduction_amount` double NOT NULL,
  `deductions` text NOT NULL,
  `net` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payroll_items`
--

INSERT INTO `payroll_items` (`id`, `payroll_id`, `employee_id`, `present`, `absent`, `late`, `salary`, `allowance_amount`, `allowances`, `deduction_amount`, `deductions`, `net`, `date_created`) VALUES
(18, 5, 10, 1, 21, '0', 40000, 36600, '[{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"7\",\"amount\":\"1000\"},{\"aid\":\"11\",\"amount\":\"14000\"},{\"aid\":\"13\",\"amount\":\"1600\"},{\"aid\":\"14\",\"amount\":\"15000\"}]', 5600, '[{\"did\":\"4\",\"amount\":\"200\"},{\"did\":\"5\",\"amount\":\"5400\"},{\"did\":\"6\",\"amount\":\"0\"}]', 32818, '2022-04-09 12:41:50'),
(19, 5, 11, 1, 21, '-120', 30000, 0, '[]', 0, '[]', 1705, '2022-04-09 12:41:50'),
(20, 2, 10, 1, 21, '0', 40000, 36600, '[{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"7\",\"amount\":\"1000\"},{\"aid\":\"11\",\"amount\":\"14000\"},{\"aid\":\"13\",\"amount\":\"1600\"},{\"aid\":\"14\",\"amount\":\"15000\"}]', 5600, '[{\"did\":\"4\",\"amount\":\"200\"},{\"did\":\"5\",\"amount\":\"5400\"},{\"did\":\"6\",\"amount\":\"0\"}]', 32818, '2022-04-09 13:20:20'),
(21, 2, 11, 1, 21, '-120', 30000, 17100, '[{\"aid\":\"13\",\"amount\":\"1600\"},{\"aid\":\"7\",\"amount\":\"500\"},{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"11\",\"amount\":\"10000\"}]', 6500, '[{\"did\":\"4\",\"amount\":\"2000\"},{\"did\":\"5\",\"amount\":\"4500\"}]', 12305, '2022-04-09 13:20:20'),
(22, 6, 10, 1, 21, '0', 40000, 36600, '[{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"7\",\"amount\":\"1000\"},{\"aid\":\"11\",\"amount\":\"14000\"},{\"aid\":\"13\",\"amount\":\"1600\"},{\"aid\":\"14\",\"amount\":\"15000\"}]', 5600, '[{\"did\":\"4\",\"amount\":\"200\"},{\"did\":\"5\",\"amount\":\"5400\"},{\"did\":\"6\",\"amount\":\"0\"}]', 32818, '2022-04-09 13:21:09'),
(23, 6, 11, 1, 21, '-120', 30000, 17100, '[{\"aid\":\"13\",\"amount\":\"1600\"},{\"aid\":\"7\",\"amount\":\"500\"},{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"11\",\"amount\":\"10000\"}]', 6500, '[{\"did\":\"4\",\"amount\":\"2000\"},{\"did\":\"5\",\"amount\":\"4500\"}]', 12305, '2022-04-09 13:21:09'),
(24, 7, 10, 0, 22, '0', 40000, 36600, '[{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"7\",\"amount\":\"1000\"},{\"aid\":\"11\",\"amount\":\"14000\"},{\"aid\":\"13\",\"amount\":\"1600\"},{\"aid\":\"14\",\"amount\":\"15000\"}]', 5600, '[{\"did\":\"4\",\"amount\":\"200\"},{\"did\":\"5\",\"amount\":\"5400\"},{\"did\":\"6\",\"amount\":\"0\"}]', 31000, '2022-04-09 13:34:31'),
(25, 7, 11, 1, 21, '0', 30000, 17100, '[{\"aid\":\"13\",\"amount\":\"1600\"},{\"aid\":\"7\",\"amount\":\"500\"},{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"11\",\"amount\":\"10000\"}]', 6500, '[{\"did\":\"4\",\"amount\":\"2000\"},{\"did\":\"5\",\"amount\":\"4500\"}]', 11964, '2022-04-09 13:34:31'),
(26, 8, 12, 0, 22, '0', 30000, 16600, '[{\"aid\":\"13\",\"amount\":\"1600\"},{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"11\",\"amount\":\"10000\"}]', 5600, '[{\"did\":\"5\",\"amount\":\"3600\"},{\"did\":\"4\",\"amount\":\"2000\"}]', 11000, '2022-04-09 13:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `department_id`, `name`) VALUES
(1, 1, 'Programmer'),
(2, 2, 'HR Supervisor'),
(4, 3, 'Accounting Clerk');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1),
(2, 0, 'Kamal Patel', '', '', 'kamalpatel', 'user123', 2),
(3, 0, 'Shiv', '', '', 'shivmehta ', 'user2', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
