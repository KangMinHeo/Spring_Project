package com.gam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gam.dto.ForwardDTO;
import com.gam.dto.StorageDTO;

@Mapper
public interface ForwardMapper {

	List<ForwardDTO> selectAllFor();

	ForwardDTO selectForward(int f_no);

	int updateFor(Map<String, Integer> map);

	int updateStorage(Map<Object, Object> map);


}
