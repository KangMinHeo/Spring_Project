package com.gam;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gam.dto.CoCompanyDTO;
import com.gam.dto.EmployeeDTO;
import com.gam.dto.MeterialDTO;
import com.gam.dto.RequestDTO;
import com.gam.service.CoCompanyService;
import com.gam.service.EmployeeService;

@Controller
public class RequestMainController {

	private CoCompanyService coService;
	private EmployeeService emService;
	
	public RequestMainController(CoCompanyService coService, EmployeeService emService) {
		super();
		this.coService = coService;
		this.emService = emService;
	}

	// 발주 기능 내 메인페이지
	@RequestMapping("/request_main.do")
	public String request_main() {
		return "request/main";
	}

	/* 발주관리 - 시작 */

	// 발주관리 페이지
	@RequestMapping("request_ma_order.do")
	public String ma_order(HttpServletRequest request,  HttpServletResponse response) throws IOException {
		List<RequestDTO> list= coService.selectAllRequest();
		
		if (list == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
		}
		
		request.setAttribute("list", list);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		
		return "request/ma_order";
	}

	// 발주관리 -> 발주수정 페이지
	@RequestMapping("request_ma_order_mod.do")
	public String ma_order_mod(String r_no, HttpServletRequest request) {
		// 데이터 처리 필요
		RequestDTO dto = new RequestDTO();
		RequestDTO dto2 = new RequestDTO();

		dto = coService.selectRequesetDetail(r_no);
		System.out.println(dto.toString());
		
		String[] add = dto.getCo_address().split("/");
		String[] w_date = dto.getR_write_date().split(" ");
		String[] e_date = dto.getR_end_date().split(" ");

		request.setAttribute("dto", dto);
		request.setAttribute("add", add);
		request.setAttribute("w_date", w_date);
		request.setAttribute("e_date", e_date);
		
		dto2 = coService.selectRequesetDetail2(r_no);
		request.setAttribute("dto2", dto2);
		
		return "request/ma_order_mod";
	}

	// 발주관리 -> 담당자 변경 파업 이동
	@RequestMapping("request_popup_order.do")
	public String popup_emp(HttpServletRequest request) {
		List<EmployeeDTO> list = emService.getAllEmpList();
		request.setAttribute("list", list);
		return "request/popup_emp";
	}
	
	// 발주관리 -> 수정 버튼 처리
	@RequestMapping("request_ma_order_update.do")
	public String ma_order_update(String r_no, String e_no, String r_de_count, HttpServletResponse response) throws IOException {
		int result = coService.updateRequest1(r_no, e_no);
		int result2 = coService.updateRequest2(r_no, r_de_count);
		if(result == 0 && result2 == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보입니다.'); history.back();</script>");
		}
		return "redirect:request_ma_order.do";
	}
	
	// 발주관리 -> 발주서 삭제
	@RequestMapping("request_ma_order_delete.do")
	public String ma_delete(String r_no, HttpServletResponse response) throws IOException {
		int result = coService.deleteRequest(r_no);
		int result2 = coService.deleteRequest2(r_no);
		if(result == 0 && result2 == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보입니다.'); history.back();</script>");
		}
		return "redirect:request_ma_order.do";
	}
	
	// 발주관리 -> 발주등록 페이지
	@RequestMapping("request_ma_order_reg.do")
	public String ma_order_reg() {
		return "request/ma_order_reg";
	}

	// 발주관리 -> 협력사 변경 파업 이동
	@RequestMapping("request_popup_cc.do")
	public String popup_cc(HttpServletRequest request) {
		List<CoCompanyDTO> list = coService.selectCompany();
		request.setAttribute("list", list);
		for(int i = 0; i<list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		return "request/popup_cc";
	}
	
	// 발주관리 -> 원자재 변경 파업 이동
	@RequestMapping("request_popup_met.do")
	public String popup_met(HttpServletRequest request) {
		List<MeterialDTO> mlist = coService.selectAllMeterial();
		request.setAttribute("mlist", mlist);
		return "request/popup_met";
	}
	
	// 발주관리 -> 발주 등록 페이지에서 등록 버튼을 눌렀을 때 처리 이벤트
	@RequestMapping("request_ma_order_save.do")
	public String ma_order_save(String co_code, String wdate, String edate, String e_no, String m_no, String m_count, String m_price, HttpServletResponse response) throws IOException, ParseException {
		// 디비 등록 처리 필요
		String r_no = coService.selectRequestNo();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date wday = dt.parse(wdate); 
		Date eday = dt.parse(edate); 

		int result = coService.insertRequest(new RequestDTO(r_no, co_code, wday, eday, e_no));
		int result2 = coService.insertRequest2(new RequestDTO(r_no, m_no, m_count, m_price));
		if(result == 0 && result2 == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보입니다.'); history.back();</script>");
		}
		return "redirect:request_ma_order.do";
	}

	// 발주관리 -> 프린터 이동
	@RequestMapping("request_print.do")
	public String request_print(String r_no, HttpServletRequest request) {
		RequestDTO dto = new RequestDTO();
		RequestDTO dto2 = new RequestDTO();

		dto = coService.selectRequesetDetail(r_no);
		//System.out.println(dto.toString());
		
		String[] add = dto.getCo_address().split("/");
		String[] w_date = dto.getR_write_date().split(" ");
		String[] e_date = dto.getR_end_date().split(" ");

		request.setAttribute("dto", dto);
		request.setAttribute("add", add);
		request.setAttribute("w_date", w_date);
		request.setAttribute("e_date", e_date);
		
		dto2 = coService.selectRequesetDetail2(r_no);
		request.setAttribute("dto2", dto2);
		System.out.println(dto2.toString());
		return "request/request_page";
	}
	
	@RequestMapping("ma_order_search.do")
	public String ma_search(String searchKey, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		ArrayList<RequestDTO> list;
		if(searchKey == null || searchKey.isBlank()) {
			return "redirect:request_ma_order.do";
		} else {
			list = coService.selectMaList(searchKey);
		}
		JSONArray jarr = new JSONArray(list);
		response.getWriter().write(jarr.toString());
		return null;
	}
	
	/* 발주관리 - 종료 */

	/* 원자재관리 - 시작 */

	// 원자재관리 -> 원자재 정보 페이지
	@RequestMapping("request_info_material.do")
	public String info_material(HttpServletRequest request) {
		List<MeterialDTO> mlist = coService.selectAllMeterial();
		request.setAttribute("mlist", mlist);
		return "request/info_material";
	}

	// 원자재 관리 -> 원자재 정보 수정 페이지
	@RequestMapping("request_info_ma_mod.do")
	public String info_ma_mod(String m_no, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// 데이터 처리 필요
		MeterialDTO dto = coService.selectMeterialDetail(m_no);

		if (dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보입니다.'); history.back();</script>");
		}

		request.setAttribute("mdto", dto);

		return "request/info_ma_mod";
	}

	// 원자재 관리 -> 원자재 정보 수정 페이지 -> 수정 버튼 클릭처리
	@RequestMapping("request_info_material_update.do")
	public String info_material_update(HttpServletRequest request, HttpServletResponse response, String m_no,
			String m_name, String m_size, String m_count, String m_price, String m_cc_code, String m_country,
			String m_date) throws IOException {
		// 정보 처리 필요
		MeterialDTO dto = new MeterialDTO(m_no,m_cc_code, m_name, m_size, m_price,
		m_country, m_count, m_date);
		int result = coService.updateMeterial(dto);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('수정 실패');history.back();</script>");
		}
		return "redirect:request_info_material.do";
	}

	// 원자재 관리 -> 원자재 정보 수정 페이지 -> 삭제 버튼 클릭 처리
	@RequestMapping("request_info_material_delete.do")
	public String info_material_delete(HttpServletResponse response, String m_no) throws IOException {
		
		int result = coService.deleteMeterial(m_no);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('삭제 실패');history.back();</script>");
		}
		return "redirect:request_info_material.do";
	}
	
	// 원자재 관리 -> 원자재 정보 등록 페이지
	@RequestMapping("request_info_ma_reg.do")
	public String info_ma_reg(HttpServletRequest request) {
		List<CoCompanyDTO> list = coService.selectCompany();

		request.setAttribute("list", list);
		return "request/info_ma_reg";
	}

	// 원자재 관리 -> 원자재 정보 페이지 -> 등록버튼
	@RequestMapping("request_info_ma_register.do")
	public String info_ma_register(HttpServletResponse response, String m_no, String m_name, String m_size,
			String m_count, String m_price, String m_cc_code, String m_country, String m_date) throws IOException {
		// 데이터 처리 필요
		
		MeterialDTO dto = new MeterialDTO(m_no, m_cc_code, m_name, m_size, m_price,
				m_country, m_count, m_date);
		System.out.println(dto.toString());
		int result = coService.insertMeterial(dto);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('등록 실패');history.back();</script>");
		}
		return "redirect:request_info_material.do";
	}
	/* 원자재관리 - 종료 */

	/* 협력업체관리 - 시작 */

	// 협력업체 정보 페이지 이동
	@RequestMapping("request_info_cooperative.do")
	public String info_cooperative(HttpServletRequest request) {
		List<CoCompanyDTO> list = coService.selectCompany();

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}

		request.setAttribute("list", list);

		return "request/info_cooperative";
	}
	
	// 협력업체 제품 목록 페이지 이동
	@RequestMapping("request_popup_product.do")
	public String popup_pd(String co_no, HttpServletRequest request) {
		List<MeterialDTO> list = coService.selectMeterial(co_no); // 협력업체 사업자 번호로 값 조회
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		request.setAttribute("list", list);
		return "request/popup_pd";
	}

	// 협력업체 등록 페이지 이동
	@RequestMapping("request_info_cooperative_reg.do")
	public String info_cooperative_reg() {
		return "request/info_cooperative_reg";
	}

	// 협력업체 등록페이지 등록버튼 처리
	@RequestMapping("request_info_cooperative_register.do")
	public String info_cooperative_reg_register(HttpServletResponse response, String co_no, String co_name,
			String co_ceo, String co_tel, String co_fex, String co_address, String co_em, String co_em_tel,
			String co_email, String co_etc) throws IOException {
		// 데이터 처리 필요
		CoCompanyDTO dto = new CoCompanyDTO(co_no, co_name, co_ceo, co_tel, co_fex, co_address, co_em, co_em_tel,
				co_email, co_etc);

		int result = coService.insertCompany(dto);
		if (result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('정보 추가에 실패했습니다.'); history.back();</script>");
			return null;
		}
		return "redirect:request_info_cooperative.do";
	}

	// 협력업체 정보 수정 페이지 이동
	@RequestMapping("request_info_cooperative_mod.do")
	public String info_cooperative_mod(HttpServletRequest request) {
		String no = request.getParameter("s_no");

		CoCompanyDTO dto = coService.selectCompanyDetail(no);
		request.setAttribute("dto", dto);
//		System.out.println(dto);
		String[] tel = dto.getCo_tel().split("-");
		request.setAttribute("tel", tel);

		String[] fax = dto.getCo_fex().split("-");
		request.setAttribute("fax", fax);

		String[] add = dto.getco_address().split("/");
		request.setAttribute("add", add);

		String[] em_tel = dto.getCo_em_tel().split("-");
		request.setAttribute("em_tel", em_tel);

		String[] email = dto.getCo_email().split("@");
		request.setAttribute("email", email);
		return "request/info_cooperative_mod";
	}

	// 협력업체 수정페이지 수정버튼 처리
	@RequestMapping("request_info_cooperative_update.do")
	public String info_cooperative_update(HttpServletResponse response, String co_no, String co_name, String co_ceo,
			String co_tel, String co_fex, String co_address, String co_em, String co_em_tel, String co_email,
			String co_etc) throws IOException {
		// 데이터 처리 필요

		CoCompanyDTO dto = new CoCompanyDTO(co_no, co_name, co_ceo, co_tel, co_fex, co_address, co_em, co_em_tel,
				co_email, co_etc);

		int result = coService.updateCompany(dto);
		if (result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('정보 수정에 실패했습니다.'); history.back();</script>");
			return null;
		}
		return "redirect:request_info_cooperative.do";
	}

	// 협력업체 수정페이지 삭제버튼 처리
	@RequestMapping("request_info_cooperative_delete.do")
	public String info_cooperative_delete(String co_no, HttpServletResponse response) throws IOException {
		// 데이터 처리 필요
		System.out.println(co_no);
		int result = coService.deleteCompany(co_no);
		if (result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('정보 삭제에 실패했습니다.'); history.back();</script>");
			return null;
		}
		return "redirect:request_info_cooperative.do";
	}
	/* 협력업체관리 - 종료 */
}
