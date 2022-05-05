package com.gam.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gam.dto.CoCompanyDTO;
import com.gam.dto.MeterialDTO;
import com.gam.dto.RequestDTO;

@Mapper
public interface CoCompanyMapper {

	List<CoCompanyDTO> selectCompany();

	CoCompanyDTO selectCompanyDetail(String no);

	int updateCompany(CoCompanyDTO dto);

	int deleteCompany(String co_no);

	int insertCompany(CoCompanyDTO dto);

	List<MeterialDTO> selectAllMeterial();

	MeterialDTO selectMeterialDetail(String m_no);

	int updateMeterial(MeterialDTO dto);

	int deleteMeterial(String m_no);

	int insertMeterial(MeterialDTO dto);

	List<RequestDTO> selectAllRequest();

	RequestDTO selectRequestDetail(String r_no);

	RequestDTO selectRequestDetail2(String r_no);

	int updateRequest1(String r_no,String e_no);

	int updateRequest2(String r_no, String r_de_count);

	int insertRequest(RequestDTO requestDTO);

	String selectRequestNo();

	int insertRequest2(RequestDTO requestDTO);

	int deleteRequest(String r_no);

	int deleteRequest2(String r_no);

	List<MeterialDTO> selectMeterial(String co_no);

	ArrayList<RequestDTO> selectMaList(String searchKey);

}
