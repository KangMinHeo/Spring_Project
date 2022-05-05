package com.gam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gam.dto.StorageDTO;
import com.gam.mapper.StorageMapper;

@Service
public class StorageService {

	private StorageMapper mapper;
	
	public StorageService(StorageMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public List<StorageDTO> selectAllSto() {
		return mapper.selectAllSto();
	}

	public List<StorageDTO> selectAllSto2() {
		return mapper.selectAllSto2();
	}

	public StorageDTO selectStoDetail(String st_no) {
		return mapper.selectStoDetail(st_no);
	}

	public StorageDTO selectStoDetail2(String st_no) {
		return mapper.selectStoDetail2(st_no);
	}

	public int deleteSto(String st_no) {
		return mapper.deleteSto(st_no);
	}

	public int deleteSto2(String st_no) {
		return mapper.deleteSto2(st_no);
	}

}
