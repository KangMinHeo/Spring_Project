package com.gam.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.gam.dto.EmployeeDTO;
import com.gam.mapper.EmployeeMapper;

@Service
public class EmployeeService {
	
	private EmployeeMapper mapper;

	public EmployeeService(EmployeeMapper mapper) {
		this.mapper = mapper;
	}

	public List<EmployeeDTO> getAllEmpList() {
		return mapper.getAllEmpList();
	}

	public EmployeeDTO login(String id, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return mapper.login(map);
	}

	public int insertEmployee(EmployeeDTO dto) {
		return mapper.insertEmployee(dto);
	}

	public EmployeeDTO selectEmployee(int e_no) {
		return mapper.selectEmployee(e_no);
	}

	public int deleteEmployee(int e_no) {
		// TODO Auto-generated method stub
		return mapper.deleteEmployee(e_no);
	}

	public int updateEmployee(EmployeeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.updateEmployee(dto);
	}
	
}
