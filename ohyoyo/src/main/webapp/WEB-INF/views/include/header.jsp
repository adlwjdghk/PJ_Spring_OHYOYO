<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %> 
<!-- include.jsp를 실행시켜주는 곳 \ 그대로 가지고와서 사용하는 게 됨 -->
<!-- <% %> : scriptlet 스크립트릿 : 자바코드를 쓸수있게 해주는 곳  
	ex) <% int num = 4; %> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ohyoyo</title>
<link rel="stylesheet"  type="text/css" href="${path}/resources/css/common.css">
<!-- ${path}/resources 로 경로타게 할수있음 -->
<style type="text/css">
	div.header_wrap{
		position:fixed;
		top:0;
		z-index: 999;
		width: 100%;
		background-color:white;
	}
	div.header_content{
		width: 1400px;
		margin: 0 auto;
		height:65px;
		box-sizing: border-box;
		display: flex;
		justify-content: space-between;
		align-items: center;
		/*보이기용*/
		/*border-left: 1px solid red;
		border-right: 1px solid red;*/
	}
	.header_content_logo{}
	.header_content_logo_img{
		max-width: 193px;
		/*height:131px;*/
		vertical-align: middle;
	}
	.header_content_search{

	}
	.header_content_search_group{
		display: flex;
		align-items: center;
		background-color: #f2f3f5;
		border-radius: 10px;
		height: 35px;
	}
	.header_content_search_input{
		background-color: transparent;
		border-color: transparent;
		width: 250px;
		height: 35px;
		padding: 4px 12px;
		outline: none;	/* input 태그 focus시 파랑테두리*/
		border-radius: 10px;
		font-size: 13px;
	}
	.header_content_search_btn{
		background-color: transparent;
		border-color: transparent;
		width: 30px;
		height: 35px;
		cursor: pointer;
		color: #F7B8B4;
		padding: 0 22px 0 7px;
		/* 원하는 모서리 부분을 골라서 둥글게 만들수 있음 */
		border-top-right-radius: 10px; 
		border-bottom-right-radius: 10px;
		outline: none;
	}
	.header_content_search_btn:hover{
		background-color: #F7B8B4;
		color: white;
	}
	.header_content_nav{
		display: flex;
		align-items: center;
		justify-content: space-between;
		width: 285px; 
		font-size: 15px;
	}
	.header_content_member{
		/*width: 160px;*/
		display: flex;
		align-items: center;
		justify-content: space-between;
		flex-direction: row; /* defalut(생략가능) */
	}
	.header_content_member > div{
		padding: 10px 0 10px 3px; 
	}
	.header_content_dropdown_group{
		position: relative;
	}
	.header_content_dropdown_group:hover .header_dropdown{
		display: block;
	}
	.header_content_dropdown_group > a{
		display: inline-block;
		padding: 12px 6px;
		font-weight: 400;
		border: 1px solid transparent;
		border-radius: 5px;
		height: 45px;
		color: #595959;
		/* height 45px border 2px padding 24px = 19px */
		line-height: 19px;
		
	}
	.header_content_dropdown_group:hover > a,.header_content_member_cart:hover > a{
		background-color: #f9f9f9;
		border-color:#f9f9f9;
	}
	/*.header_content_dropdown_wrap:hover > div > a,.header_content_member_cart:hover > a{
		background-color: #f9f9f9;
		border-color:#f9f9f9;
	}*/
	.header_content_member_cart > a{
		display: inline-block;
		padding: 12px 6px;
		font-weight: 400;
		border: 1px solid transparent;
		border-radius: 50%;
		width: 45px;
		height: 45px;
		color: #595959;
		text-align: center;
		line-height: 19px;
	}
	.header_dropdown_menu{
		border-bottom-left-radius: 2px;
		border-bottom-right-radius: 2px;
		box-shadow: 0 6px 16px rgba(20,23,28,.21);
		background-color: white;
		padding: 10px 0;
		
	}
	.header_dropdown_menu a{
		display: inline-block;
		font-size: 13px;
		color: #595959;
		text-align: center;
		font-weight: 400;
		padding: 5px 15px;
		width: 130px;
		position: relative;
		z-index: 100;
	}
	.header_dropdown_menu a:hover{
		color: #4D5075;
		background-color: #ffe6dc;
	}
	.header_dropdown{
		position: absolute;
		top: 53;
		left: 0;
		display: none;
		z-index: 2000;
	}
	.arrow{
		position: absolute;
		top: -5px;
		left: 16px;
		width: 15px;
		height: 15px;
		transform: rotate(45deg);
		background-color: white;
		border-color: #fff transparent #fff transparent;
		z-index: 99;
	}

	/* 모달 로그인 창 */
	.log_modal_wrap{
		position: fixed;
		z-index: 1000;
		background-color: rgba(0,0,0,0.4);
		overflow: auto;
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		display: none;
	}
	.log_modal_content{
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
		border-radius: 1px;
		justify-content: center;
		margin-top: 12px; 
		max-width: 400px;
		width: 100%;
		height: 530px;
		background-color: #fafafa;
		color: #262626;
		display: flex;
		align-items: stretch;
		flex-direction: column;
		position: relative;
		vertical-align: baseline;
	}
	.login_box{
		background-color: #fff;
		border: 1px solid #e6e6e6;
		border-radius: 1px;
		margin: 0 0 10px;
		padding: 10px 0; 
	}
	.login_main  img{
		background-repeat: no-repeat;
		background-position: -98px 0;
		/*height: 51px;*/
		width: 228px;
		margin: 0 85.6px ;
	}
	.form > h2{
		font-weight: 600;
		line-height: 20px;
		font-size: 17px;
		margin: 0 40px 10px;
		color: #999;
		text-align: center;
	}
	#login_another{
		margin: 8px 40px;
	}
	.line_or{
		margin: 22px 40px 15px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.line{
		background-color: #dbdbdb;
		width: 40%;
		height: 1px;
		top: .45em;
		display: inline-block;
	}
	.or{
		color: #999;
		font-size: 13px;
		font-weight: 600;
		line-height: 15px;
		margin: 0 18px;
		text-transform: uppercase;
		display: inline-block;
	}
	.button{
		
		border: 0.5px solid #ffe6dc;
		background-color: #ffe6dc;
		border-radius: 4px;
		width: 100%;
		height: 38px;
		color: white;
		box-sizing: border-box;
		cursor: pointer;
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 16px;
		font-weight: 600;
		padding: 5px 9px;
		text-align: center
		text-transform: inherit;
		text-overflow: ellipsis;
		/*width: auto;*/
		margin: 0 0 5px;
	}
	.log_button:hover{
		border: 0.5px solid #ffb4af;
		background-color: #F7B8B4;
		color: #fff;
	}
	.gg_button{
		border: 1px solid #dbdbdb;
		background-color: #fff;
		color: #595959;
	}
	.nv_button{
		border: 1px solid transparent;
		background-color: #3ec729;
	}
	.fb_button{
		border: 1px solid transparent;
		background-color: #2e5393;
	}
	.button img{
		margin: 0;
		width: 16px;
		height: 16px;
	}
	hr{
		margin: 10px 40px 18px;
		content: 15px;
	}
	.input_wrap{
		margin: 0 40px 10px;
		position: relative;
	}
	input{
		display: flex;
		flex-direction: row;
		border: 1px solid #efefef;
		padding: 9px 0px 7px 8px;
		font-size: 13px;
		width: 100%;
		height: 42px;
		position: relative; 
		background: #fafafa;
		flex: 1 0 auto; 
		line-height: 18px;
		outline: none;

	}
	.down{
		color: #999;
		margin: 10px 60px;
		text-align: center;
	}
	input:hover{
		border: 1px solid #999;
	}
	.login_signup_button{
		color: #262626;
		font-size: 14px;
		/*margin: 15px 0;*/
		text-align: center;
	}
	a{
		color: #3897f0;
	}
	.pw_check_key {
		text-align: center;
		font-size: 14px;
		color: #595959;
		cursor: pointer; 
	}
	.login_close{
		position: absolute;
		top: -10px;
		right: 7px;
	}
	.login_close > button{
		color: rgb(142,142,142);
		border:none;
		background: white;
		font-size: 30px;
		cursor: pointer;
		outline: none;
	}
	.login_close > button:hover{
		color: #F7B8B4;

	}
	.pw_eye{
		position: absolute;
		color: #aaa;
		font-size: 17px;
		top: 12px;
		right: 7px;
		cursor: pointer;
		height: 42px;
		line-height: 42px;
		width: 30px;
		text-align: center;

	}
	.header_sidebar_top{
		position: fixed;
		right: 30px;
		color: #595959;
		width: 70px;
		height: 70px;
		display: flex;
		flex-direction: column;
		align-items: center;
		font-size: 30px;
		cursor: pointer;		
	}
	.header_sidebar_top > img{
		transition: transform .3s;
		display: block;
	}
	.header_sidebar_top:hover > img{
		transform: scale(1.3);
	}
	.header_sidebar_top > span {
		font-size: 15px;
		font-weight: bold;
	}
	.header_sidb_top_btn{
		bottom: 30%;
		z-index: 99;
		display: none;
	}
</style>
</head>
<body>
	<div class="header_sidebar">
		<div class="header_sidebar_top header_sidb_top_btn">
			<img src="${path}/resources/img/icons8-chevron-up-48.png">
			<span>top</span>
		</div>
	</div>
	<div class="log_modal_wrap">
		<div class="log_modal_content">
			<div class="login_close"><button><i class="fas fa-times"></i></button></div>

			<div class="login_box login_main">
				<div><h1><a herf="${path}/"><img src="${path}/resources/img/logo/33333.png"></a></h1></div>

				<form class="frm_login">
					<!-- <h2>제품을 구매하시려면 로그인이 필요합니다.</h2> -->
					

					<div class="input_wrap">
						<input type="email" id="login_id" class="login_input" placeholder="아이디" required>
					</div>
					<div class="input_wrap">
						<input type="password" id="login_pw" class="login_input" placeholder="비밀번호" 
						required minlength="6" maxlength="18">
						<span class="pw_eye"><i class="fas fa-eye-slash"></i></span>
					</div>
					
					<div id="login_another">
						<button type="submit" class="button log_button">로그인</button>
					</div>
					<div class="pw_check_key"><p>비밀번호를 잊어버리셨나요?</p></div>
					<div class="line_or">
						<div class="line"></div>
						<div class="or">또는</div>
						<div class="line"></div>
					</div>
					<div id="login_another">
						<button class="button gg_button">
							<img src="${path}/resources/img/google_logo_2_littledeep.png">
							<span>&nbsp;google 로그인</span>
						</button>
						<button class="button nv_button">
							<img src="${path}/resources/img/icons8-n-100.png">
							<span>&nbsp;naver 로그인</span>
						</button>
						<button class="button fb_button">
							<span>
								<i class="fab fa-facebook-f"></i>&nbsp;&nbsp;facebook 로그인
							</span>
						</button>
					</div>
					<!-- <p class="down">로그인하면 ohyoyo의 모든 제품을 구매, 배송받을 수 있습니다.</p> -->
				</form>
			</div>
			<div class="login_box login_signup_button">
				<p class="signup">계정이 없으신가요?
					<a href="${path}/member/constract">회원가입</a>
				</p>
			</div>
			
		</div>
	</div>
	<header>
		<div class="header_wrap">
			<div class="header_content">
				<div class="header_content_logo">
					<a href="#">
						<img class="header_content_logo_img" src="${path}/resources/img/logo/333333_final.png" alt="로고이미지">
					</a>
				</div>
				
				<div class="header_content_nav">
					
					<div class="header_content_dropdown_group">
							<a href="#" class="magicline">Best</a>		
					</div>

					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">Food</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">사료</a></li>
									<li><a href="#">스틱/큐브/소시지</a></li>
									<li><a href="#">캔/껌</a></li>
									<li><a href="#">영양제</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">Play</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">장난감</a></li>
									<li><a href="#">노즈워크</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">Living</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">방석/쿠션</a></li>
									<li><a href="#">하우스</a></li>
									<li><a href="#">급여그릇</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="header_content_search">
					<form name="frm_search" action="" method="GET">
						<div class="header_content_search_group">
							<input type="text" placeholder="SEARCH" name="keyword" class="header_content_search_input">
							<button type="button" class="header_content_search_btn"><i class="fas fa-search"></i></button>
						</div>
					</form>
				</div>
				<div class="header_content_member">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#"><i class="fas fa-user">&nbsp;MY PAGE</i></a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">주문내역</a></li>
									<li><a href="#">Wish List</a></li>
									<li><a href="#">회원정보수정</a></li>
									<li><a href="#">고객센터</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div>
						<div class="header_content_member_cart"><a href="#"><i class="fas fa-shopping-bag"></i></a></div>
					</div>
					<div><button class="btn btn-basic login_open">로그인</button></div>
					<div><button id="header_btn_join" class="btn btn-primary">가입하기</button></div>
				</div>
			</div>
		</div>
	</header>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$(window).scroll(function(){ 
			// 스크롤이 움직이면 (스크롤 감지)
			if(document.body.scrollTop > 80 || document.documentElement.scrollTop > 80){
				$('.header_wrap').fadeIn().css('box-shadow','0 0 1px 1px rgba(20,23,28,.1), 0 3px 1px 0 rgba(20,23,28,.1)');
				$('.header_sidb_top_btn').fadeIn().css('display','flex');
			} else {
				$('.header_wrap').css('box-shadow','none');
				$('.header_sidb_top_btn').fadeOut();
			}
		});
		// top버튼 click하면 스르륵 올라가게 하는 것
		$('.header_sidb_top_btn').click(function(){
			$('html, body').animate({scrollTop : 0}, 800);
		});
	});
	// 로그인 input(id, pw)에 focus되면 테두리색 변경
	 $(document).on('focus','.input_wrap',function() {
			// console.log('fosus 됨');
			$(this).css('borer','1px solid red')
	 });
	 $(document).on('blur','.input_wrap',function() {
			$(this).css('borer','1px solid #595959')
	 });
	 
	 // LOGIN 버튼 클릭시 Modal창 open
	 $(document).on('click','.login_open',function() {
	  	// alert('test');
	  	// alert 이벤트로 click 이벤트가 동작하는지 확인하는 것 test를 alert창으로 보여야함
	  
	  	$('.log_modal_wrap').css('display','flex');
	  	$('#login_id').focus();
	 });	
	
	// MODAL창 X버튼을 클릭하면 Modal창 Close
	$(document).on('click','.login_close', function() {
		$('.log_modal_wrap').css('display','none');
		$('.frm_login')[0].reset();
		// $('.login_input').val('');
		$('.pw_eye').prev().attr('type','password');
		$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
			   .css('color','#aaa');
	});
		
	// LOGIN MODAL창 암호 보이기 or 숨기기
	$(document).on('click','.pws_eye',function(){
		// alert('sns');
		var code = $(this).prev().attr('type');
		// alert(code); // 모름 input type을 가져와야함 
		// 같은 형제의 위 아래를 선택할때 위는 prev() 아래는 next()를 적으면 됨
		if(code == 'password'){
			$(this).prev().attr('type','text');
			$(this).html('<i class="fas fa-eye"></i>')
				   .css('color','#666');
		} else{
			$(this).prev().attr('type','password');
			$(this).html('<i class="fas fa-eye-slash"></i>')
				   .css('color','#aaa');
				   // .html().css() 체이닝 기법
		}	
	
	})  ;
	
	// Header가입하기 버튼 클릭시 동의 페이지 이동
	$(document).on('click','#header_btn_join',function(){
		location.href="${path}/member/constract";
	});
</script>
</html>