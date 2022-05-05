package com.gam.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gam.dto.EmployeeDTO;

@Mapper
public interface EmployeeMapper {

	List<EmployeeDTO> getAllEmpList();

	EmployeeDTO login(HashMap<String, String> map);

	int insertEmployee(EmployeeDTO dto);

	EmployeeDTO selectEmployee(int e_no);
	
	int deleteEmployee(int e_no);

	int updateEmployee(EmployeeDTO dto);
}
