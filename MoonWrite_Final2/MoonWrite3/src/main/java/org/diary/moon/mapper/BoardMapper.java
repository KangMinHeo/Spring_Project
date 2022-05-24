package org.diary.moon.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.BoardDTO;

@Mapper
public interface BoardMapper {

	int selectBoardCount();

	List<BoardDTO> selectPageBoard(int pageNo);

	List<BoardDTO> selectKind(Map<String, Object> map);

	int selectKindBoardCount(String kind);

	int selectKeywordBoardCount(String keyword);

	List<BoardDTO> selectKeyword(Map<String, Object> map);

	BoardDTO selectBoard(int bno);

	int selectBoardLikeCount(int bno);

	int insertBoardLike(Map<String, Object> map);

	void deleteBoardLike(Map<String, Object> map);

	int selectUserLikeTrue(Map<String, Object> map);

	int insertBoard(BoardDTO dto);

	int selectAllCount(String b_writer);

	List<BoardDTO> selectList(String b_writer);

	void addCount(int bno);

	int deleteBoard(int bno);

	int updateBoard(BoardDTO dto);

	int selectFindAllColums(BoardDTO dto);

	List<BoardDTO> selectMyList(Map<String, Object> map);

}
