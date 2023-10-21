package com.spring.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.UserReservationDTO;

@Mapper
public interface UserReservationDAO {

	public void userreservationInsert(UserReservationDTO dto);

	



}
