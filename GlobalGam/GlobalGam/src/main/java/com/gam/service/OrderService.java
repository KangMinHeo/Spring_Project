package com.gam.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gam.dto.CuCompanyDTO;
import com.gam.dto.MyCompanyDTO;
import com.gam.dto.OrderDTO;
import com.gam.dto.ProductDTO;
import com.gam.mapper.OrderMapper;
import com.gam.vo.OrderListViewVO;

@Service
public class OrderService {
	private OrderMapper mapper;

	public OrderService(OrderMapper mapper) {
		this.mapper = mapper;
	}

	public ArrayList<OrderListViewVO> orderList() {
		return mapper.orderList();
	}

	public ArrayList<OrderListViewVO> orderKeyList(String searchKey) {
		return mapper.orderKeyList(searchKey);
	}

	public CuCompanyDTO selectOrderCu(String cuNo) {
		return mapper.selectOrderCu(cuNo);
	}

	public List<OrderDTO> selectOrderDetail(String s_no) {
		return mapper.selectOrderDetail(s_no);
	}

	public ProductDTO selectOrderProduct(String proNo) {
		return mapper.selectOrderProduct(proNo);
	}

	public Integer selectProductStock(String proNo) {
		return mapper.selectProductStock(proNo);
	}

	public int updateEndDay(Map<String, String> orderMap) {
		return mapper.updateEndDay(orderMap);
	}

	public int updateODquantity(Map<String, Object> oDetailMap) {
		return mapper.updateODquantity(oDetailMap);
	}

	public List<ProductDTO> selectAllPro() {
		return mapper.selectAllPro();
	}

	public int insertProduct(ProductDTO productDTO) {
		return mapper.insertProduct(productDTO);
	}

	public ProductDTO selectProductDetail(String p_no) {
		return mapper.selectProductDetail(p_no);
	}

	public int deleteProduct(String p_no) {
		return mapper.deleteProduct(p_no);
	}

	public int updateProduct(ProductDTO productDTO) {
		return mapper.updateProduct(productDTO);
	}

	public MyCompanyDTO selectOurCom() {
		return mapper.selectOurCom();
	}

	public int updateMyCompany(MyCompanyDTO dto) {
		return mapper.updateMyCompany(dto);
	}
}
