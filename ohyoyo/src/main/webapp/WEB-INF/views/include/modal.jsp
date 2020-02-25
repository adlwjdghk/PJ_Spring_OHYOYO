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
		position: fixed;
		z-index: 1000;
		background-color: rgba(0,0,0,0.4);
		overflow: auto;
		width: 100%;
		height: 100%;
		/*display: none;*/
		display: flex;
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
		padding: 50px 10px;
		font-size: 17px;
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
	.user{
		font-size: 20px;
	}
	.det_button_wrap{
		margin: 0 10px;
		padding: 0 0 30px;
		/*border-top: 1px solid #d4d4d4;*/
		text-align: center;
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
				<span class="user"><span class="user_id"></span>&nbsp;회원님</span><br>
				<br>
				<span>정말 탈퇴하시겠습니까?</span>
			</div>
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
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on('click','.close', function() {
		$('.modal_wrap').css('display','none');
	});
</script>
</html>