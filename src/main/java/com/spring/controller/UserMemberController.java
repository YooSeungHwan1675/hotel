package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.memberDTO;
import com.spring.dto.noticeDTO;
import com.spring.service.memberService;

@Controller
public class UserMemberController {
	private static final Logger logger = LoggerFactory.getLogger(UserMemberController.class);

	@Autowired
	memberService service;

	@RequestMapping(value = "/member/info.do")
	public String info(Model model) {
//		logger.info("공지 시작");

		return "/member/info";
	}
// 얘 역할?

	@RequestMapping(value = "/member/info1.do", method = RequestMethod.GET)
	@ResponseBody
	public memberDTO memberInfo(Model model, memberDTO dto) {
		memberDTO user = service.getMember(dto);
//		System.out.println("유저:"+user);
		
		// user를 화면에 찍는 법
		return user;
	}
	
    @RequestMapping(value = "/member/infodraw.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> infodraw(HttpSession session ,memberDTO dto) {
        Map<String, String> result = new HashMap<String, String>();
        
        try {
            // 탈퇴 로직 실행
            service.withdrawMember(dto);
            
    		session.removeAttribute("memberID");
    		session.removeAttribute("memberName");	
    		
            result.put("result", "success");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", "failed");
        }
        
        return result;
    }

    @RequestMapping(value = "/member/infoUpdate.do", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public Map<String, Object> infoUpdate(Model model,@RequestBody memberDTO dto) {
	    System.out.println("수정업뎃까지옴");
	    System.out.println("dto"+dto);
//	    System.out.println("model"+model);
	    service.infoUpdate(dto);
//
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("result", "success");
	    map.put("message", "수정완료");
//
	    return map;
	}
}
	
	







