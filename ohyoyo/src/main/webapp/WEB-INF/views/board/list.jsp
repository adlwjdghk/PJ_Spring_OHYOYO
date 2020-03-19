<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<title>ohyoyo board</title>
<link rel="stylesheet"  type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
	#board_wrap{
		position: relative;
		width: 100%;
	}
	.board_container{
		position: relative;
		width: 1260px;
		margin: 0 auto;
		padding: 62px 0 0;
		min-width: 1200px;
	}
	.board_title{
		display: block;
		width: 100%;
		text-align: center;
		margin: 60px 0 40px;
		line-height: 280%;
	}
	.board_title h2{
		font-size: 23px;
		font-weight: bold;
	}
	.ohyoyo_board{
		font-size: 2em;
	}
	.o_board{
		display: block;
		width: 310px;
		height: 100px;
		margin: 0 auto;
		font-size: 60px;
		font-family: 'Nanum Gothic Coding', monospace;
		text-align: center;
	}
	.board_content{}
	.board_menu{
		border-left: solid 1px #ddd;
	    border-top: solid 1px #ddd;
	    overflow: hidden;
	    margin-bottom: 60px;
		background: white;
	}
	.board_menu > a{
		float: left;
	    display: block;
	    width: 25%;
	    height: 80px;
	    line-height: 80px;
	    border-right: solid 1px #ddd;
	    border-bottom: solid 1px #ddd;
	    color: #dadada;
	    font-size: 23px;
	    text-align: center;
	    font-weight: bold;
	}
	.board_menu a i{
		font-size: 30px;
		vertical-align: middle;
		padding-right: 10px;
	}
	.board_search{
		margin: 0 0 60px;
		padding: 40px;
		background: #ffe6dc;
		text-align: center;
	}
	.bd_search_sort{
		display: inline-block;
		height: 51px;
		line-height: 51px;
		border-bottom: 1px solid #000;
		margin-right: 10px;
	}
	.bd_search_sort span{
		padding-right: 5px;
   		border-right: 1px solid #ddd;
   		cursor: pointer;
	}
	.bd_search_sort span:hover{
		font-weight: bold;
	}
	.bd_search_sort span:last-child{
		border: none;
	}
	.bd_search_select{
		width: 140px;
		font-size: 14px;
	}
	.bd_ps_box{
		display: inline-block;
		position: relative;
		height: 51px;
		border: 1px solid #dadada;
		margin: 0px;
		padding: 10px 14px 10px 14px;
		background: #fff;
		vertical-align: top;
	}
	.bd_int{
		position: relative;
		width: 300px;
		height: 30px;
		border: none;
		outline: none;
		background: #fff;
		font-size: 15px;
		z-index: 10;
	}
	.bd_btn_box{
		display: inline-block;
		text-align: center;
		vertical-align: top;
	}
	.bd_btn{
		width: 110px;
		height: 51px;
		padding: 12px 16px;
		outline: none;
		background: #f7b8b4;
		color: white;
		border: none;
		text-align: center;
		font-size: 15px;
	}
	.board_col{
		border-top: 2px solid #000;
		font-size: 15px;
		padding: 0 2px 0 5px;
		background-color: #fff;
	}
	.board_col > thead > tr > th{
		padding: 15px 0;
		border-bottom: 1px solid #ddd;
		font-weight: normal;
		text-align: center;
		vertical-align: middle;
	}
	.board_col > tbody > tr > td{
		color: #666;
		padding: 15px 0;
		border-bottom: 1px solid #ddd;
		text-align: center;
		vertical-align: middle;
	}
	.bd_table_content{
		padding-right: 15px !important;
	}
	.bd_table_new{
		display: inline-block;
		margin-left: 3px;
		width: 24px;
		height: 14px;
		line-height: 11px;
		color: tomato;
		font-size: 12px;
		font-weight: bold;
		vertical-align: middle;
		animation-name: twinkle;
		animation-iteration-count: infinite;
		animation-duration: 3s;
	}
	@keyframes twinkle{
		0% {opacity: 0;}
		100% {opacity: 1;}
	}
	.board_page{
		position: relative;
		min-height: 34px;
		margin-top: 30px;
	}
	.board_page > ul{
		margin: 30px 0;
		text-align: center;
	}
	.board_page > ul > li{
		display: inline-block;
		padding: 0 8px;
		color: #444;
		vertical-align: top;
	}
	.bd_btn_write{
		line-height: 29px;
  		float: right;
	}
	.bd_icon{
		float: right;
		padding-right: 10px;
	}
	#check_color{
		font-size: 16px;
		font-weight: bold;
		color: #f7b8b4;
	}
</style>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div id="board_wrap">
		<div class="board_container">
			<div class="board_title">
				<h1 class="ohyoyo_board">
					<a href="#" class="o_board">board</a>
				</h1>
			</div>
			<div class="board_content">
				<div class="board_menu">
					<a href="#"><i class="fas fa-question-circle"></i>FAQ</a>
					<a href="#"><i class="fas fa-exclamation-circle"></i>공지사항</a>
					<a href="#"><i class="fas fa-user-circle"></i>회원혜택안내</a>
					<a href="#"><i class="fas fa-comment-dots"></i>1:1문의</a>
				</div>
				<div class="board_search">
					<form method="" action="">
						<div class="bd_search_sort">
							<span><a href="#">최신순</a></span>
							<span><a href="#">조회순</a></span>
							<span><a href="#">댓글순</a></span>
							<span><a href="#">추천순</a></span>	
						</div>
						<select class="bd_search_select bd_ps_box">
							<option>제목</option>
							<option>내용</option>
						</select>
						<span class="bd_ps_box">
							<input type="text" name="" class="bd_int">
						</span>
						<span class="bd_btn_box">
							<button type="button" class="bd_btn">검색</button>
						</span>
					</form>
				</div>	
				<table class="board_col"
				>
					<colgroup>
						<col style="width: 1%">
						<col>
						<col style="width: 9%">
						<col style="width: 10%">
						<col style="width: 6%">
						<col style="width: 6%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
							<th scope="col">댓글</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${map.list}" var="list">
							<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
							<tr>
								<td>${list.bno}</td>
								<td class="bd_table_content">
									<a href="#">${list.title}</a>
									<c:if test="${today == regdate}">
										<span class="bd_table_new">New</span>
									</c:if>
									<span class="bd_icon"><i class="fas fa-paperclip"></i></span>
								</td>
								<td>${list.name}</td>
								<td>
									<c:choose>
										<c:when test="${today == regdate}">
											<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>									
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${list.viewcnt}</td>
								<td>${list.replycnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="board_page">
					<ul>
						<c:if test="${map.pager.curBlock > 1}">
							<li><a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="page_left"><i class="fas fa-chevron-left"></i></a></li>
							<li><a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}">1</a></li>
							<li>...</li>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
						<c:choose>
							<c:when test="${num == map.pager.curPage}">
								<li><a href="${path}/board/list?curPage=${num}" id="check_color">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a></li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<li>...</li>
							<li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}">${map.pager.totPage}</a></li>
							<li><a href="${path}/board/list?curPage=${map.pager.blockEnd+1}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="page_right"><i class="fas fa-chevron-right"></i></a></li>
						</c:if>
					</ul>
					<div class="bd_btn bd_btn_write">
						<a href="#">글쓰기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %> 
</body>
</html>