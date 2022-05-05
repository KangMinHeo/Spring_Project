package com.gam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gam.dto.CuCompanyDTO;
import com.gam.dto.MyCompanyDTO;
import com.gam.dto.OrderDTO;
import com.gam.dto.ProductDTO;
import com.gam.service.CuCompanyService;
import com.gam.service.OrderService;
import com.gam.vo.GlobalGamCompanyVO;
import com.gam.vo.OrderDetailVO;
import com.gam.vo.OrderListViewVO;

@Controller
public class OrderMainController {
	private OrderService oService;
	private CuCompanyService cuService;

	public OrderMainController(OrderService oService, CuCompanyService cuService) {
		this.oService = oService;
		this.cuService = cuService;
	}

	@Autowired
	HttpServletRequest request;
	
	//수주 메인 화면으로 이동
	@RequestMapping("order_main.do")
	public String orderMain() {
		return "order/order_main";
	}
	
	//수주목록 화면으로 이동
	@RequestMapping("order_pr_or_check.do")
	public String orderPrOrCheck() {
		return "order/pr_or_check";
	}

	//수주 목록 페이지에서 목록 불러오는 Ajax 코드
	@RequestMapping("pr_or_list.do")
	public String prOrListAjax(String searchKey, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");

		ArrayList<OrderListViewVO> list;
		
		//전체 수주 목록 불러오기
		if(searchKey==null || searchKey.isBlank()) {
			list = oService.orderList();			
		} else {
			//검색을 했을 경우
			list = oService.orderKeyList(searchKey);	
		}
		
		JSONArray jArr = new JSONArray(list);
		response.getWriter().write(jArr.toString());
					
		return null;
	}
	
	//수주 상세 정보 보기 페이지로 이동
	@RequestMapping("pr_or_check_mod.do")
	public String orderPrOrCheckMod(String s_no) {
		
		// 1) 수주+수주디테일 조회 (1건이상일 때를 대비해 List 로 리턴 받기)
		List<OrderDTO> orderDto = oService.selectOrderDetail(s_no);
		
		//2) orderDto가 가진 cuNo (고객사 번호) 를 이용 해 고객사 정보 조회하기
		String cuNo = orderDto.get(0).getOderCuNo();
		CuCompanyDTO cuDto = oService.selectOrderCu(cuNo);
		
		
		// 3) 수주받은 완제품 정보 불러오기
		//			+ 창고테이블에서 완제품 재고도 같이 조회
		// 수주 번호가 같아도, 제품은 다르기 때문에 Loop돌면서 정보 빼오기
		List<ProductDTO> productList = new ArrayList<ProductDTO>() ;
		List<Integer> proStockList = new ArrayList<Integer>();
		List<OrderDetailVO> orderProInfo = new ArrayList<OrderDetailVO>();
		
		String proNo=null;
		
		for (int i = 0; i < orderDto.size(); i++) {
			//날짜 시간부분 자르기
			String regDay =  orderDto.get(i).getOrderRegDate().split(" ")[0].trim();
			String endDay = orderDto.get(i).getOrderEndDate().split(" ")[0].trim();

			orderDto.get(i).setOrderRegDate(regDay);
			orderDto.get(i).setOrderEndDate(endDay);
			
			//완제품 Spec 불러오기 
			proNo = orderDto.get(i).getOrderPno();			
			ProductDTO proDto = oService.selectOrderProduct(proNo);
			productList.add(proDto);
			
			Integer proStock = oService.selectProductStock(proNo);		
			proStockList.add(proStock);
			
			//수주+완제품+재고량 1개 레코드로 묶기
			orderProInfo.add(
					new OrderDetailVO(
							proDto.getProductNo(), 
							proDto.getpName(), proDto.getpSize(),
							orderDto.get(i).getOrderCount(), proDto.getpPrice(), (int)proStock));
		}
		

		/* 4) JSP 표시 형식 (디자인) 에 맞게 데이터 잘라서 넘겨주기
		연락처(-), fax번호(-), 담당자 연락처(-), 담당자 이메일(@), 주소(/기준), 날짜(시간부분자르기)	*/
				
			//4-1) 짤라서 셋팅
		String[]cuTel = cuDto.getCuTel().split("-");
		String[]cuFax = cuDto.getCuFax().split("-");
		String[]cuEmpTel = cuDto.getCuEmpTel().split("-");
		String[]cuEmpEmail = cuDto.getCuEmail().split("@");
		String[]cuAddr = cuDto.getCuAddr().split("\\/");
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("tel", cuTel);
		map.put("fax", cuFax);
		map.put("empTel", cuEmpTel);
		map.put("email", cuEmpEmail);
		map.put("addr", cuAddr);
		
	
		//4-2) 셋팅
	request.setAttribute("order", orderDto); //jsp 에서는 배열처럼 접근하기!!
	request.setAttribute("proInfo", orderProInfo);
	
	request.setAttribute("cuDto", cuDto);
	request.setAttribute("map", map);
		
		
		return "order/pr_or_check_mod";
	}
	
	//수정버튼을 눌렀을 때
	@RequestMapping("pr_or_update.do")
	public String prOrUpdate(String endDay,  String cuEtc, int quantity,
			String orderNo, String cuNo, String proNo, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		//1) 수주 테이블에 날짜 수정 - 수주번호 필요
		Map<String, String> orderMap = new HashMap<String, String>();
		orderMap.put("endDay", endDay);
		orderMap.put("orderNo", orderNo);
		
		int orderCheck = oService.updateEndDay(orderMap);
		if(orderCheck<=0) {
			response.getWriter().write("<script>alert('수정실패!! 관리자에게 문의하세요');history.back();</script>");
			return null;
		}
		
		// 2) 고객사 테이블 기타  수정 - 고객사 번호 필요
		Map<String, String> cuMap = new HashMap<String, String>();
		cuMap.put("etc", cuEtc);
		cuMap.put("cuNo", cuNo);
		
		int cuCheck = cuService.updateCuEtc(cuMap);
		if(cuCheck<=0) {
			response.getWriter().write("<script>alert('수정실패!! 관리자에게 문의하세요');history.back();</script>");
			return null;
		}
		
		
		// 3) 수주 디테일 테이블 수주수량 필요 - 수주번호, 제품번호 필요
		Map<String, Object> oDetailMap = new HashMap<String, Object>();
		oDetailMap.put("qua", quantity);
		oDetailMap.put("orderNo", orderNo);
		oDetailMap.put("proNo", proNo);
		
		int oDetailCheck = oService.updateODquantity(oDetailMap);
		if(oDetailCheck<=0) {
			response.getWriter().write("<script>alert('수정실패!! 관리자에게 문의하세요');history.back();</script>");
			return null;
		}
		
		return "redirect:order_pr_or_check.do";
	}
	/* 완제품 관리 - 시작*/
	
	// 완제품 목록 페이지
	@RequestMapping("order_info_product.do")
	public String info_product(HttpServletRequest request) {
		List<ProductDTO> list = oService.selectAllPro();
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		request.setAttribute("list", list);
		request.setAttribute("list_size", list.size());
		
		return "order/info_product";
	}
	
	// 완제품 상세 페이지 이동
	@RequestMapping("order_info_pd_mod.do")
	public String pd_mod(HttpServletRequest request, String p_no, HttpServletResponse response) throws IOException {
		ProductDTO dto = oService.selectProductDetail(p_no);
		if(dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
			return null;
		}
		request.setAttribute("dto", dto);
		return "order/info_pd_mod";
	}
	
	// 완제품 상세 페이지 수정 버튼 처리
	@RequestMapping("order_info_product_update.do")
	public String info_product_update(String p_no, String p_name, String p_size, String p_price, String p_count, String p_date, HttpServletResponse response) throws IOException {
		double p_size2 = Double.parseDouble(p_size);
		int p_price2 = Integer.parseInt(p_price);
		
		int result = oService.updateProduct(new ProductDTO(p_no, p_name, p_size2, p_price2, p_count, p_date));
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
			return null;
		}
		
		return "redirect:order_info_product.do";
	}
			
	// 완제품 상세 페이지 삭제 버튼 처리
	@RequestMapping("order_info_product_delete.do")
	public String info_product_delete(String p_no, HttpServletResponse response) throws IOException {
		int result = oService.deleteProduct(p_no);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
			return null;
		}
		return "redirect:order_info_product.do";
	}
	
	// 완제품 목록 페이지 -> 등록버튼 처리
	@RequestMapping("order_info_product_reg.do")
	public String info_product_reg() {
		return "order/info_pd_reg";
	}
	
	// 완제품 등록 페이지 -> 등록버튼 처리
	@RequestMapping("order_info_product_insert.do")
	public String info_pd_insert(HttpServletResponse response, String p_no, String p_name, String p_size, String p_count, String p_price, String p_date) throws IOException {
		double p_size2 = Double.parseDouble(p_size);
		int p_price2 = Integer.parseInt(p_price);
		
		int result = oService.insertProduct(new ProductDTO(p_no, p_name, p_size2, p_price2, p_count, p_date));
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 정보');history.back();</script>");
			return null;
		}
		return "redirect:order_info_product.do";
	}
	/* 완제품 관리 - 종료*/	
	
	// 고객사 목록 페이지
		@RequestMapping("order_info_customer.do") // 이동할 이름 매칭 시켜주기 ==> localhost:32769/~~~~~~~~.do
		public String info_customer(HttpServletRequest request) { // 함수명은 본인이 편한거로 넣으시면 됩니다.
			
			// 데이터 처리 -> 고객사 테이블에서 값들을 뽑아온다.
			List<CuCompanyDTO> list = cuService.selectAllCustomer(); // 고객사 테이블에 있는 모든 정보를 dto타입으로 받아서 List로 만든다
			request.setAttribute("list", list); // list라는 이름으로 list 변수를 저장해서 order/info_customer에 값을 전달한다.
			return "order/info_customer";
		}
		
		//상세 넘어가는거??
		@RequestMapping("order_info_customer_mod.do")
		public String info_order_mod(HttpServletRequest request) {
			String no = request.getParameter("s_no");
			CuCompanyDTO dto = cuService.selectCustomer(no);
			request.setAttribute("dto", dto);
			
			String[] tel = dto.getCuTel().split("-"); 
			request.setAttribute("tel", tel);
			for(int i = 0; i<tel.length; i++) {
				System.out.println(tel[i].toString());
			}
			
			String[] fax = dto.getCuFax().split("-");
			request.setAttribute("fax", fax);
			
			String[] add = dto.getCuAddr().split("/");
			request.setAttribute("add", add);
			
			String[] em_tel = dto.getCuEmpTel().split("-");
			request.setAttribute("em_tel", em_tel);
			
			String[] email = dto.getCuEmail().split("@");
			request.setAttribute("email", email);
			return "order/info_customer_mod";
		}
		
		// 고객사 목록 페이지 -> 등록버튼 페이지 이동
		@RequestMapping("order_info_customer_reg.do")
		public String info_customer_reg() {
			return "order/info_customer_reg";
		}
		//수주관리 -> 수주등록 페이지에서 등록 버튼을 눌렀을 때 처리 이벤트
		@RequestMapping("order_info_customer_register.do")
		public String info_customer_save(HttpServletResponse response, String businessnum,
				String c_name, String user_name, String tel1, String fax1, String address,
				String cu_manager, String cu_ma_tel1, String cu_ma_email1, String cu_etc) throws IOException {
			//데이터 처리필요
			CuCompanyDTO dto = new CuCompanyDTO(businessnum, c_name, user_name, tel1, fax1, address,
				cu_manager, cu_ma_tel1, cu_ma_email1, cu_etc);
			System.out.println(dto.toString());
			int result = cuService.insertCompany(dto);
			if (result == 0) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alter('정보 추가에 실패했습니다.'); history.back();</script>");
				return null;
			}
			return "redirect:order_info_customer.do";
		}
		
		//고객사 수젱페이지 수정버튼 처리
		@RequestMapping("order_info_customer_update.do")
		public String info_customer_update(HttpServletResponse response, String businessnum, String c_name, String user_name, String tel1, String fax1, String address,
				String cu_manager, String cu_ma_tel1, String cu_ma_email1, String cu_etc) throws IOException {
		System.out.println(address);
		CuCompanyDTO dto = new CuCompanyDTO(businessnum, c_name, user_name, tel1, fax1, address,
				cu_manager, cu_ma_tel1, cu_ma_email1, cu_etc);
		System.out.println(dto.toString());
		int result = cuService.updateCompany(dto);
		if (result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('정보 수정에 실패했습니다.'); history.back();</script>");
			return null;
		}
		return "redirect:order_info_customer.do";
	   }
		
		//고객사 수정페이지 삭제버튼 처리
		@RequestMapping("order_info_customer_delete.do")
		public String info_customer_delete(String businessnum, HttpServletResponse response) throws IOException {
		//데이터 처리 필요
		System.out.println(businessnum);
		int result = cuService.deleteCompany(businessnum);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('정보 삭제에 실패했습니다.'); history.back();</script>");
			return null;
		}
		return "redirect:order_info_customer.do";
		}
		//고객사 관리 종료
	
	//내 기업 정보 보기
	@RequestMapping("order_info_company_reg.do")
	public String GlobalGamInfo(HttpServletResponse response) throws IOException {
		MyCompanyDTO dto = oService.selectOurCom();
		if(dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
			return null;
		}
		request.setAttribute("dto", dto);

		String[] tel = dto.getMc_tel().split("-");
		String[] fax = dto.getMc_fax().split("-");
		String[] etel = dto.getMc_em_tel().split("-");
		String[] email = dto.getMc_email().split("@");
		String[] add = dto.getMc_address().split("/");
		request.setAttribute("tel", tel);
		request.setAttribute("fax", fax);
		request.setAttribute("etel", etel);
		request.setAttribute("email", email);
		request.setAttribute("add", add);
		
		return "order/global_gam_info";
	}
	
	// 기업 정보 수정
	@RequestMapping("order_info_company_update.do")
	public String GlobalGamUpdate(HttpServletResponse response, String mc_no, String mc_name, String mc_ceo, String mc_tel, String mc_fax, String mc_em, String mc_em_tel, String mc_email, String mc_address, String mc_bank, String mc_bank_num, String mc_bank_name) throws IOException {
		MyCompanyDTO dto = new MyCompanyDTO(mc_no,mc_name, mc_ceo, mc_tel, mc_fax, mc_em, mc_em_tel, mc_email, mc_address, mc_bank, mc_bank_num, mc_bank_name);
		System.out.println(dto.toString());
		int result = oService.updateMyCompany(dto);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alter('잘못된 접근입니다.'); history.back();</script>");
			return null;
		}
			return "redirect:order_info_company_reg.do";
	}
	
}