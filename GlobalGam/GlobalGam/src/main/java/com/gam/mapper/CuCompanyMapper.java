package com.gam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gam.dto.CuCompanyDTO;

@Mapper
public interface CuCompanyMapper {

	int updateCuEtc(Map<String, String> cuMap);

	List<CuCompanyDTO> selectAllCustomer();

	CuCompanyDTO selectCustomer(String no);

	int deleteCompany(String businessnum);

	int updateCompany(CuCompanyDTO dto);

	int insertCompany(CuCompanyDTO dto);
}
