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
	body{
		background-color: #fff !important;
	}
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
	.o_board{
		display: block;
		width: 310px;
		height: 100px;
		margin: 0 auto;
		font-size: 60px;
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
	    line-height: 75px;
	    border-right: solid 1px #ddd;
	    border-bottom: solid 1px #ddd;
	    color: #dadada;
	    font-size: 23px;
	    text-align: center;
	    font-weight: bold;
	}
	.board_menu a i{
		font-size: 30px;
		vertical-align: text-bottom;
		padding-right: 10px;
	}
	.board_search{
		margin: 0 0 45px;
		padding: 40px;
		background: #fff6f3;
		text-align: center;
	}
	.bd_search_sort{
		display: inline-block;
		height: 51px;
		line-height: 51px;
		margin-right: 10px;
		color: #757575;
	}
	.bd_search_sort span{
		padding-right: 5px;
   		cursor: pointer;
   		display: inline-block;
   		width: 47px;
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
		outline: none;
		background: #f7b8b4;
		color: white;
		border: none;
		border-radius: 2px;
		text-align: center;
		font-size: 15px;
		cursor: pointer;
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
	.board_col > tbody > tr > td:nth-child(2){
		text-align: left;
		padding-left: 40px; 
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
		line-height: 50px;
  		float: right;
	}
	.bd_btn_write a{
		padding: 15px 34px;
	}
	.bd_icon{
		float: right;
		border: 1px solid #dadada;
    	padding: 3px 5px;
    	color: #888;
	}
	#check_color{
		font-size: 16px;
		font-weight: bold;
		color: tomato;
		line-height: 19px;
	}
	.sort_color{
		font-weight: bold;
		font-size: 15px;
		color: tomato;
	}
	.bd_search_cnt{
		margin-bottom: 16px;
   	    padding-left: 10px;
   	    height: 24px;
	}
	.bd_search_cnt > span{
		vertical-align: text-bottom;
	}
	.bd_search_clear{
		display: inline-block;
		background-color: #f46665;
		color: white;
		padding: 1px 7px 2px;
    	margin-left: 5px;
	}
	.bd_search_clear i{
		margin-right: 2px;
	}
	.board_highlight{
		background-color: #f7b8b4;
    	border-bottom: 2px solid #f59791;
	}
	#curved-arrow{
		width: 14px;
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
					<a href="#"><i class="far fa-question-circle"></i>FAQ</a>
					<a href="#"><i class="far fa-comment-dots"></i>1:1문의</a>
					<a href="${path}/board/list?type=free"><i class="far fa-user-circle"></i>회원게시판</a>
					<a href="#"><i class="fas fa-exclamation-circle"></i>공지사항</a>
				</div>
				<div class="board_search">
					<form method="GET" action="${path}/board/list">
						<div class="bd_search_sort">
							<span><a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" id="sort_new">최신순</a></span>
							<span><a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" id="sort_cnt">조회순</a></span>
							<span><a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" id="sort_good">추천순</a></span>	
							<span><a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" id="sort_reply">댓글순</a></span>
						</div>
						<span class="bd_ps_box">
							<input type="hidden" name="sort_option" value="${map.sort_option}">
							<input type="text" name="keyword" class="bd_int" placeholder="검색어를 입력해주세요" value="${map.keyword}">
						</span>
						<span class="bd_btn_box">
							<button type="submit" class="bd_btn">SEARCH</button>
						</span>
					</form>
				</div>	
				<div class="bd_search_cnt">
					<c:if test="${!empty map.keyword}">
						<span>총 <span class="sort_color">${map.count}</span>건의 글이 있습니다.</span>
						<div class="bd_search_clear">
							<a href="${path}/board/list"><i class="fas fa-times-circle"></i>clear</a>
						</div>
					</c:if>
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
							<th scope="col">조회</th>
							<th scope="col">추천</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty map.list}">
							<tr>
								<td></td>
								<td class="bd_table_content">글이 없습니다.</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:if>
						<c:forEach items="${map.list}" var="list">
							<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
							<tr>
								<td>${list.bno}</td>
								<td class="bd_table_content">
									<a href="${path}/board/view/${list.bno}">
										<c:if test="${list.re_level != 0}">
											<c:forEach begin="1" end="${list.re_level}">
												<img id="curved-arrow" src="${path}/resources/img/icons8-curved-arrow-16 (2).png">
											</c:forEach>
											<span style="font-weight: bold;">Re:&nbsp;</span> 
										</c:if>
										${list.title}
									</a>
									<c:if test="${today == regdate}">
										<span class="bd_table_new">New</span>
									</c:if>
									<c:if test="${list.filecnt}">
										<span class="bd_icon">첨부파일 <i class="fas fa-paperclip"></i></span>
									</c:if>
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
								<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="check_color">${num}</a></li>
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
						<a href="${path}/board/write">글쓰기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %> 
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var sort_option = '${map.sort_option}';
		var type = '${map.type}'
		var re_level = '${list.re_level}';
		
		$('#sort_'+sort_option).addClass('sort_color');
		
		if(type == 'free'){
			$('.board_menu > a:nth-child(3)').css('color','#757575');
		}
		var nbsp = 40*re_level;
		
		$('.bd_table_content').css('padding-left','nbsp');
	});
</script>
</html>