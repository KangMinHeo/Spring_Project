package com.gam;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gam.dto.MeterialDTO;
import com.gam.dto.ProcessDTO;
import com.gam.dto.ProductDTO;
import com.gam.dto.RecipeDTO;
import com.gam.service.CoCompanyService;
import com.gam.service.ProcessService;

@Controller
public class ProcessMainController {

	private ProcessService proService;
	private CoCompanyService coService;
	
	public ProcessMainController(ProcessService proService, CoCompanyService coService) {
		super();
		this.proService = proService;
		this.coService = coService;
	}

	// 공정관리 메인 페이지 이동
	@RequestMapping("process_main.do")
	public String process_main() {
		return "process/main";
	}
	
	/*             공정 관리 시작                   */
	
	// 공정관리 페이지 이동
	@RequestMapping("process_info_route.do")
	public String info_route(HttpServletRequest request, HttpServletResponse response) throws IOException{
		List<ProcessDTO> list = proService.selectAllPro();
		if(list == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근');history.back();</script>");
		}
		request.setAttribute("list", list);
		return "process/info_route";
	}
	
	// 공정관리 페이지 -> 등록 버튼 페이지 이동
	@RequestMapping("process_info_route_reg.do")
	public String info_route_reg() {
		return "process/info_route_reg";
	}
	
	// 공정관리 등록 페이지 -> 등록 버튼 처리
	@RequestMapping("process_info_route_register.do")
	public String info_route_register(String pro_no, String pro_name, String pro_detail, HttpServletResponse response) throws IOException {
		// 데이터 처리 필요
		int result = proService.insertProcess(new ProcessDTO(pro_no, pro_name, pro_detail));
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
		}
		return "redirect:process_info_route.do";
	}
	
	// 공정관리 정보 수정 페이지 이동
	@RequestMapping("process_info_route_mod.do")
	public String info_route_mod(String pro_no, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ProcessDTO dto = proService.selectProcess(pro_no);
		
		if(dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
		}
		request.setAttribute("pro_dto", dto);
		return "process/info_route_mod";
	}
	
	// 공정관리 정보 수정 페이지 -> 수정버튼 처리
	@RequestMapping("process_info_route_update.do")
	public String info_route_update(String pro_no, String pro_name, String pro_detail, HttpServletResponse response) throws IOException {
		int result = proService.updateProcess(new ProcessDTO(pro_no, pro_name, pro_detail));
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
		}
		return "redirect:process_info_route.do";
	}
	
	// 공정관리 정보 수정 페이지 -> 삭제버튼 처리
		@RequestMapping("process_info_route_delete.do")
		public String info_route_delete(String pro_no, HttpServletResponse response) throws IOException {
			int result = proService.deleteProcess(pro_no);
			if(result == 0) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
			}
			return "redirect:process_info_route.do";
		}
	/*             공정 관리 종료                   */
	
	/*             통합레시피 관리 시작                   */
	
	// 통합레시피 메인 페이지 이동
	@RequestMapping("process_info_recipe.do")
	public String info_recipe(HttpServletRequest request ,HttpServletResponse response) throws IOException {
		List<RecipeDTO> list = proService.selectAllRec();
		if(list == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근');history.back();</script>");
		}
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		request.setAttribute("list", list);
		return "process/info_recipe";
	}
	
	// 레시피 등록 페이지 이동
	@RequestMapping("process_info_recipe_reg.do")
	public String info_recipe_reg() {
		return "process/info_recipe_reg";
	}

	// 통합레시피 -> 완제품 등록 팝업 이동
	@RequestMapping("process_popup_p.do")
	public String popup_p(HttpServletRequest request) {
		List<ProductDTO> mlist = proService.selectAllProduct();
		request.setAttribute("mlist", mlist);
		
		for(int i = 0; i<mlist.size(); i++) {
			System.out.println(mlist.get(i).toString());
		}
		return "process/popup_p";
	}
	
	// 통합레시피 -> 공정 등록 팝업 이동
	@RequestMapping("process_popup_pro.do")
	public String popup_pro(HttpServletRequest request) {
		List<ProcessDTO> mlist = proService.selectAllPro();
		request.setAttribute("mlist", mlist);
		return "process/popup_pro";
	}
	
	// 통합레시피 -> 원자재 등록 팝업 이동
	@RequestMapping("process_popup_met.do")
	public String popup_met(HttpServletRequest request) {
		List<MeterialDTO> mlist = coService.selectAllMeterial();
		request.setAttribute("mlist", mlist);
		return "process/popup_met";
	}
	
	// 통합레시피 -> 원자재2 등록 팝업 이동
	@RequestMapping("process_popup_met2.do")
	public String popup_met2(HttpServletRequest request) {
		List<MeterialDTO> mlist = coService.selectAllMeterial();
		request.setAttribute("mlist", mlist);
		return "process/popup_met2";
	}
	
	// 레시피 등록 페이지 -> 등록버튼 처리
	@RequestMapping("process_info_recipe_register.do")
	public String info_recipe_register(String re_no, String re_pro_1, String re_pro_2, String re_pro_3, String re_pro_4, String re_p_no, String re_m_number, String re_m_no, String re_m_no_2, HttpServletResponse response) throws IOException {
		int result = proService.insertRecipe(new RecipeDTO(re_no, re_pro_1, re_pro_2, re_pro_3, re_pro_4, re_p_no, re_m_number, re_m_no, re_m_no_2));
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근');history.back();</script>");
		}
		return "redirect:process_info_recipe.do";
	}
	
	// 레시피 수정 페이지 이동 처리
	@RequestMapping("process_info_recipe_mod.do")
	public String info_recipe_mod(String re_no,HttpServletRequest request, HttpServletResponse response) throws IOException {
		RecipeDTO dto = proService.selectRecipe(re_no); // 레시피코드, 공정명, 공정번호, 완제품 명, 완제품번호
		RecipeDTO dto1 = proService.selectRecipe1(re_no); // 원자재1 코드 , 원자재1 명
		RecipeDTO dto2 = proService.selectRecipe2(re_no); // 원자재2 코드, 원자재 2명
		List<ProcessDTO> list = proService.selectAllPro();  // 모든 공정 정보 호출
		
		if(dto == null && dto1 == null && dto2 == null && list == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근');history.back();</script>");
		}
		request.setAttribute("dto", dto);
		request.setAttribute("dto1", dto1);
		request.setAttribute("dto2", dto2);
		request.setAttribute("list", list);
		return "process/info_recipe_mod";
	}
	
	// 레시피 수정 페이지 -> 수정 버튼 처리
	@RequestMapping("process_info_recipe_update.do")
	public String info_recipe_update() {
		// 데이터 처리 필요
		return "redirect:process_info_recipe.do";
	}
	
	// 레시피 삭제 페이지 -> 삭제 버튼 처리
	@RequestMapping("process_info_recipe_delete.do")
	public String info_recipe_delete(String re_no, HttpServletResponse response) {
		// 데이터 처리 필요
		int result = proService.deleteRecipe(re_no);
		return "redirect:process_info_recipe.do";
	}
	/*             통합레시피 관리 종료                   */
}
