package org.diary.moon.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	MemberDTO login(Map<String, String> map);

	List<MemberDTO> selectOne();

	int selectAllMember(String id);

	int selectNameMember(String nick_name);

	int insertMember(MemberDTO dto);

	int deleteMember(String id);

	MemberDTO selectMember(String id);

	int updateMember(MemberDTO memberDTO);

	MemberDTO find_id(MemberDTO memberDTO);

	MemberDTO find_pass(MemberDTO memberDTO);
	
}
