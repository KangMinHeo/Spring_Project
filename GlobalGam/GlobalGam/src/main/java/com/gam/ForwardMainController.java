package com.gam;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gam.dto.ForwardDTO;
import com.gam.dto.StorageDTO;
import com.gam.service.ForwardService;

@Controller
public class ForwardMainController {

	private ForwardService fService;
	
	public ForwardMainController(ForwardService fService) {
		super();
		this.fService = fService;
	}

	/* 출하관리 메인 페이지 이동*/
	@RequestMapping("forward_main.do")
	public String forward_main() {
		return "forward/main";
	}
	
	// 출하관리 페이지 이동
	@RequestMapping("forward_pr_order_shipment.do")
	public String forward_pr_order(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<ForwardDTO> list = fService.selectAllFor();

		if(list == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
		}
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		request.setAttribute("list", list);
		return "forward/pr_order_shipment";
	}
	
	// 출하관리 상세 페이지 이동 ->> 상태에 있는 네모 클릭시 이동하는 페이지
	@RequestMapping("forward_pr_order_shipment_me.do")
	public String pr_order_shipment_me(int f_no, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ForwardDTO dto = fService.selectForward(f_no);
		
		if(dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
		}
		request.setAttribute("dto", dto);
		return "forward/pr_order_shipment_me";
	}
	
	// 출하완료 처리
	@RequestMapping("forward_send.do")
	public String send(int f_no, int f_num, int st_num, String p_no, int s_no, HttpServletResponse response) throws IOException {
		// f_no + s_no -> f_count = f_count + s_no
		int result = fService.updateFor(f_no, s_no);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
		}
		// p_no + s_no -> if(p_no == st_name) => st_number = st_number - s_no
		int result2 = fService.updateStorage(p_no, s_no);
		if(result2 == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
		}
		return "redirect:forward_pr_order_shipment.do";
	}

}
