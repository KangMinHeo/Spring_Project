package org.diary.moon.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.CommentDTO;

@Mapper
public interface CommentMapper {

	List<CommentDTO> selectCommentList(String b_writer);

	int addComment(CommentDTO commentDTO);

	List<CommentDTO> selectComment(int c_bno);

	List<CommentDTO> selectAllCommentList(int bno);

	List<CommentDTO> selectPageComment(Map<String, Object> map);
	
}
