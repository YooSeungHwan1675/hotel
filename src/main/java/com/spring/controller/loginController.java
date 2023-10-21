package com.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.protobuf.TextFormat.ParseException;
import com.spring.dto.memberDTO;
import com.spring.oAuth.NaverLoginBO;
import com.spring.service.memberService;


@Controller
public class loginController {
	
	private static final Logger logger = LoggerFactory.getLogger(loginController.class);
	
	@Autowired
	memberService service;
	
	@RequestMapping(value = "/login/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "login/login";
	}
	
	@RequestMapping(value = "/login/login.do", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, memberDTO dto, String remember) throws IOException {
		if (remember == null) {
			response.addCookie(new Cookie("remember", "N"));
		} else {
			response.addCookie(new Cookie("remember", remember));
			response.addCookie(new Cookie("memberID", dto.getId()));
		}
		
		memberDTO member = service.getLogin(dto);
		
		if (member == null) {
			model.addAttribute("msg", "회원정보를 확인 할 수 없습니다.");
			return "login/login";
		} else {
			HttpSession session = request.getSession();

			session.setAttribute("memberID", member.getId());
			session.setAttribute("memberName", member.getName());
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		session.removeAttribute("memberID");
		session.removeAttribute("memberName");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login/register.do", method = RequestMethod.GET)
	public String register(Model model) {
	    // 여기서 필요한 로직을 수행하고 페이지를 반환
	    return "login/register";
	}
	
	
	@RequestMapping(value = "/login/registers.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> registers(@RequestParam String id) {
	    boolean isDuplicate = service.checkId(id);
	    String message = isDuplicate ? "이미 사용 중인 아이디입니다." : "사용 가능한 아이디입니다.";

	    Map<String, String> jsonResponse = new HashMap<String, String>();
	    jsonResponse.put("result", isDuplicate ? "duplicate" : "available");
	    jsonResponse.put("message", message);

	    return jsonResponse;
	}

// naver 로 회원가입 때 참고할것.
	@RequestMapping(value = "/login/register.do", method = RequestMethod.POST)
	public String register(Model model, memberDTO dto) {
		System.out.println("여까지옴");
	    // 중복 확인
	    boolean isDuplicate = service.checkId(dto.getId());
	    if (isDuplicate) {
	        model.addAttribute("errorMessage", "이미 사용 중인 아이디입니다.");
	        return "login/register";
	    }

	    // 중복이 아닐 경우 회원 정보 등록
	    service.insertMember(dto);
	    model.addAttribute("id", dto.getId());

	    return "login/complete";
	}

	
	
	
	//네이버==============================
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	// 로그인페이지
	//로그인 첫 화면 요청 메소드 
	// 이걸 "/login/login.do로 함수 다 집어넣기
	@RequestMapping(value = "/login/Login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, HttpSession session) {
		
		/* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		/* 인증요청문 확인 */
		System.out.println("네이버:" + naverAuthUrl);
		/* 객체 바인딩 */
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "login/login";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/login/callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
				throws Exception {
			System.out.println("로그인 성공 callbackNaver");
			OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //로그인 사용자 정보를 읽어온다.
		    apiResult = naverLoginBO.getUserProfile(oauthToken);
		    
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj;
			
			jsonObj = (JSONObject) jsonParser.parse(apiResult);
			JSONObject response_obj = (JSONObject) jsonObj.get("response");			
			// 프로필 조회
			String email = (String) response_obj.get("email");
			String name = (String) response_obj.get("name");
			System.out.println(email);
			// 세션에 사용자 정보 등록
			// session.setAttribute("islogin_r", "Y");
			session.setAttribute("signIn", apiResult);
			session.setAttribute("email", email);
			session.setAttribute("memberID", email.split("@")[0]); // 이메일의 골뱅이 앞부분만 가져옴
			session.setAttribute("memberName", name);
			
	        /* 네이버 로그인 성공 페이지 View 호출 */
			return "login/loginSuccess";
		}
		
		// 소셜 로그인 성공 페이지
		@RequestMapping("/loginSuccess.do")
		public String loginSuccess() {
			return "loginSuccess";
		}
}
