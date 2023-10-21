package com.spring.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;

public class interceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("시작");
		
		HttpSession session = request.getSession(); 
		
		//String url = request.getRequestURI();
		//System.out.println(url);
		if (!request.getServletPath().equals("/admin/login.do")) {
			if (session.getAttribute("ID") == null) {
				response.sendRedirect(request.getContextPath() + "/admin/login.do?path=" + request.getServletPath());
				return false;
			}
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//System.out.println("끝");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//System.out.println("123");
	}

}
