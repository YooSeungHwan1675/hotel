package com.spring.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.paging;
import com.spring.dto.reservationDTO;
import com.spring.service.reservationService;

//@WebServlet("/admin/reservation.do")
@Controller
public class reservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(reservationController.class);
	
	@Autowired
	reservationService service;
	
	
//	보여주기 잘됨
	@RequestMapping(value = "/admin/reservation.do", method = RequestMethod.GET)
	public String reservation(Model model, reservationDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		dto.setCurrentPage((currentPage-1) * 10);
		
		List<reservationDTO> list = service.reservationList(dto);
		int totalCount = service.reservationCount(dto);
		//System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		
		return "admin/reservation";
	}
	
	
	
//	삭제 잘됨
	@RequestMapping(value = "/admin/reservationDelete.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> reservationDelete(Model model, @RequestBody String delIds) {
//		System.out.println("여까진옴");
		System.out.println(delIds);
		String[] delData = delIds.split(",");
		service.reservationDelete(delData);
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		
		return map;
	}
	

	@RequestMapping(value = "/admin/reservationInsert.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> reservationInsert(@RequestBody reservationDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
//	public Map<String, String> reservationInsert(Model model, reservationDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
//	    System.out.println("reservationInsert 삽입 컨트롤까지 옴");
//	    System.out.println(dto);

	    service.reservationInsert(dto);

	    Map<String, String> map = new HashMap<String, String>();
	    map.put("result", "success");
	    map.put("message", "입력완료");

	    return map;
	}

	//겟 됨
	@RequestMapping(value = "/getreservation.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> reservationSelect(@RequestParam("idx") int idx) {
		//System.out.println("글번호? " + idx);
		
		reservationDTO reservation = service.getreservation(idx);
		Map<String, Object> response = new HashMap<String, Object>();
		
		if (reservation != null) {
			response.put("result", "success");
			response.put("room_choice", reservation.getRoom_choice());
	        response.put("start_date", reservation.getStart_date().getTime()); // Convert to milliseconds
	        response.put("end_date", reservation.getEnd_date().getTime()); // Convert to milliseconds
			response.put("member_id", reservation.getMember_id());
	        response.put("countpeople", reservation.getCountpeople());
		        
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
		} else {
			response.put("result", "error");
			response.put("message", "reservation not found");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
	}
	
	
	@RequestMapping(value = "/admin/reservationUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reservationUpdate(@RequestBody reservationDTO dto) {
		//System.out.println("수정업뎃까지옴");
	    //System.out.println(dto);
		service.reservationUpdate(dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("message", "수정완료");
		
		return map;
	}
	
	@RequestMapping(value = "/admin/updateReservationStatus.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateReservationStatus(@RequestBody reservationDTO dto) {
//		System.out.println("수정업뎃까지옴");
//		System.out.println(dto);
		service.updateReservationStatus(dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("message", "수정완료");
		
		return map;
	}
	
	
	
	
}
