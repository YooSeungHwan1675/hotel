CREATE TABLE `tb_event` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `useYN` varchar(1) DEFAULT 'Y',
  `regdate` timestamp NULL DEFAULT NULL,
  `updatedate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

