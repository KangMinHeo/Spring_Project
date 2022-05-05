package com.gam;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gam.dto.StorageDTO;
import com.gam.service.StorageService;
import com.gam.vo.GlobalGamCompanyVO;

@Controller
public class StroageMainController {
	
	private StorageService stoService;
	
	public StroageMainController(StorageService stoService) {
		super();
		this.stoService = stoService;
	}

	/*        재고 관리 메인페이지 이동        */
	@RequestMapping("storage_main.do")
	public String storage_main() {
		return "storage/main";
	}
	
	/*        입/출고 관리 시작        */
	
	// 입출고 관리 페이지 이동
	@RequestMapping("storage_ma_put.do")
	public String ma_put() {
		return "storage/ma_put";
	}
	
	/*        입/출고 관리 종료        */
	
	/*        재고 관리 시작        */
	
	// 재고 관리 페이지 이동
	@RequestMapping("storage_ma_inventory.do")
	public String ma_inventory(HttpServletRequest request) {
		List<StorageDTO> list = stoService.selectAllSto(); // 원자재 목록 호출
		List<StorageDTO> list2 = stoService.selectAllSto2(); // 완제품 목록 호출
		
		request.setAttribute("list", list);
		request.setAttribute("list_size", list.size());
		request.setAttribute("list2", list2);
		request.setAttribute("list2_size", list2.size());
		request.setAttribute("list3_size", list.size()+list2.size());
		
		return "storage/ma_inventory";
	}
	
	// 재고 관리 상세 페이지 이동
	@RequestMapping("storage_inv_detail.do")
	public String inv_detail(String st_no, HttpServletRequest request) {
		if('A'<=st_no.charAt(0) && st_no.charAt(0)<= 'G') {
			StorageDTO dto = stoService.selectStoDetail(st_no);
			request.setAttribute("dto", dto);
			System.out.println(dto.toString());
		} else {
			StorageDTO dto2 = stoService.selectStoDetail2(st_no);
			request.setAttribute("dto2", dto2);
			
			GlobalGamCompanyVO vo = new GlobalGamCompanyVO();
			String c_name = vo.getGgName();
			request.setAttribute("cN", c_name);
			System.out.println(dto2.toString());
		}
		return "storage/inv_detail";
	}
	
	// 재고 관리 상세 페이지 -> 등록버튼 처리
	@RequestMapping("storage_inv_delete.do")
	public String inv_delete(String st_no, HttpServletResponse response) throws IOException {
		if('A'<=st_no.charAt(0) && st_no.charAt(0)<= 'G') {
			int result = stoService.deleteSto(st_no);
			if(result == 0) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
			}
		} else {
			int result = stoService.deleteSto2(st_no);
			if(result == 0) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
			}
		}
		return "redirect:storage_ma_inventory.do";
	}

	/*        재고 관리 종료        */

	/*        입고 관리 시작        */
	
	// 입고 페이지 이동
	@RequestMapping("storage_ma_inquiry_wa.do")
	public String ma_inquiry_wa() {
		return "storage/ma_inquiry_wa";
	}
	
	// 입고 페이지 -> 등록버튼 이벤트 처리
	@RequestMapping("storage_ma_inquiry_wa_register.do")
	public String ma_inquiry_wa_register() {
		// 데이터 처리 필요
		return "redirect:storage_ma_inquiry_wa.do";
	}
	
	/*        입고 관리 종료        */
	
	
	/*        출고 관리 시작        */
	
	// 출고 등록 페이지 이동
	@RequestMapping("storage_ma_inquiry_re.do")
	public String ma_inquiry_re() {
		return "storage/ma_inquiry_re";
	}
	
	// 출고 페이지 -> 등록버튼 이벤트 처리
	@RequestMapping("storage_ma_inquiry_re_register.do")
	public String ma_inquiry_re_register() {
		// 데이터 처리 필요
		return "redirect:storage_ma_inquiry_re.do";
	}
	
	/*        출고 관리 종료        */
}
