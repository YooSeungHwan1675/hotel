CREATE TABLE `tb_reservation` (
  `idx` INT NOT NULL AUTO_INCREMENT,  -- 번호
  `room_choice` VARCHAR(20) DEFAULT NULL, -- 객실선택
  `start_date` DATE NOT NULL,    -- 체크인
  `end_date` DATE NOT NULL,      -- 체크아웃 
  `member_id` VARCHAR(20) DEFAULT NULL, -- 고객 아이디 
  `countpeople` INT NOT NULL,   -- 인원수
  `reservation_status` CHAR(1) DEFAULT 'Y',-- 예약상태 예약중 or 공실 
  `registration_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 예약일
   `modification_date` DATETIME, -- 수정일
  PRIMARY KEY (`idx`)
) ENGINE=INNODB DEFAULT CHARSET=utf8; 