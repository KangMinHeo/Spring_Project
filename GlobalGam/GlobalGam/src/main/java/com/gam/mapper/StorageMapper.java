package com.gam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gam.dto.StorageDTO;

@Mapper
public interface StorageMapper {

	List<StorageDTO> selectAllSto();

	List<StorageDTO> selectAllSto2();

	StorageDTO selectStoDetail(String st_no);

	StorageDTO selectStoDetail2(String st_no);

	int deleteSto(String st_no);

	int deleteSto2(String st_no);

}
