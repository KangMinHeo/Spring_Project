package org.diary.moon.service;

import java.util.List;
import java.util.Map;

import org.diary.moon.dto.MemberDTO;
import org.diary.moon.mapper.MemberMapper;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}

	public MemberDTO login(Map<String, String> map) {
		return mapper.login(map);
	}

	public List<MemberDTO> selectOne() {
		return mapper.selectOne();
	}

	public int selectAllMember(String id) {
		return mapper.selectAllMember(id);
	}

	public int selectNameMember(String nick_name) {
		return mapper.selectNameMember(nick_name);
	}

	public int insertMember(MemberDTO dto) {
		return mapper.insertMember(dto);
	}

	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}

	public MemberDTO selectMember(String id) {
		return mapper.selectMember(id);
	}

	public int updateMember(MemberDTO memberDTO) {
		return mapper.updateMember(memberDTO);
	}

	public MemberDTO find_id(MemberDTO memberDTO) {
		return mapper.find_id(memberDTO);
	}

	public MemberDTO find_pass(MemberDTO memberDTO) {
		return mapper.find_pass(memberDTO);
	}
	
	
}
