CREATE TABLE `tb_question` (
  `idx` INT(11) NOT NULL AUTO_INCREMENT,
  `type` ENUM('예약', '불만', '기타') DEFAULT NULL,
  `title` VARCHAR(100) DEFAULT NULL,
  `contents` VARCHAR(1000) DEFAULT NULL,
  `userid` VARCHAR(20) DEFAULT NULL,
  `answer` ENUM('미확인', '처리중', '답변완료') DEFAULT '미확인',
  `regdate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedate` DATE DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

