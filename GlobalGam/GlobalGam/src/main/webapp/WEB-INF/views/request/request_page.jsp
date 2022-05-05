<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>발주서</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/resources/css/request_page.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn_print").click(function(){
		$(this).css('visibility','hidden');
		window.print();
	});
});
</script>
<body>
    <h2>
        <span>발</span>
        <span>주</span>
        <span>서</span>
    </h2>
    <p>발&nbsp;&nbsp;주&nbsp;&nbsp;일&nbsp;: ${requestScope.w_date[0] }</p>
    <p>납품요청일&nbsp;: ${requestScope.e_date[0] }</p>

    <table class="request_table">
        <caption>(단위:개, 원)</caption>
        <tr>
            <th>NO</th>
            <th>제품명</th>
            <th>단가</th>
            <th>수량</th>
            <th>공급가액</th>
            <th>부가세</th>
        </tr>
        <%int i = 1; %>
			<tr>
				<td><%=i++ %></td>
				<td>${requestScope.dto2.m_name }</td>
				<td>${requestScope.dto2.m_price }</td>
				<td>${requestScope.dto2.r_de_count }</td>
				<td class="sum_price">${requestScope.dto2.m_price * requestScope.dto2.r_de_count}</td>
				<td class="vat">${(requestScope.dto2.m_price * 0.1) *requestScope.dto2.r_de_count }</td>
			</tr>
        <tr>
            <td colspan="5">합계</td>
            <td class="total_sum">${((requestScope.dto2.m_price * 0.1) *requestScope.dto2.r_de_count)+requestScope.dto2.m_price * requestScope.dto2.r_de_count }</td>
        </tr>
    </table>

    <p>상기와 같이 제품을 발주합니다.</p>

    <p class="request_date">${requestScope.w_date[0] }</p>

    <p class="co_name">업체명: ${requestScope.dto.co_name }</p>
    <p class="co_em_name">담당 : ${requestScope.dto.e_name }<span class="sign">(인)</span></p>
    <button id="btn_print">인쇄</button>
</body>
</html>