package com.gam.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.gam.dto.CoCompanyDTO;
import com.gam.dto.MeterialDTO;
import com.gam.dto.RequestDTO;
import com.gam.mapper.CoCompanyMapper;

@Service
public class CoCompanyService {
	private CoCompanyMapper mapper;

	public CoCompanyService(CoCompanyMapper mapper) {
		this.mapper = mapper;
	}

	public List<CoCompanyDTO> selectCompany() {
		return mapper.selectCompany();
	}

	public CoCompanyDTO selectCompanyDetail(String no) {
		return mapper.selectCompanyDetail(no);
	}

	public int updateCompany(CoCompanyDTO dto) {
		return mapper.updateCompany(dto);
	}

	public int deleteCompany(String co_no) {
		return mapper.deleteCompany(co_no);
	}

	public int insertCompany(CoCompanyDTO dto) {
		return mapper.insertCompany(dto);
	}

	public List<MeterialDTO> selectAllMeterial() {
		return mapper.selectAllMeterial();
	}

	public MeterialDTO selectMeterialDetail(String m_no) {
		return mapper.selectMeterialDetail(m_no);
	}

	public int updateMeterial(MeterialDTO dto) {
		return mapper.updateMeterial(dto);
	}

	public int deleteMeterial(String m_no) {
		return mapper.deleteMeterial(m_no);
	}

	public int insertMeterial(MeterialDTO dto) {
		return mapper.insertMeterial(dto);
	}

	public List<RequestDTO> selectAllRequest() {
		return mapper.selectAllRequest();
	}

	public RequestDTO selectRequesetDetail(String r_no) {
		return mapper.selectRequestDetail(r_no);
	}

	public RequestDTO selectRequesetDetail2(String r_no) {
		return mapper.selectRequestDetail2(r_no);
	}

	public int updateRequest1(String r_no, String e_no) {
		return mapper.updateRequest1(r_no, e_no);
	}

	public int updateRequest2(String r_no, String r_de_count) {
		return mapper.updateRequest2(r_no, r_de_count);
	}

	public String selectRequestNo() {
		return mapper.selectRequestNo();
	}
	
	public int insertRequest(RequestDTO requestDTO) {
		return mapper.insertRequest(requestDTO);
	}

	public int insertRequest2(RequestDTO requestDTO) {
		return mapper.insertRequest2(requestDTO);
	}

	public int deleteRequest(String r_no) {
		return mapper.deleteRequest(r_no);
	}

	public int deleteRequest2(String r_no) {
		return mapper.deleteRequest2(r_no);
	}

	public List<MeterialDTO> selectMeterial(String co_no) {
		return mapper.selectMeterial(co_no);
	}

	public ArrayList<RequestDTO> selectMaList(String searchKey) {
		return mapper.selectMaList(searchKey);
	}
	
	
}
