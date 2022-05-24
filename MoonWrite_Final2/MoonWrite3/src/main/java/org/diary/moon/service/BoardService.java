package org.diary.moon.service;

import java.util.List;
import java.util.Map;

import org.diary.moon.dto.BoardDTO;
import org.diary.moon.mapper.BoardMapper;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	private BoardMapper mapper;

	public BoardService(BoardMapper mapper) {
		this.mapper = mapper;
	}

	
	public int selectBoardCount() {
		return mapper.selectBoardCount();
	}

	public List<BoardDTO> selectPageBoard(int pageNo) {
		return mapper.selectPageBoard(pageNo);
	}

	public List<BoardDTO> selectKind(Map<String, Object> map) {
		return mapper.selectKind(map);
	}

	public int selectKindBoardCount(String kind) {
		return mapper.selectKindBoardCount(kind);
	}

	public int selectKeywordBoardCount(String keyword) {
		return mapper.selectKeywordBoardCount(keyword);
	}

	public List<BoardDTO> selectKeyword(Map<String, Object> map) {
		return mapper.selectKeyword(map);
	}

	public BoardDTO selectBoard(int bno) {
		return mapper.selectBoard(bno);
	}

	public int selectBoardLikeCount(int bno) {
		return mapper.selectBoardLikeCount(bno);
	}

	public int insertBoardLike(Map<String, Object> map) {
		return mapper.insertBoardLike(map);
	}

	public void deleteBoardLike(Map<String, Object> map) {
		mapper.deleteBoardLike(map);
	}

	public int selectUserLikeTrue(Map<String, Object> map) {
		return mapper.selectUserLikeTrue(map);
	}


	public int insertBoard(BoardDTO dto) {
		return mapper.insertBoard(dto);
	}

	public int selectAllCount(String b_writer) {
		return mapper.selectAllCount(b_writer);
	}

	public List<BoardDTO> selectList(String b_writer) {
		return mapper.selectList(b_writer);
	}


	public void addCount(int bno) {
		mapper.addCount(bno);
	}


	public int deleteBoard(int bno) {
		return mapper.deleteBoard(bno);
	}


	public int updateBoard(BoardDTO dto) {
		return mapper.updateBoard(dto);
	}


	public int selectFindAllColums(BoardDTO dto) {
		return mapper.selectFindAllColums(dto);
	}


	public List<BoardDTO> selectMyList(Map<String, Object> map) {
		return mapper.selectMyList(map);
	}



	
	

}
