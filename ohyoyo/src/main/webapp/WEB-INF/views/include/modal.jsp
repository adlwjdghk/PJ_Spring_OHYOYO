<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>modal_err.html</title>
<script src="https://kit.fontawesome.com/e2a7455480.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
	.modal_wrap{
		top: 0;
		position: fixed;
		z-index: 1000;
		background-color: rgba(0,0,0,0.4);
		overflow: auto;
		width: 100%;
		height: 100%;
		display: none;
		justify-content: center;
		align-items: center;
	}
	.modal_content{
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
		border-radius: 1px;
		max-width: 400px;
		width: 100%;
		background-color: #fafafa;
		color: #262626;
		position: relative;
	}
	.imp_ment{
		padding: 55px 10px 40px;
		font-size: 15px;
		font-weight: bold;
		text-align: center;
	}
	.close{
		position: absolute;
		top: 10px;
		right: 9px;
	}
	.close > button{
		color: rgb(142,142,142);
		border:none;
		background: #fafafa;
		font-size: 30px;
		cursor: pointer;
		outline: none;
	}
	.close > button:hover{
		color: #F7B8B4;

	}
	.modal_msg_main{
		font-size: 20px;
		padding-bottom: 30px;
	}
	.modal_button_wrap{
		margin: 0 10px;
		padding: 0 0 30px;
		/*border-top: 1px solid #d4d4d4;*/
		text-align: center;
	}
	.modal_button{
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
		background-color: #f46665;
		font-weight: bold;
	}

</style>
</head>
<body>
	<div class="modal_wrap">
		<div class="modal_content">
			<div class="close"><button><i class="fas fa-times"></i></button></div>
			<div class="imp_ment">
				<div class="modal_msg_main">
					<span id="modal_user_id"></span>
					<br><br>
					<span id="modal_msg_main1"><p><span></span></p></span>
				</div>
				<div class="modal_msg_sub">
					<span id="modal_msg_sub1"></span>
					<br><br>
					<span id="modal_msg_sub2"></span>
				</div>
			</div>
				<div class="modal_button_wrap">
					<a href="#" class="modal_button btn_default" id="modal_cancle_btn">
						<span>취소</span>
					</a>
					<a href="#" class="modal_button btn_agree" id="modal_yes_btn">
						<span>확인</span>
					</a>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var id='${id}';
		var email='${email}';
		var key='${key}';
				
		var main_user = id+'${userid}님'; 
		var join_main_txt = '회원가입을 축하드립니다.';
		var join_sub_txt1 = '인증메일을 보냈습니다.';
		var join_sub_txt2 = '인증하셔야만 사이트 활동이 가능합니다.';
		var auth_main_txt = '이메일 인증되셨습니다.';
		var auth_sub_txt = '지금부터 사이트 활동이 가능합니다 :)';
		var drop_main_txt = '정말 탈퇴하시겠습니까?';	
		var drop_sub_txt = '정보는 복구되지않습니다.';	
		var dropResult_main_txt = id+'님 탈퇴되셨습니다.';	
		var dropResult_sub_txt = '그동안 OHYOYO를 이용해주셔서 감사합니다.';
		
		var dropBoard_main_txt = "정말 게시글을 삭제하시겠습니까?";
		var dropBoardNo_main_txt = "댓글이 있는 게시글은 삭제할 수 없습니다.";
		if(key == 'join'){ // 회원가입 성공, 이메일인증
			$('#modal_user_id').text(main_user);
			$('#modal_msg_main1').text(join_main_txt);
			$('#modal_msg_sub1').text(join_sub_txt1);
			$('#modal_msg_sub2').text(join_sub_txt2);
			$('#modal_yes_btn').css('display', 'none'); // 확인버튼제거
			$('#modal_cancle_btn').text('확인');
			$('.modal_wrap').css('display', 'flex');
		} else if(key == 'auth'){ // 이메일 인증 o
			$('#modal_user_id').text(main_user);
			$('#modal_msg_main1').text(auth_main_txt);
			$('#modal_msg_sub1').text(auth_sub_txt);
			$('#modal_yes_btn').css('display', 'none'); // 확인버튼제거
			$('#modal_cancle_btn').text('확인');
			$('.modal_wrap').css('display', 'flex');
		} else if(key == 'drop'){ // 회원탈퇴 ?
			$('#modal_user_id').text(main_user);
			$('#modal_msg_main1').text(drop_main_txt);
			$('#modal_msg_sub1').text(drop_sub_txt);
		} else if(key == 'dropResult'){ // 회원탈퇴 o
			$('#modal_msg_main1').text(dropResult_main_txt);
			$('#modal_msg_sub1').text(dropResult_sub_txt);
			$('#modal_yes_btn').css('display', 'none'); // 확인버튼제거
			$('#modal_cancle_btn').text('확인');
			$('.modal_wrap').css('display', 'flex');
		} else if(key == 'dropBoard'){ // 게시글 삭제?
			if('${one.replycnt}' == 0 ){ // 댓글이 없는 경우
				$('#modal_msg_main1').text(dropBoard_main_txt);
				$('.modal_msg_sub').css('display','none');
			} else { // 댓글이 있는 경우
				$('#modal_msg_main1').text(dropBoardNo_main_txt);
				$('#modal_yes_btn').css('display', 'none'); // 확인버튼제거
				$('#modal_cancle_btn').text('확인');
				$('.modal_msg_sub').css('display','none');
			}
		}
		
		$('.close').on('click',function(){
			$('.modal_wrap').css('display','none');
		});
		$('#modal_cancle_btn').on('click',function(){
			$('.modal_wrap').css('display','none');
		});
		$('#modal_yes_btn').on('click',function(){
			if(key == 'dropResult'){
				location.href='${path}/member/dropAction';			
			}
		});
	});

</script>
</html>