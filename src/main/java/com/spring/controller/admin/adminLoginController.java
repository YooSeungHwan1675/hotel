package com.spring.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.memberDTO;
import com.spring.dto.userDTO;
import com.spring.service.memberService;
import com.spring.service.userService;

@Controller
public class adminLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminLoginController.class);
	
	@Autowired
	userService service;
	
	private String path;
	
	@RequestMapping(value = "/admin/login.do", method = RequestMethod.GET)
	public String login(Model model, String path) {
		this.path = path;
		
		return "admin/login";
	}
	// 8 - 27 일 추가
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model, String path) {
		this.path = path;
		
		return "admin/login";
	}
	
	@RequestMapping(value = "/admin/login.do", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, userDTO dto) throws IOException {
		userDTO user = service.getUser(dto);
		
		if (user == null) {
			model.addAttribute("msg", "사번정보를 확인 할 수 없습니다.");
			return "admin/login";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("ID", user.getId());
			session.setAttribute("Name", user.getName());
			
			//String path = (String) request.getParameter("path");
			//return "redirect:" + request.getContextPath() + (this.path == null || this.path.equals("/admin") ?  "/admin/member.do" : this.path);
		}
		
		return "redirect:" + (this.path == null || this.path.equals("/admin") ?  "/admin/member.do" : this.path);
	}
	
	@RequestMapping(value = "/admin/logout.do", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("ID");
		session.removeAttribute("Name");
		
		return "redirect:/admin/login.do";
	}
}
