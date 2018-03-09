<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Foogle</title>
<link rel="stylesheet"
	href="font-awesome-4.7.0/css/font-awesome.min.css">
<style>
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

.noresults{
	padding: 2em;
	color: black;
	background-color: white;
	clear: left;
	text-align: left;
	margin-bottom: 15px;
	margin-left: 60px;
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
</style>
</head>
<body>
	<c:url value="/showReview" var="showURL"></c:url>

	<%-- Search for review --%>
	<header>
		<form action='<c:out value="${showURL}"></c:out>' method="post">
			<div class="searchBox">
				<i class="fa fa-cutlery fa-3x" aria-hidden="true"></i> <input
					type="text" name="reviewSearch" class="textbox"
					placeholder=" Search by typing any food product value"
					value="${requestScope.reviewTerm}"> <input type="submit"
					class="submitButton" value="Review Search">
					<input type="button"
					class="quitButton" value="Quit Search" onclick="window.close()">
			</div>
		</form>
	</header>

	<div class="resultscontainer">
		<c:if test="${not empty requestScope.reviews}">

			<c:forEach items="${requestScope.reviews}" var="review">
				<c:url value="/displayReview" var="displayReviewURL">
					<c:param name="id" value="${review.getId()}"></c:param>
					<c:param name="searchKey" value="${requestScope.reviewTerm}"></c:param>
				</c:url>
				<nav>
					<ul class="summarytitle">
						<li id="summarytext"><a
							href='<c:out value="${displayReviewURL}" escapeXml="true"></c:out>'>${review.getSummary()}</a>
						</li>
					</ul>
					<ul class="profilename">
						<c:out value="${review.getProfileName()}"></c:out>
					</ul>

					<c:set var="keyword" value="${requestScope.reviewTerm}"></c:set>
					<c:set var="words" value="${fn:split(review.getText(),' ') }" />
					<c:set var="keywordindex" value="-1"></c:set>

					<c:forEach var="word" items="${words}" varStatus="loop">
						<c:choose>
							<c:when test="${fn:contains(word, keyword)}">
								<c:set var="keywordindex" value="${loop.index}"></c:set>
							</c:when>
						</c:choose>
					</c:forEach>

					<c:if test="${keywordindex gt -1}">
						<c:out value="${words[keywordindex-3]}" />
						<c:out value="${words[keywordindex-2]}" />
						<c:out value="${words[keywordindex-1]}" />
						<c:out value="${words[keywordindex]}" />
						<c:out value="${words[keywordindex+1]}" />
						<c:out value="${words[keywordindex+2]}" />
						<c:out value="${words[keywordindex+3]} ..." />
					</c:if>
					<c:if test="${keywordindex eq -1}">
						<c:forEach var="i" begin="0" end="6">
							<c:out value="${words[i]}" />
						</c:forEach>  ... 
					</c:if>
				</nav>
				<hr>
			</c:forEach>

		</c:if>
		<c:if test="${empty requestScope.reviews}">
			<div class="noresults">
				Your search  - <B><c:out value="${requestScope.reviewTerm}"></c:out> </B> did not match any documents suggestions:
				<ul>
					<li>Try different keywords related to food</li>
					<li>Make sure all words are spelled correctly</li>
				</ul>
			</div>
		</c:if>
	</div>


</body>
</html>