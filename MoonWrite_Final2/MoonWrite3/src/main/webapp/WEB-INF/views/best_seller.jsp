<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Best</title>

<link rel="icon" href="resource/img/diary.png">

<!-- css Link -->
<link rel="stylesheet" href="resource/css/menuBar.css">
<link rel="stylesheet" href="resource/css/best_seller.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<!-- session 정보 체크 / menuBar  -->
	<%@ include file="../include/sessionCheck.jsp"%>
	<%@ include file="../include/menuBar.jsp"%>
	
	<div class="content">
        <h1>금주의 Best Seller</h1>
       <div class="container">
       
            <div class="book">
            
                <div class="book_commend">
                    <img src="${bestSeller.get(0).image}" alt="${bestSeller.get(0).title}" onclick="window.open('${bestSeller.get(0).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(0).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(0).title}</p>
                     <p>저자: ${bestSeller.get(0).author}</p>
                </div>
                 <div class="book_commend">
                    <img src="${bestSeller.get(1).image}" alt="${bestSeller.get(1).title}" onclick="window.open('${bestSeller.get(1).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(1).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(1).title}</p>
                     <p>저자: ${bestSeller.get(1).author}</p>
                </div>
                  <div class="book_commend">
                    <img src="${bestSeller.get(2).image}" alt="${bestSeller.get(2).title}" onclick="window.open('${bestSeller.get(2).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')"> 
                    <p onclick="window.open('${bestSeller.get(2).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(2).title}</p>
                     <p>저자: ${bestSeller.get(2).author}</p>
                </div>
                   <div class="book_commend">
                    <img src="${bestSeller.get(3).image}" alt="${bestSeller.get(3).title}" onclick="window.open('${bestSeller.get(3).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(3).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(3).title}</p>
                     <p>저자: ${bestSeller.get(3).author}</p>
                </div>
                 <div class="book_commend">
                    <img src="${bestSeller.get(4).image}" alt="${bestSeller.get(4).title}" onclick="window.open('${bestSeller.get(4).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(4).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(4).title}</p>
                     <p>저자: ${bestSeller.get(4).author}</p>
                </div>
            
            </div>
            
            
            <div class="book">
            
                <div class="book_commend">
                    <img src="${bestSeller.get(5).image}" alt="${bestSeller.get(5).title}" onclick="window.open('${bestSeller.get(5).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(5).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(5).title}</p>
                     <p>저자: ${bestSeller.get(5).author}</p>
                </div>
                   <div class="book_commend">
                    <img src="${bestSeller.get(6).image}" alt="${bestSeller.get(6).title}" onclick="window.open('${bestSeller.get(6).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(6).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(6).title}</p>
                     <p>저자: ${bestSeller.get(6).author}</p>
                </div>
                   <div class="book_commend">
                    <img src="${bestSeller.get(7).image}" alt="${bestSeller.get(7).title}" onclick="window.open('${bestSeller.get(7).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(7).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(7).title}</p>
                     <p>저자: ${bestSeller.get(7).author}</p>
                </div>
                 <div class="book_commend">
                    <img src="${bestSeller.get(8).image}" alt="${bestSeller.get(8).title}" onclick="window.open('${bestSeller.get(8).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')"> 
                    <p onclick="window.open('${bestSeller.get(8).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(8).title}</p>
                     <p>저자: ${bestSeller.get(8).author}</p>
                </div>
                 <div class="book_commend">
                    <img src="${bestSeller.get(9).image}" alt="${bestSeller.get(9).title}" onclick="window.open('${bestSeller.get(9).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(9).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(9).title}</p>
                     <p>저자: ${bestSeller.get(9).author}</p>
                </div>
                
            </div>
            
            <div class="book">
            
              <div class="book_commend">
                    <img src="${bestSeller.get(10).image}" alt="${bestSeller.get(10).title}" onclick="window.open('${bestSeller.get(10).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(10).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(10).title}</p>
                     <p>저자: ${bestSeller.get(10).author}</p>
                </div>
                 <div class="book_commend">
                    <img src="${bestSeller.get(11).image}" alt="${bestSeller.get(11).title}" onclick="window.open('${bestSeller.get(11).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(11).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(11).title}</p>
                     <p>저자: ${bestSeller.get(11).author}</p>
                </div>
                   <div class="book_commend">
                    <img src="${bestSeller.get(12).image}" alt="${bestSeller.get(12).title}" onclick="window.open('${bestSeller.get(12).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(12).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(12).title}</p>
                     <p>저자: ${bestSeller.get(12).author}</p>
                </div>
                 <div class="book_commend">
                    <img src="${bestSeller.get(13).image}" alt="${bestSeller.get(13).title}" onclick="window.open('${bestSeller.get(13).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(13).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(13).title}</p>
                     <p>저자: ${bestSeller.get(13).author}</p>
                </div>
                   <div class="book_commend">
                    <img src="${bestSeller.get(14).image}" alt="${bestSeller.get(14).title}" onclick="window.open('${bestSeller.get(14).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    <p onclick="window.open('${bestSeller.get(14).link}', 'width=700', 'height=850', 'top=100', 'left=200' ,'scrollbars=yes')">
                    ${bestSeller.get(14).title}</p>
                     <p>저자: ${bestSeller.get(14).author}</p>
                </div>
                
            </div>
            
            
        </div> <!-- container 끝 -->
    </div>	<!-- content 끝 -->
</body>
</html>