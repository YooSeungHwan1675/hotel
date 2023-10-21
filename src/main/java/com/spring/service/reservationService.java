package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.reservationDAO;
import com.spring.dto.reservationDTO;

@Service
public class reservationService {
	@Autowired
	reservationDAO dao;
	
	
	public List<reservationDTO> reservationList(reservationDTO dto) {
		List<reservationDTO> reservationList = dao.reservationList(dto);
		
		return reservationList;
	}	
	public int reservationCount(reservationDTO dto) {
		int reservationCount = dao.reservationCount(dto);
		return reservationCount;
	}
	
	public void reservationInsert(reservationDTO dto) {
		dao.reservationInsert(dto);
	}
	
	public void reservationDelete(String[] delData) {
		dao.reservationDelete(delData);
	}
		
	public reservationDTO getreservation(int idx) {
		reservationDTO dto = dao.getreservation(idx);
		return dto;
	}

	public void reservationUpdate(reservationDTO dto) {
		System.out.println("업뎃 서비스");
		System.out.println(dto);
		dao.reservationUpdate(dto);
	}
	public void updateReservationStatus(reservationDTO dto) {
		System.out.println("업뎃 서비스");
		System.out.println(dto);
		
		dao.updateReservationStatus(dto);
	}
		
}







//
//public class reservationService {
//	
//	private static reservationService instance = new reservationService();
//	private reservationService() {	}
//	public static reservationService getInstance() {
//		return instance;
//	}
//	
//	public void insert(reservationDTO dto) {
////		System.out.println("reservationService의 insert()");
//		SqlSession mapper = MySession.getSession();
////		System.out.println("연결 성공: " + mapper);
//		reservationDAO.getInstance().insert(mapper, dto);
//		mapper.commit();
//		mapper.close();
//	}
//		
//		public List<reservationDTO> reservationList(reservationDTO dto) {
//			SqlSession mapper = MySession.getSession();
//			reservationDAO dao = reservationDAO.getInstance();
//			List<reservationDTO> reservationList = dao.reservationList(mapper,dto);
//			
//			return reservationList;
//		}	   
//		public void deletereservation(String[] delData) {
////			System.out.println("삭제 서비스");
//			SqlSession mapper = MySession.getSession();
//			reservationDAO dao = reservationDAO.getInstance();
//			dao.deletereservation(mapper, delData);
//			mapper.commit();
//			mapper.close();
//		}
//		
//		public int reservationCount(reservationDTO dto) {
//			SqlSession mapper = MySession.getSession();
//			reservationDAO dao = reservationDAO.getInstance();
//			
//			int reservationCount = dao.reservationCount(mapper, dto);
//			mapper.close();
//			return reservationCount;
//		}
//		public reservationDTO selectByIdx(int idx) {
//			System.out.println("reservationService의 selectByIdx()");
//			SqlSession mapper = MySession.getSession();
//			reservationDTO dto = reservationDAO.getInstance().selectByIdx(mapper, idx);
//			mapper.close();
//			return dto;
//		}
//
//		public void update(reservationDTO reservation) {
//		    SqlSession mapper = MySession.getSession();
//		    reservationDAO.getInstance().update(mapper, reservation);
//		    mapper.commit();
//		    mapper.close();
//		}
//				
//		public void updateStatus(reservationDTO reservation) {
//			//System.out.println("reservationService의 updateStatus()");
//		    // reservation 객체에서 필요한 정보를 가져와서 예약 상태를 업데이트합니다.
//		    SqlSession mapper = MySession.getSession();
//		    reservationDAO.getInstance().updateStatus(mapper, reservation);
//		    mapper.commit();
//		    mapper.close();
//		    
//		}
//
//		
//
//		
//		
//		
//}
