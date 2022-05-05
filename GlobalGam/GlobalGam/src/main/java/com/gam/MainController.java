package com.gam;

import java.io.IOException;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gam.dto.EmployeeDTO;
import com.gam.service.EmployeeService;


@Controller
public class MainController {
	
	private EmployeeService empService;
	
	public MainController(EmployeeService empService, HttpServletRequest request) {
		this.empService = empService;
	}

	@Autowired
	HttpServletRequest request;
	
	
	@RequestMapping({"","/"})
	public String index(HttpSession session) {
		if(session.getAttribute("member") != null) {
			return "redirect:index.do";
		}
		return "login";
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		String id = request.getParameter("e_no");
		String pw = request.getParameter("e_pw");
		
//		System.out.println(id);
//		System.out.println(pw);
		
		EmployeeDTO dto = empService.login(id, pw); 
//		System.out.println(dto);
		if(dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('아이디 비밀번호 확인하세요.');history.back();</script>");
			return null;
		}
		session.setAttribute("member", dto);
		session.setAttribute("level", dto.geteLevel());
		request.setAttribute("dto", dto);
		return "index";
	}
	
	@RequestMapping("index.do")
	public String index_do() {
		return "index";
	}
	
	@RequestMapping("logout.do")
	public String logout_do(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
