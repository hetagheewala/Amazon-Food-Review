<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Foogle</title>
<style>

h1 {
	color: #008000;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 50px;
	font-weight: bold;
	letter-spacing: -1px;
	line-height: 1;
	text-align: center;
	margin-top: 80px;
}

h2 {
	color: #4885ed;
	font-family: 'sans-serif';
	font-size: 40px;
	font-weight: normal;
	font-weight: normal;
	text-align: center;
}

.textbox {
	margin-top: 10px;
	margin-left: 470px;
	height: 35px !important;
	width: 600px !important;
	font-size: 14px !important;
}

.searchBox {
margin-top: 120px;
}
.submitButton {
	margin-left: 680px;
	margin-top: 40px;
	border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
}

.quitButton {
	margin-left: 850px;
	margin-top: -60px;
	border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
}
</style>
</head>
<body>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>

	<c:url value="/showReview" var="showURL"></c:url>

	<h1>The Ultimate Food Search</h1>

	<%-- Search for review --%>

	<form action='<c:out value="${showURL}"></c:out>' method="post">
		<div class="searchBox">
			<h2>FOOGLE</h2>
			<input type="text" name="reviewSearch" class="textbox"
				placeholder=" Search by typing any food product value"> <br />
			<input type="submit" class="submitButton" value="Review Search">
			</div>
	</form>

	<c:if test="${not empty requestScope.reviews}">
		<table>
			<tbody>
				<tr>
					<th>Summary</th>
					<th>Text</th>
				</tr>
				<c:forEach items="${requestScope.reviews}" var="review">
					<tr>
						<td><c:out value="${review.getSummary()}"></c:out></td>
						<td><c:out value="${review.getText()}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>



</body>
</html>