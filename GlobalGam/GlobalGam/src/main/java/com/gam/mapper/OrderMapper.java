package com.gam.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gam.dto.CuCompanyDTO;
import com.gam.dto.MyCompanyDTO;
import com.gam.dto.OrderDTO;
import com.gam.dto.ProductDTO;
import com.gam.vo.OrderListViewVO;

@Mapper
public interface OrderMapper {

	ArrayList<OrderListViewVO> orderList();

	ArrayList<OrderListViewVO> orderKeyList(String searchKey);

	CuCompanyDTO selectOrderCu(String cuNo);

	List<OrderDTO> selectOrderDetail(String s_no);

	ProductDTO selectOrderProduct(String proNo);

	Integer selectProductStock(String proNo);

	int updateEndDay(Map<String, String> orderMap);

	int updateODquantity(Map<String, Object> oDetailMap);

	List<ProductDTO> selectAllPro();

	int insertProduct(ProductDTO productDTO);

	ProductDTO selectProductDetail(String p_no);

	int deleteProduct(String p_no);

	int updateProduct(ProductDTO productDTO);

	MyCompanyDTO selectOurCom();

	int updateMyCompany(MyCompanyDTO dto);

}
