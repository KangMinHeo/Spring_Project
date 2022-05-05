package com.gam.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gam.dto.CuCompanyDTO;
import com.gam.mapper.CuCompanyMapper;

@Service
public class CuCompanyService {
	
	CuCompanyMapper mapper;

	public CuCompanyService(CuCompanyMapper mapper) {
		this.mapper = mapper;
	}

	public int updateCuEtc(Map<String, String> cuMap) {
		return mapper.updateCuEtc(cuMap);
	}
	public List<CuCompanyDTO> selectAllCustomer() {
		return mapper.selectAllCustomer();
		
	}

	public CuCompanyDTO selectCustomer(String no) {
		return mapper.selectCustomer(no);
	}

	public int deleteCompany(String businessnum) {
		return mapper.deleteCompany(businessnum);
	}

	public int updateCompany(CuCompanyDTO dto) {
		return mapper.updateCompany(dto);
	}

	public int insertCompany(CuCompanyDTO dto) {
		return mapper.insertCompany(dto);
	}
}
