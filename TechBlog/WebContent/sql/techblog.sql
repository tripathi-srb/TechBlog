-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2020 at 05:40 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `name`, `description`) VALUES
(1, 'Java Programming', 'Java is one of the most popular programming language.'),
(2, 'Python', 'Python is one of most popular for machine learning.'),
(3, 'WebTechnology', 'Used mostly for developing for website and web application.'),
(4, 'Database Programming', 'Data is very important for any website');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `lid` int(20) NOT NULL,
  `pid` int(20) NOT NULL,
  `uid` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`lid`, `pid`, `uid`) VALUES
(4, 10, 4),
(5, 9, 4),
(6, 2, 9),
(7, 7, 9),
(8, 3, 4),
(9, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `pID` int(20) NOT NULL,
  `pTitle` varchar(100) NOT NULL,
  `pContent` longtext NOT NULL,
  `pCode` longtext NOT NULL,
  `pPic` varchar(500) NOT NULL DEFAULT 'blog_img.png',
  `pDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `cID` int(20) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`pID`, `pTitle`, `pContent`, `pCode`, `pPic`, `pDate`, `cID`, `userId`) VALUES
(1, 'Hello World Java Program', 'Once you have the Java compiler successfully installed, open a text editor (example, Notepad) and type in the following:\r\n\r\nNow compile that program using the command:\r\njavac HelloWorld.java\r\n\r\nNow you will see that the computer has printed:\r\nHello, World!\r\n\r\non the display monitor.', '/*\r\n* The HelloWorld Java program\r\n* prints \"Hello World!\" on the computer screen\r\n*/\r\nclass HelloWorld {\r\n  public static void main(String[] args) {\r\n   System.out.println(\"Hello, World!\");\r\n  }\r\n}', 'java1.jpg', '2020-04-23 11:35:33', 1, 4),
(2, 'What is Collection Framework? ', 'This is my first question about java programming language?', 'No code', 'Java_Collections.png', '2020-04-23 11:40:25', 1, 4),
(3, 'What is Python ?', 'Python is one of the most popular programming for deep learning.', 'No.', 'python.jpg', '2020-04-23 11:53:28', 2, 4),
(4, 'What is web technology ?', 'Web technology refers to the means by which computers communicate with each other using markup languages and multimedia packages. It gives us a way to interact with hosted information, like websites. Web technology involves the use of hypertext markup language (HTML) and cascading style sheets (CSS)', 'no code', 'webtech.jpg', '2020-04-23 11:59:07', 3, 9),
(5, 'What is Database Programming ?', 'A database program is the heart of a business information system and provides file creation, data entry, update, query and reporting functions. The traditional term for database software is \"database management system\"', 'CREATE DATABASE database_name;\r\n\r\ndatabase_name: name of the database.', 'datbase-schema.jpg', '2020-04-23 12:08:48', 4, 10),
(6, 'What do you understand by Java virtual machine?', 'Java Virtual Machine is a virtual machine that enables the computer to run the Java program. JVM acts like a run-time engine which calls the main method present in the Java code. JVM is the specification which must be implemented in the computer system. The Java code is compiled by JVM to be a Bytecode which is machine independent and close to the native code.', 'no code', 'JVM.jpg', '2020-04-23 12:25:14', 1, 7),
(7, 'What is OutOfMemoryError in Java?', 'OutOfMemoryError is the subclass of java.lang.Error which generally occurs when our JVM runs out of memory.', 'no code', 'OutOfMemory.png', '2020-04-23 12:32:35', 1, 7),
(8, 'How Python is interpreted?', 'Python language is an interpreted language. Python program runs directly from the source code. It converts the source code that is written by the programmer into an intermediate language, which is again translated into machine language that has to be executed.', 'No code', 'python.jpg', '2020-04-23 12:38:16', 2, 6),
(9, ' What is DBMS?', 'Database Management Systems (DBMS) are applications designed especially which enable user interaction with other applications.', 'no code', 'datbase-schema.jpg', '2020-04-23 12:40:44', 4, 6),
(10, 'HTML stands for?', 'A.	Hyper Text Markup Language\r\nB.	High Text Markup Language\r\nC.	Hyper Tabular Markup Language\r\nD.	None of these', '', 'html-hpg-featured-new.png', '2020-04-24 10:15:43', 3, 9),
(12, 'Define classes in Java ', 'A class is a collection of objects of similar data types. Classes are user-defined data types and behave like built-in types of a programming language. ', 'Syntax of a class:\r\n\r\nclass Sample{\r\nmember variables\r\nmethods() \r\n}', 'blog_img.png', '2020-04-28 09:09:44', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) DEFAULT '''hey  ! I am using Tech Blog''',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(100) DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `gender`, `about`, `rdate`, `profile`) VALUES
(2, 'surabhi tripathi', 'surabhi@ebix.com', 'priya123', 'on', 'Java Programmer', '2020-04-19 17:39:24', 'default.png'),
(3, 'surabhi tripathi', 'priya@gmail.com', 'we34', 'female', 'program analyst', '2020-04-19 17:43:05', 'default.png'),
(4, 'him', 'him@gmail.com', '123', 'male', 'Programmer', '2020-04-20 06:26:26', 'him1.png'),
(5, 'shubhi', 'shubhi@gmail.com', 'abc', 'female', 'nothing..', '2020-04-20 06:45:36', 'default.png'),
(6, 'jhon', 'jhon@gmail.com', '123', 'male', 'hi', '2020-04-20 07:00:01', 'default.png'),
(7, 'nida', 'nida@gmail.com', '123', 'female', 'hi i\'m a programmer', '2020-04-20 10:09:56', 'default.png'),
(9, 'priya', 'priya@123', '123', 'female', 'Programmer', '2020-04-21 08:23:42', 'download.png'),
(10, 'Peter', 'peter@gmail.com', '123', 'male', 'Hi ! I\'m Programmer', '2020-04-22 07:31:55', 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `posts_ibfk_1` (`cID`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `lid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `pID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
