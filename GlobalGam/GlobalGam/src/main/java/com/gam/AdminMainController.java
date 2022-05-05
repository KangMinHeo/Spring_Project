package com.gam;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gam.dto.EmployeeDTO;
import com.gam.service.EmployeeService;

@Controller
public class AdminMainController {
	private EmployeeService eService;

	public AdminMainController(EmployeeService eService) {
		super();
		this.eService = eService;
	}

	// 관리자 메인 페이지
	@RequestMapping("admin_select_main.do")
	public String admin_select_main() {
		return "admin/main";
	}

	// 직원 등록 페이지 이동
	@RequestMapping("admin_main.do")
	public String admin() {
		return "admin/admin_register";
	}

	// 직원 수정페이지로 이동 및 직원 테이블 값 호출
	@RequestMapping("admincrt_main.do")
	public String admincrt(HttpServletRequest request) {
		List<EmployeeDTO> empList = eService.getAllEmpList();
		request.setAttribute("emp", empList);
		return "admin/admincrt";
	}

	@RequestMapping("register.do")
	public String register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String pro = request.getParameter("pro");
		String line = request.getParameter("line");
		String level = request.getParameter("type");
		System.out.println(id + pw + name + pro + line + level);
		EmployeeDTO dto = new EmployeeDTO(id, name, pw, level, line, pro);
		System.out.println(dto.toString());
		int result = eService.insertEmployee(dto);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
		}
		return"redirect:admincrt_main.do";
	}
	
	@RequestMapping("adminup.do")
	public String adminup(int e_no, HttpServletRequest request) {
		EmployeeDTO dto	= eService.selectEmployee(e_no);
		System.out.println(dto.toString());
		request.setAttribute("emp", dto);
		return "admin/adminup";
	}
	@RequestMapping("admindt.do")
	public String admindt(int e_no, HttpServletResponse response) throws IOException {
		int result = eService.deleteEmployee(e_no);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
		}
		return"redirect:admincrt_main.do";
	}
	
	@RequestMapping("adminud.do")
	public String adminud(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String pw = request.getParameter("pw");
		if(pw.length() == 0) {
			pw = request.getParameter("apw");
		}
		String name = request.getParameter("name");
		String pro = request.getParameter("pro");
		String line = request.getParameter("line");
		String level = request.getParameter("type");
//		System.out.println(id + pw + name + pro + line + level);
		EmployeeDTO dto = new EmployeeDTO(id, name, pw, level, line, pro);
		System.out.println("수정 후 : " + dto.toString());
		int result = eService.updateEmployee(dto);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
		}
		return"redirect:admincrt_main.do";
	}
}