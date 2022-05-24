package org.diary.moon.service;

import java.util.List;
import java.util.Map;

import org.diary.moon.dto.CommentDTO;
import org.diary.moon.mapper.CommentMapper;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	private CommentMapper mapper;
	
	
	public CommentService(CommentMapper mapper) {
		this.mapper = mapper;
	}

	public List<CommentDTO> selectCommentList(String b_writer) {
		return mapper.selectCommentList(b_writer);
	}

	public int addComment(CommentDTO commentDTO) {
		return mapper.addComment(commentDTO);
	}

	public List<CommentDTO> selectComment(int c_bno) {
		return mapper.selectComment(c_bno);
	}

	public List<CommentDTO> selectAllCommentList(int bno) {
		return mapper.selectAllCommentList(bno);
	}

	public List<CommentDTO> selectPageComment(Map<String, Object> map) {
		return mapper.selectPageComment(map);
	}
	
}
