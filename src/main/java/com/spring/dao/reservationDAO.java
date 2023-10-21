package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.reservationDTO;

@Mapper
public interface reservationDAO {

	public void reservationInsert(reservationDTO dto);
	
	public List<reservationDTO> reservationList(reservationDTO dto);
	public int reservationCount(reservationDTO dto);
	
	public void reservationDelete(String[] delData);
	
	
	public reservationDTO getreservation(int idx);

	public void reservationUpdate(reservationDTO dto);

	public void updateReservationStatus(reservationDTO dto);
	
//	public void updatereservation(reservationDTO reservation); 
	
//	public void reservationUpdate(reservationDTO dto);
}

//
//public class reservationDAO {
//
//	private static reservationDAO instance = new reservationDAO();
//	private reservationDAO() { }
//	public static reservationDAO getInstance() {
//		if (instance == null) {
//			instance = new reservationDAO();
//		}
//		
//		return instance;
//	}
//	public List<reservationDTO> reservationList(SqlSession mapper, reservationDTO dto) {
//		return (ArrayList<reservationDTO>) mapper.selectList("reservationList", dto);
//	}
//	
//	public int reservationCount(SqlSession mapper, reservationDTO dto) {
//		return (Integer) mapper.selectOne("reservationCount", dto);
//	}
//	
//	public void insertreservation(SqlSession mapper, reservationDTO dto) {
////		System.out.println("reservationDAO의 insertreservation()");
//		mapper.insertreservation("insertreservation", dto);
//	}
//	
//	
//	public void deletereservation(SqlSession mapper, String[] delData) {
//		mapper.delete("deletereservation", delData);
//	}
//	
//	
//	
//	public reservationDTO selectByIdx(SqlSession mapper, int idx) {
//		System.out.println("reservationDAO의 selectByIdx()");
//		return (reservationDTO) mapper.selectOne("getreservation", idx);
//	}
//	public void update(SqlSession mapper, reservationDTO reservation) {
////	    System.out.println("reservationDAO의 update()");
//	    mapper.update("reservationUpdate", reservation);
//	}
//	public void updateStatus(SqlSession mapper, reservationDTO reservation) {
////	    System.out.println("reservationDAO의 update()");
//	    mapper.update("reservationupdateStatus", reservation);
//
//	}
//
//	
//	
//	
//	
//}
