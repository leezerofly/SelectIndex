<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>login</title>
  
  <link href="css/bootstrap.css" rel="stylesheet" media="screen">
  <link href="css/main.css" rel="stylesheet" media="screen">
</head>
<body>
    <div class="container">
        <!-- login form box -->
        <form class="form-signin" method="post" action="LoginServlet" name="loginform">

            <h2 class="form-signin-heading">请登录</h2>
            
            <!-- <label for="login_input_username">Username</label> -->
            <input id="login_input_username" class="login_input form-control" type="text" name="userName" placeholder="请输入用户名" required autofocus/>

            <!-- <label for="login_input_password">Password</label> -->
            <input id="login_input_password" class="login_input form-control" type="password" name="userPasswd" placeholder="请输入密码" autocomplete="off" required />

            <input class="btn btn-lg btn-primary btn-block" type="submit" name="login" value="登录" />

        </form>
    </div>
</body>
</html>
