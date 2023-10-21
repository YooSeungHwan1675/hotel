-- test.tb_member definition

CREATE TABLE `tb_member` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `jumin1` varchar(6) DEFAULT NULL,
  `jumin2` varchar(7) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `addr1` varchar(100) DEFAULT NULL,
  `addr2` varchar(100) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `useYN` char(1) DEFAULT 'Y',
  `regdate` date DEFAULT NULL,
  `updatedate` date DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



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