package com.gam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gam.dto.ForwardDTO;
import com.gam.dto.StorageDTO;
import com.gam.mapper.ForwardMapper;

@Service
public class ForwardService {
	private ForwardMapper mapper;

	public ForwardService(ForwardMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public List<ForwardDTO> selectAllFor() {
		return mapper.selectAllFor();
	}

	public ForwardDTO selectForward(int f_no) {
		return mapper.selectForward(f_no);
	}

	public int updateFor(int f_no, int s_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("f_no", f_no);
		map.put("s_no", s_no);
		return mapper.updateFor(map);
	}

	public int updateStorage(String p_no, int s_no) {
		Map<Object, Object> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("s_no", s_no);
		return mapper.updateStorage(map);
	}
	
}
