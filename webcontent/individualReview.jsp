<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Foogle</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('p')
				.html(
						'<span class="stars">'
								+ parseFloat($('input[name=amount]').val())
								+ '</span>');
		$('span.stars').stars();
	});

	$.fn.stars = function() {
		return $(this).each(
				function() {
					$(this).html(
							$('<span />').width(
									Math.max(0, (Math.min(5, parseFloat($(this)
											.html())))) * 16));
				});
	}
</script>

<link rel="stylesheet"
	href="font-awesome-4.7.0/css/font-awesome.min.css">

<style type="text/css">
span.stars, span.stars span {
	display: block;
	background: url("Images/Stars.jpg") 0 -20px repeat-x;
	width: 80px;
	height: 23px;
}

span.stars span {
	background-position: 0 0;
}

.textbox {
	margin-left: 10px;
	height: 35px !important;
	width: 600px !important;
	font-size: 14px !important;
	display: inline;
	height: 35px !important;
}

i {
	display: inline;
	margin-right: 10px;
}

header {
	padding: 2em;
	color: white;
	background-color: #F0F0F0;
	clear: left;
	text-align: left;
	margin-bottom: 15px;
}

.fa-cutlery {
	color: black;
}

.submitButton {
	background-color: white;
	margin-left: 10px;
	color: black;
	padding: 11px 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	border: none;
}

.quitButton {
	background-color: white;
	margin-left: 18px;
	color: black;
	padding: 11px 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	border: none;
}

.postButton {
	margin-left: 5px;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
	border: none;
}

.summarytitle {
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 20px;
	line-height: 1;
	color: #4169e1;
	border: 0;
	padding: 0;
	margin: 0;
}

.profilename {
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 12px;
	line-height: 1;
	font-weight: bold;
	color: green;
	border: 0;
	padding: 2px;
	margin: 0;
}

h5 {
	font-weight: bold;
	color: grey;
	display: inline;
}

#summarytext {
	cursor: pointer;
}

.resultscontainer {
	/* 	padding: 7em; */
	color: black;
	background-color: #F0F0F0;
	clear: left;
	text-align: left;
}

#commentsec li {
	list-style-type: none;
}
</style>
</head>
<body>
	<c:url value="/showReview" var="showURL"></c:url>
	<c:url value="/displayReview" var="displayReviewURL"></c:url>
	<c:url value="/addComment" var="addCommentURL">
		<c:param name="idVal" value="${review.getId()}"></c:param>
		<c:param name="searchWord" value="${requestScope.searchWord}"></c:param>
	</c:url>

	<%-- Search for review --%>
	<header>
		<form action='<c:out value="${showURL}"></c:out>' method="post">
			<div class="searchBox">
				<i class="fa fa-cutlery fa-3x" aria-hidden="true"></i> <input
					type="text" name="reviewSearch" class="textbox"
					placeholder=" Search by typing any food product value"
					value="${requestScope.searchWord}"> <input type="submit"
					class="submitButton" value="Review Search">
					<input type="button"
					class="quitButton" value="Quit Search" onclick="window.close()">
			</div>	
		</form>
	</header>

	<c:set var="reviewTime" value="${review.getTime()}" />
	<c:set var="hh" value="${fn:substring(reviewTime, 0, 2)}" />
	<c:set var="mm" value="${fn:substring(reviewTime, 2, 4)}" />
	<c:set var="ss" value="${fn:substring(reviewTime, 4, 6)}" />

	<c:if test="${not empty requestScope.review}">

		<table>
			<tr>
				<td align="center" width="200"><img alt=""
					src="Images/default.png" width="130px" height="130px;" align="top"></td>
				<td><h2>
						<B><c:out value="${review.getSummary()}"></c:out></B>
					</h2>
					<h4>
						Product Id:
						<c:out value="${review.getProductId()}"></c:out>
					</h4>
					<p>
						<span class="stars"></span>
					</p> <input type="hidden" name="amount" value="${review.getScore()}" />
					By <b><c:out value="${review.getProfileName()}"></c:out></b> - <c:out
						value="${hh}" />:<c:out value="${mm}" />:<c:out value="${ss}" /></td>
			</tr>
		</table>

		<c:set var="imageloop" value="${fn:split(review.getImageVal(),'/')}" />
		<c:set var="dir" value="${imageloop[0]}/" />
		<c:set var="imagename" value="${fn:toLowerCase(imageloop[1])}" />

		<table cellpadding="45px">
			<tr>
				<td><c:out value="${review.getText()}"></c:out></td>
			</tr>
		</table>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img alt="" src="${dir}${imageloop[1]}" width="100px" height="100px;"
			align="top">

		<br />
		<br />

		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Review
			helpful?</b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="Images/Up.png" height="30" width="30" />  Yes (<c:out
			value="${review.getHelpfulnessNumerator()}"></c:out>) 
<img src="Images/Down.jpg" height="30" width="50" /> No  (<c:out
			value="${review.getHelpfulnessDenominator()}"></c:out>)

<br />
		<br />
	</c:if>

	<hr>

	<form action='<c:out value="${addCommentURL}"></c:out>' method="post">

		<c:if test="${fn:length(review.getComment()) gt 0}">
			<h4>Comments :</h4>
			<c:forEach items="${review.getComment()}" var="comment">
				<c:out value="${comment}">
				</c:out>
				<br />
			</c:forEach>
		</c:if>

		<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What
			is your feedback for this review?</h4>
		<ul id="commentsec">
			<li>Enter your comment <br />
			</li>
			<li></li>
			<li><textarea rows="4" cols="50" name="usercomment"
					placeholder="Enter comment"> </textarea> <br /> <input
				type="submit" value="Post" class="postButton"></li>
		</ul>
	</form>
</body>
</html>

