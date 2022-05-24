package org.diary.moon.dto;

import org.apache.ibatis.type.Alias;

@Alias("book")
public class BookDTO {
	
	private String title;
	private String author;
	private String publisher;
	private int price;
	private String image;
	private String isbn;
	
	private int bno;
	
	private String link;
	private String description;

	
	public BookDTO() {	}
	//boardWrite 에서 insert 할 때 사용하는 생성자
	public BookDTO(int bno, String isbn, String title, String image, int price, String publisher, String author) {
		this.bno = bno;
		this.isbn = isbn;
		this.title = title;
		this.image = image;
		this.price = price;
		this.publisher = publisher;
		this.author = author;
	}
	
	//언젠가 써먹을 생성자
	public BookDTO(String title, String author, String publisher, int price, String image, String isbn) {
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.image = image;
		this.isbn = isbn;
	}
	
	//검색 api 에서 return 하는 생성자 -- bno빼고 다 받는 생성자
	public BookDTO(String title, String author, String publisher, int price, String image, String isbn,
			String link, String description) {
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.image = image;
		this.isbn = isbn;
		this.link = link;
		this.description = description;
	}
	
	//몽땅 다 받는 생성자
	public BookDTO(String title, String author, String publisher, int price, String image, String isbn, int bno,
			String link, String description) {
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.image = image;
		this.isbn = isbn;
		this.bno = bno;
		this.link = link;
		this.description = description;
	}
	
	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "BookDTO [title=" + title + ", author=" + author + ", publisher=" + publisher + ", price=" + price
				+ ", image=" + image + ", isbn=" + isbn + ", bno=" + bno + ", link=" + link + ", description="
				+ description + "]";
	}

	
}
	
	
	
	