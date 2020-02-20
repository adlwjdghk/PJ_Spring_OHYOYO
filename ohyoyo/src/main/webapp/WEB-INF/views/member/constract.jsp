<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* Header */
	.wrap{
		width: 768px;
		margin: 60px auto;
	}
	#header{
		height: 169px;
		padding-top: 62px;
		margin-bottom: 32px;
		position: relative; 
		/*border: 1px solid red;*/
	}
	#container{
		position: relative;
		/*border: 1px solid green;*/
	}
	#footer{
		height: 81px;
		text-align: center;
		padding: 50px 0px 15px 0px;
		/*border: 1px solid blue;*/
	}
	.ohyoyo_join{
		font-size: 2em;
	}
	.o_join{
		display: block;
		width: 310px;
		height: 100px;
		margin: 0 auto;
		font-size: 60px;
		text-align: center;
	}
	.o_logo img{
		width: 310px;
		height: 112px;
	}

	/* Container */
	.join_content{
		width: 460px;
		margin: 0 auto;
	}
	.terms{
		margin-bottom: 14px;
		background-color: white;
		border: 1px solid #dadada;
		border-radius:1px;
	}
	.terms_span > input{
		position: absolute;
		right: 1px;
		top: 50%;
		width: 22px;
		margin-top: -11px;
		visibility: hidden;
	}
	.terms_p{
		display: block;
		padding: 15px;
		margin: 0px;
		position: relative;
		border-bottom: 1px solid #dadada; 
	}
	.terms_span > label{
		background: url('${path}/resources/img/icons_off.png') 32% 50% no-repeat;
		background-size: 30px 30px;
		display: block;
		line-height: 60px;
		height: 58px;
		top: -1px;
		padding-left: 30px;
		font-size: 25px;
		font-weight: 700;
		text-align: center;
	}
	.terms_span > label:hover{
		cursor: pointer;
	}
	.terms_span{
		position: relative;
		display: block;
		height: 58px;
	}
	.terms_span > input:checked +label{
		background-image: url('${path}/resources/img/icons_on.png');
	}
	.terms_ul{
		padding-bottom: 20px;
	}
	.terms_ul > li{
		display: block;
		padding: 13px 15px 7px;
	}
	.li4_span > label{
		margin: 10px 0 0 30px;
	}
	.ul_li_span{
		position: relative;
		display: block;
		height: 24px;
	}
	.label1{
		height: 24px;
		font-size: 14px;
		font-weight: 700;
		line-height: 24px;
		/*position: absolute;*/
		color: #333;
		top: 0;
		left: 0;
		width: 80%;
	}
	.label2{
		height: 24px;
		line-height: 24px;
		font-size: 13px;
		color: #333;
	}
	.span_only{
		color: #f46665;
		font-size: 12px;
		font-weight: 400;
	}
	.ul_li_span > input{
		visibility: hidden;
		position: absolute;
		right: 1px;
		width: 22px;
		margin-top: -11px;
		top: 50%;
	}
	.ul_li_span > label{
		background: url('${path}/resources/img/icons_off.png') 0.5% 50% no-repeat;
		background-size: 25px 25px;
		display: inline-block;
		padding-left: 35px
	}
	.ul_li_span > label:hover{
		cursor: pointer;
	}
	.ul_li_span > input:checked +label{
		background-image: url('${path}/resources/img/icons_on.png');
	}
	.li_content{
		text-decoration: underline;
		float: right;
		padding-right: 10px;
		font-size: 12px;
		font-weight: 500;
		height: 24px;
		line-height: 24px;		
		cursor: pointer;
		color: #969696;
		/*display: none; */
	}
	.terms_box{
		position: relative;
		box-sizing: border-box;
		height: 88px;
		margin-top: 11px;
		padding: 8px 10px;
		border: 1px solid #f0f0f0;
		background-color: #f7f7f7;
		overflow: auto;
		display: none;
	}
	.li3terms{
		margin-top: 20px;
	}
	.article_title{
		font-size: 12px;
		font-weight: 700;
		line-height: 16px;
		color: #666;
	}
	.article > p {
		display: block;
		font-size: 12px;
		line-height: 16px;
		color: #666;
	}
	.span_select{
		color: #969696;
		font-size: 12px;
		font-weight: 400;
	}
	.err_check_msg{
		font-size: 12px;
		line-height:  14px;
		color: red;
		display: block;
	}
	.err_check{
		visibility: hidden;
	}
	.btn_double_area{
		margin: 12px -5px 0px;
		overflow: hidden;
		border-radius: 5px;
	}
	.btn_double_area > span{
		display: block;
		float: left;
		width: 50%;
	}
	.btn_type{
		width: 225px;
		margin: 0px 5px;
		font-size: 20px;
		font-weight: 600;
		line-height: 61px;
		display: block;
		box-sizing: border-box;
		height: 61px;
		margin-top: 1px;
		text-align: center;
		border-radius: 4px;
		outline:none;
	}
	.btn_default{
		color: #333;
		border: 1px solid #e7e7e7;
		background-color: #fff;
	}
	.btn_agree{
		color: #fff;
		border: 1px solid #F7B8B4;
		background-color: #F7B8B4;
	}
	.btn_agree:hover{
		border: 1px solid #f46665;
		background-color: #f46665;
	}
	.group_join{
		margin: 20px 0 65px;
		text-align: center;
		color: #666;
		font-size: 13px;
	}
	.group_join > a{
		text-decoration: underline;
		color: #333;
	}
	/* Footer */
	#footer{
    	padding: 15px 0;
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
    	color: #f46665; 
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
    	color: #f46665;
    	text-decoration: underline;
    }
</style>
</head>
<body>
	<div class="wrap">
		<header>
			<div id="header">
				<h1 class="ohyoyo_join">
					<a href="#" class="o_join">join
						<!-- <img src="../../img/logo_onlyy.png"> -->
					</a>
				</h1>
			</div>
		</header>

		<section>

			<div id="container">
				<form class="join_content" 
					  name="" 
					  action="" 
					  method="">

					<div class="terms">
						<p class="terms_p">
							<span class="terms_span">
								<!-- input버튼 바꾸기
								 label이 핵심 라벨을 누르면 checkbox가 선택됨
								 그래서 라벨에 배경으로 이미지를 주고
								 checkbox는 숨겨놓기 -->
								<input type="checkbox" id="cbox">
								<label for="cbox">
									전체 동의
								</label>
							</span>
						</p>
						<ul class="terms_ul">
							<li class="trems_ul_li1">
								<span class="ul_li_span">
									<input type="checkbox" id="li1box" class="ckboxs">
									<label for="li1box" class="label1">
										오요요 이용약관 동의
										<span class="span_only">(필수)</span>
									</label>
									<span class="li_content li1co">내용보기</span>
								</span>
								<div class="terms_box li1terms">
									<div class="article">
										<h3 class="article_title">제 1조(목적)</h3>
										<p>이 약관은 오요요가 운영하는 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.</p>
										<h3 class="article_title">제 2조(정의)</h3>
										<p>① “몰”이란 오요요 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</p>
									</div>
								</div>
							</li>
							<li class="trems_ul_li2">
								<span class="ul_li_span">
									<input type="checkbox" id="li2box" class="ckboxs">
									<label for="li2box" class="label1">
										개인정보 수집 및 이용에 대한 안내
										<span class="span_only">(필수)</span>
									</label>
									<span class="li_content li2co">내용보기</span>
								</span>
								<div class="terms_box li2terms">
									<div class="article">
										<p>정보통신망법 규정에 따라 오요요에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
										<h3 class="article_title">1. 수집하는 개인정보</h3>
									</div>
								</div>
							</li>
							<li class="trems_ul_li3">
								<span class="ul_li_span">
									<input type="checkbox" id="li3box" class="ckboxs">
									<label for="li3box" class="label1">
										쇼핑정보 수신 동의
										<span class="span_select">(선택)</span>
									</label>
									<span class="li_content li3co">내용보기</span>
								</span>
								
								<span class="ul_li_span li4_span">
									<input type="checkbox" id="li4box" class="ckboxs li4box">
									<label for="li4box" class="label2">
										SNS 수신 동의
									</label>
									<input type="checkbox" id="li5box" class="ckboxs li4box">
									<label for="li5box" class="label2">
										이메일 수신 동의
									</label>
								</span>
								<div class="terms_box li3terms">
									<div class="article">
										<p>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS와 이메일로 받아보실 수 있습니다. <br>
										단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다. <br>
										선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="err_check">
						<span class="err_check_msg">오요요 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>
					<div class="btn_double_area">
						<span><button type="button" id="cons_btn_cancel" class="btn_type btn_default">취소</button></span>
						<span><button type="button" id="cons_btn_agree" class="btn_type btn_agree">확인</button></span>
					</div>
				</form>
				<div class="group_join">
					간편하게 회원가입 하고 싶으세요? <a href="#">SNS 회원 가입</a>
				</div>
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
<script type="text/javascript">
	$(document).ready(function(){
		// 내용보기 클릭시 세부내용 나오게하기
		var flog = 'no';
		$('.li1co').click(function(){
			if(flog == 'no'){
				$('.li1terms').css('display','flex');
				flog = 'yes';
			} else {
				$('.li1terms').css('display','none');
				flog ='no';
			}
		});
		$('.li2co').click(function(){
			if(flog == 'no'){
				$('.li2terms').css('display','flex');
				flog = 'yes';
			} else {
				$('.li2terms').css('display','none');
				flog ='no';
			}
		});
		$('.li3co').click(function(){
			if(flog == 'no'){
				$('.li3terms').css('display','flex');
				flog = 'yes';
			} else {
				$('.li3terms').css('display','none');
				flog ='no';
			}
		});
		
		/* 전체동의 클릭시 전체 체크 or 전체체크해제 */
		$('#cbox').on('click',function(){
			var flag = $(this).is(':checked'); /* 체크여부 Bool값 */
//			console.log(flag);
			/* checkbox를 선택해제할때 prop함수를 사용하기 
			   다른 함수는 막혔음 */
			if(flag == true){	
				$('.ckboxs').prop('checked',true); // 체크
			} else {
				$('.ckboxs').prop('checked',false); // 체크 해제
				
			}
		});
		
		/* 선택체크가 모두 체크가 되면 전체체크버튼 True
		   선택체크가 하나라도 체크해제이면 전체체크버튼 False */
		$('.ckboxs').on('click',function(){
			var ckLen = $('.ckboxs:checkbox:checked').length;
//			console.log(ckLen);
			if(ckLen != 5){
				$('#cbox').prop('checked',false);
			} else{
				$('#cbox').prop('checked',true);
			}
		});
		
		// 쇼핑정보 전체동의 or 전체취소
		$('#li3box').on('click',function(){
			var flag = $(this).is(':checked'); /* 체크여부 Bool값 */
			if(flag == true){	
				$('.li4box').prop('checked',true); 
			} else {
				$('.li4box').prop('checked',false); 
				
			}
		});
		$('.li4box').on('click',function(){
			var ckLen = $('.li4box:checkbox:checked').length;
//			console.log(ckLen);
			if(ckLen != 2){
				$('#li3box').prop('checked',false);
			} else{
				$('#li3box').prop('checked',true);
			}
		});
		
		/* 확인버튼 클릭시 필수체크 2개 체크유무 유효성체크 */
		$('#cons_btn_agree').on('click', function(){
			var agree_one = $('#li1box').is(':checked');
			var agree_two = $('#li2box').is(':checked');
			var agree_four = $('#li4box').is(':checked');
			var agree_five = $('#li5box').is(':checked');
			
			if(agree_one == false || agree_two == false){
				$('.err_check').css('visibility','visible');
				console.log("필수체크필요");
				return false;
			}
			// 유효성체크 통과시 회원가입 페이지로 이동
			location.href='${path}/member/join?useon='+agree_one
											   +'&primaryon='+agree_two
											   +'&snson='+agree_four
											   +'&emailon='+agree_five;
		});
		
		/* 취소버튼 클릭시 INDEX페이지로 이동 */
		$('#cons_btn_cancel').on('click', function(){
			location.href='${path}/';
		});
	});
</script>
</html>