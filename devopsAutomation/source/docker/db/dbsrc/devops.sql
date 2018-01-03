CREATE DATABASE IF NOT EXISTS devops;

GRANT ALL PRIVILEGES ON devops.* TO 'vagrant'@'%' IDENTIFIED BY 'vagrant';

USE devops;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

INSERT INTO `users` (`username`, `password`, `fullname`) VALUES
('admin', 'admin', 'ADMINISTRATOR'),
('peter', 'peter', 'Peter Tsonkov'),
('vagrant', 'vagrant', 'Vagrant User');

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

INSERT INTO `content` (`title`, `content`) VALUES
('Title1', 'This is content of Title1'),
('Title2', 'This is content of Title2'),
('Title3', 'This is content of Title3');