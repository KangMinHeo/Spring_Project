package org.diary.moon.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.BookDTO;

@Mapper
public interface BookMapper {

	int insertBook(BookDTO book);

	BookDTO selectBnoBook(int bno);

	void deleteBook(BookDTO checkDto);
	
}
