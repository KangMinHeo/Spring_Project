package org.diary.moon.service;

import org.diary.moon.dto.BookDTO;
import org.diary.moon.mapper.BookMapper;
import org.springframework.stereotype.Service;

@Service
public class BookService {
	BookMapper mapper;

	public BookService(BookMapper mapper) {
		this.mapper = mapper;
	}

	public int insertBook(BookDTO book) {
		return mapper.insertBook(book);
	}

	public BookDTO selectBnoBook(int bno) {
		return mapper.selectBnoBook(bno);
	}

	public void deleteBook(BookDTO checkDto) {
		mapper.deleteBook(checkDto);
	}
	
	
}
