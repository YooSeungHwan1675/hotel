CREATE TABLE `tb_room` (
  `idx` INT(11) NOT NULL AUTO_INCREMENT, -- 번호             
  `type` VARCHAR(20) DEFAULT NULL, --  객실 TYPE
  `size` VARCHAR(20) DEFAULT NULL,--  객실 크기(m2)
  `roomno` VARCHAR(20) DEFAULT NULL,
  `capacity` VARCHAR(20) DEFAULT NULL,-- 수용 가능 인원(명)
  `price` VARCHAR(20) DEFAULT NULL, -- 금액(원)
  `number` VARCHAR(20) DEFAULT NULL, -- 객실 수(개)
  `regdate` DATE DEFAULT NULL, -- 등록일   
  `updatedate` DATE DEFAULT NULL, -- 수정일
  PRIMARY KEY (`idx`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
