<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {	box-sizing: border-box;	}
	body, h1, h2, h3, h4, h5, h5, ul, p{
		margin: 0;	padding: 0; font-weight: 400;
	}
	body { 
		background-color: #f9f9f9; 
	}
	ul{ list-style: none; }
	a{
		text-decoration: none;
		color: inherit;
	}

	/* Header */
	header{
		height: 59px;
		padding-top: 16px;
		border-bottom: 1px solid #d4d4d4;   
	}
	header > h1{	
		font-size: 18px;
		padding-left: 67px; 
	}

	/* Container */
	.det_wrap *{
		line-height: 1.5;
		font-family: '맑은 고딕','Malgun Gothic','Apple SD Gothic Neo',sans-serif,'돋움',dotum;
		color: #1e1e1e;
		font-size: 14px;
	}
	.det_wrap{
		width: 800px;
		text-align: center;
		margin: 100px auto 20px auto;
		position: relative;		
	}
	.det_title{
		border-bottom: 1px solid #d6d6d6;
	}
	.det_title > h1{
		text-align: left;
		font-size: 20px;
	}
	.det_content{
		padding-top: 35px;
	}
	.det_content h1{
		font-size: 24px;
	}
	.det_button_wrap{
		margin-top: 35px;
		padding-top: 30px;
		border-top: 1px solid #d4d4d4;
	}
	.det_button{
		border-radius: 4px;
		border: 1px solid #d6d6d6;
		text-align: center;
		display: inline-block;
		min-width: 118px;
		padding: 11px;
		margin-right: 10px;
		width: 140px;
	}
	.btn_default{
		background-color: #fafafa;
	}
	.btn_default:hover{
		border: 1px solid #171616;
	}
	.btn_agree{
		background-color: #ffe6dc;
	}
	.btn_agree:hover{
		background-color: #f7b8b4;
	}
	.highlight{
		color: #f46665;
	}
	.important{
		padding: 10px 50px 12px;
		margin: 20px auto 0;
		background-color: white;
		text-align: left;
		border: 1px solid #dadada;
		display: inline-block;

	}
	.imp_box{
		/*border: 1px solid red;*/
		font-size: 16px;
	}
	.imp_savings{
		font-size: 18px;
		font-weight: bold;
		padding-left: 10px;
		margin-bottom: 5px;
		text-align: center;
	}

	.user_pw{
		outline: none;
		border: none;
	}
	.pw_box{
		border-bottom: 5px solid #dadada; 
	}
	.id_pw{
		padding-right: 5px;
	}
	.error_next_box{
		display: none;
		color: red;
		font-size: 12px;
	}

	/* Footer */
	#footer{
    	padding: 60px 0;
    }
    #footer > ul {
    	margin: 0 auto 9px;
    	text-align: center;
    }
    #footer * {
    	font-size: 12px;
    	line-height: normal;
    	list-style: none;
    	color: #333;
    }
    #footer > ul > li {
    	display: inline;
    	padding: 0 5px 0 7px;
    	border-left: 1px solid #dadada;
    }
    #footer > ul > li a:hover {
    	text-decoration: underline;
    }
    #footer ul li:first-child {
    	border-left: 0px!important;
    }
    #addr_logo{
    	width: 68px;
    	height: 19px;
    }
    #address{
    	margin: 0 auto;
    	text-align: center;
    }
    #address *{
    	font-size: bold;
    }
    #address a:hover{
    	text-decoration: underline;

    }
</style>
</head>
<body>
	<div class="wrap">
		<!-- <header>
			<h1>MY PAGE</h1>
		</header> -->
		<section>
			<div class="det_wrap">
				<div class="det_title">
					<!-- <h1>회원 탈퇴</h1> -->
				</div>
				<div class="det_content">
					<div class="det_content_container">
						<h1>오요요 회원 탈퇴 전 꼭 확인해 주세요!</h1>
						<br>
						<p>오요요를 탈퇴하면 회원 정보 및 구매기록, 적립금 등 서비스 이용 기록을 포함한 모든 정보가 삭제됩니다.<br> 삭제된 데이터는 복구되지 않습니다.</p>
						<br>
						<p>회원 탈퇴 진행시 본인을 포함한 타인 모두 <span class="highlight">아이디 재사용이나 복구가 불가능 합니다.</span><br> 즉, 탈퇴한 후에는 더 이상 해당 아이디로는 오요요의 제품을 구매할 수 없게 됩니다.</p>
						<br>
						<p>* 오요요 회원을 탈퇴하시기 전 ‘마이페이지’ 메뉴에서 작성 게시글을 확인해 주세요.<br> 탈퇴 후에는 회원 정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, <span class="highlight">게시글을 임의로 삭제해드릴 수 없습니다.</span></p>
						<br>
						<p>탈퇴된 오요요 회원 정보와 서비스 이용기록 등은 복구할 수 없으니 <span class="highlight">신중하게 선택하시길 바랍니다.</span></p>
						<div class="important">
							<div class="imp_box imp_savings">
								" <span class="user_id"></span>님의 현재 적립금은 <span id="savings"></span>원 입니다. "<br>
								<p class="highlight">적립금 또한 복구되지 않습니다.</p>
							</div>
							<div class="imp_box imp_id">
								<label for="pw">
									<span class="id_pw">아이디</span>
									<span class="user_id"></span>
								</label>
							</div>
							<div class="imp_box imp_pw">
								<label for="pw">
									<span class="id_pw">비밀번호</span>
								</label> 
								<span class="pw_box"><input type="password" class="user_pw" id="pw" name="" placeholder="&nbsp;비밀번호"></span>
							</div>
							<span class="error_next_box">&nbsp;탈퇴하기 위해선 비밀번호가 필요합니다:(</span>
						</div>
					</div>
				</div>
				<form name="" action="" method="">
					<div class="det_button_wrap">
						<a href="#" class="det_button btn_default">
							<span>탈퇴 취소</span>
						</a>
						<a href="#" class="det_button btn_agree">
							<span>확인</span>
						</a>
					</div>
				</form>
			</div>
		</section>
		<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
				<div id="address">
					<span>Copyright</span>
					<span>ⓒ</span>
					<span><strong><a href="#">OHYOYO Corp.</a></strong></span>
					<span>All Right Reserved.</span>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>