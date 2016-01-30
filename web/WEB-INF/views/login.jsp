<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = path+"/";
%>
<html>
  <head>
    <title>DobeHub 国内最大的逗比社交圈儿</title>
    <meta charset="utf-8" />
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=basePath%>favicon.png" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=basePath%>assets/css/ace.min.css" />
	<style>
			body,html{
				margin:0;
				padding:0;
				width:100%;
				height:100%;
				font-family: "微软雅黑","Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
			}

	</style>
	<script src="<%=basePath%>assets/js/md5.js"></script>
  </head>
  
  <body class="login-layout" bgcolor="#CCCCCC">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<span class="red">DobeHub</span>
								</h1>
								<h2><span class="white">一个逗比交流平台</span></h2>
								<h4 class="blue">&copy; 天津职业技术师范大学</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												账户登录
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="email_login" type="text" class="form-control" placeholder="邮箱" />
															<i class="icon-user"></i>
														</span>
													</label>
													<label id="account_error" class="block notice_lab">
														<span class="block red"></span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="password_login" type="password" class="form-control" placeholder="密码" />
															<i class="icon-lock"></i>
														</span>
													</label>
													<label id="password_error" class="block notice_lab">
														<span class="block red"></span>
													</label>
													<div class="space"></div>

													<div class="clearfix">
														<label id="login_error" class="block notice_lab">
															<span class="block red"></span>
														</label>
														<button id="login_btn" type="button" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="icon-key"></i>
															登录
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" onclick="javascript:show_box('forgot-box'); " class="forgot-password-link">
													<i class="icon-arrow-left"></i>
													忘记密码
												</a>
											</div>

											<div>
												<a href="#" onclick="javascript:show_box('signup-box'); " class="user-signup-link">
													加入我们
													<i class="icon-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="icon-key"></i>
												找回密码
											</h4>

											<div class="space-6"></div>
											<p>
												输入邮箱找回密码
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="邮箱" />
															<i class="icon-envelope"></i>
														</span>
													</label>
													<label id="retrieve_error" class="block notice_lab">
														<span class="block red"></span>
													</label>		
													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="icon-lightbulb"></i>
															确认发送！
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /widget-main -->

										<div class="toolbar center">
											<a href="#" onclick="javascript:show_box('login-box'); " class="back-to-login-link">
												返回登陆
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="icon-group blue"></i>
												新用户注册
											</h4>

											<div class="space-6"></div>
											<p> 请填写基本信息: </p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="email_reg" type="email" class="form-control" placeholder="邮箱" />
															<i class="icon-envelope"></i>
														</span>
													</label>
													<label id="email_error" class="block notice_lab">
														<span class="block red"></span>
													</label>		
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="username_reg" type="text" class="form-control" placeholder="用户名" />
															<i class="icon-user"></i>
														</span>
													</label>
													<label id="um_error" class="block notice_lab">
														<span class="block red"></span>
													</label>		
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="password_reg" type="password" class="form-control" placeholder="密码" />
															<i class="icon-lock"></i>
														</span>
													</label>
													<label id="pwd_error" class="block notice_lab">
														<span class="block red"></span>
													</label>		
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="repassword_reg" type="password" class="form-control" placeholder="确认密码" />
															<i class="icon-retweet"></i>
														</span>
													</label>
													<label id="repwd_error" class="block notice_lab">
														<span class="block red"></span>
													</label>	
													<div class="space-24"></div>
													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="icon-refresh"></i>
															重置
														</button>
														<button id="reg_btn" type="button" class="width-65 pull-right btn btn-sm btn-success">
															注册
															<i class="icon-arrow-right icon-on-right"></i>
														</button>
													</div>
													<div class="clearfix">
														<label id="regist_error" class="block notice_lab">
															<span class="block red"></span>
														</label>	
													</div>
												</fieldset>
											</form>
										</div>
										<div class="toolbar center">
											<a href="#" onclick="javascript:show_box('login-box'); " class="back-to-login-link">
												<i class="icon-arrow-left"></i>
												返回登陆
											</a>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /signup-box -->
							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=basePath%>assets/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
		</script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			$(function(){
				registActionEvent();				
			})
			function registActionEvent(){
				$("#login_btn").click(function(){
					loginAction();
				});
				$("#reg_btn").click(function(){
					registAction();
				});
				$("#email_reg").focus(function(){
					clearNotice("email_reg");
				});
				$("#username_reg").focus(function(){
					clearNotice("username_reg");
				});
				$("#password_reg").focus(function(){
					clearNotice("password_reg");
				});
				$("#repassword_reg").focus(function(){
					clearNotice("repassword_reg");
				});
				$("#email_login").focus(function(){
					clearNotice("email_login");
				});
				$("#password_login").focus(function(){
					clearNotice("password_login");
				});
			}
			function registAction(){
				var email = $("#email_reg").val();
				var username = $("#username_reg").val();
				var password = $("#password_reg").val();
				var repassword = $("#repassword_reg").val();
				var json = {email:email,password:hex_md5(password),username:username}
				var flag = true;
				if(!filter.test(email)){
					showAlert("email_error","请填写正确格式的邮箱！");
					$("#email_reg").val("");
					flag = false;
				}
				if(username==""){
					showAlert("um_error","请填写完整的用户名！");
					flag = false;
				}
				if(password==""){
					showAlert("pwd_error","请填写完整的密码！");
					flag = false;
				}else if(password != repassword){
					showAlert("pwd_error","两次密码输入不一致！");
					showAlert("repwd_error","两次密码输入不一致！");
					$("#password_reg").val("");
					$("#repassword_reg").val("");
					flag = false;
				}
				if(repassword==""){
					showAlert("repwd_error","请填写完整的密码！");
					flag = false;
				}
				if(flag){
					$.ajax({
						type:"POST",
						url:"<%=basePath%>user/regist",
						dataType:"json",     
						contentType:"application/json",
						data:JSON.stringify(json),
						success:function(data){
							clearAllNotice();
							if(data.result.code==500){
								showAlert("email_error", data.result.message);
							}else{
								window.location.href = "<%=basePath%>index"
							}
						}
					});
				}
			}
			
			function loginAction(){
				var email = $("#email_login").val();
				var password = $("#password_login").val();
				var json = {email:email,password:hex_md5(password)}
				var flag = true;
				if(!filter.test(email)){
					showAlert("account_error","请填写正确格式的邮箱")
					flag = false;
				}
				if(password==""){
					showAlert("password_error","请填写完整的密码")
					flag = false;
				}
				if(flag){
					$.ajax({
						type:"POST",
						url:"<%=basePath%>user/login",
						dataType:"json",     
						contentType:"application/json",
						data:JSON.stringify(json),
						success:function(data){
							if(data.result.code==200){
								window.location.href = "<%=basePath%>index"
							}else{
								showAlert("login_error", data.result.message);
							}
						}
					});
				}
			}
			function showAlert(id,message){
				$("#"+id+">span").html(message)
			}
			function show_box(id) {
		 		jQuery('.widget-box.visible').removeClass('visible');
		 		jQuery('#'+id).addClass('visible');
		 		$(".notice_lab>span").html("")
		 		return false;
			}
			function clearAllNotice(){
				$(".notice_lab>span").html("")
			}
			function clearNotice(id){
				$("#"+id).parent().parent().next().children().html("");
			}
		</script>
</body>
</html>
