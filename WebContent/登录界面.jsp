<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>

<!DOCTYPE html>
<meta charset="utf-8">
<html>
	<head>
		<title>学习网站登陆界面 </title>
		
		<style>
        :root {
            /* COLORS */
            --white: #e9e9e9;
            --gray: #333;
            --blue: #0367a6;
            --lightblue: #008997;

            /* RADII */
            --button-radius: 0.7rem;

            /* SIZES */
            --max-width: 758px;
            --max-height: 420px;

            font-size: 16px;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
            Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
        }

        body {
            align-items: center;
            background-color: var(--white);
            background: url("back1.jpg");
            /* 决定背景图像的位置是在视口内固定，或者随着包含它的区块滚动。 */
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            display: grid;
            height: 100vh;
            place-items: center;
        }

        .form__title {
            font-weight: 300;
            margin: 0;
            margin-bottom: 1.25rem;
        }

        .link {
            color: var(--gray);
            font-size: 0.9rem;
            margin: 1.5rem 0;
            text-decoration: none;
        }

        .container {
            background-color: var(--white);
            border-radius: var(--button-radius);
            box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
            0 0.7rem 0.7rem rgba(0, 0, 0, 0.22);
            height: var(--max-height);
            max-width: var(--max-width);
            overflow: hidden;
            position: relative;
            width: 100%;
        }

        .container__form {
            height: 100%;
            position: absolute;
            top: 0;
            transition: all 0.6s ease-in-out;
        }

        .container--student {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container.right-panel-active .container--student {
            transform: translateX(100%);
        }

        .container--teacher {
            left: 0;
            opacity: 0;
            width: 50%;
            z-index: 1;
        }

        .container.right-panel-active .container--teacher {
            animation: show 0.6s;
            opacity: 1;
            transform: translateX(100%);
            z-index: 5;
        }

        .container__overlay {
            height: 100%;
            left: 50%;
            overflow: hidden;
            position: absolute;
            top: 0;
            transition: transform 0.6s ease-in-out;
            width: 50%;
            z-index: 100;
        }

        .container.right-panel-active .container__overlay {
            transform: translateX(-100%);
        }

        .overlay {
            background-color: var(--lightblue);
            background: url("picture/1.jpg");
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
            left: -100%;
            position: relative;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
            width: 200%;
        }

        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }

        .overlay__panel {
            align-items: center;
            display: flex;
            flex-direction: column;
            height: 100%;
            justify-content: center;
            position: absolute;
            text-align: center;
            top: 0;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
            width: 50%;
        }

        .overlay--left {
            transform: translateX(-20%);
        }

        .container.right-panel-active .overlay--left {
            transform: translateX(0);
        }

        .overlay--right {
            right: 0;
            transform: translateX(0);
        }

        .container.right-panel-active .overlay--right {
            transform: translateX(20%);
        }

        .btn {
            background-color: var(--blue);
            background-image: linear-gradient(90deg, var(--blue) 0%, var(--lightblue) 74%);
            border-radius: 20px;
            border: 1px solid var(--blue);
            color: var(--white);
            cursor: pointer;
            font-size: 0.8rem;
            font-weight: bold;
            letter-spacing: 0.1rem;
            padding: 0.9rem 4rem;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }

        .form>.btn {
            margin-top: 1.5rem;
        }

        .btn:active {
            transform: scale(0.95);
        }

        .btn:focus {
            outline: none;
        }

        .form {
            background-color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 3rem;
            height: 100%;
            text-align: center;
        }

        .input {
            background-color: #fff;
            border: none;
            padding: 0.9rem 0.9rem;
            margin: 0.5rem 0;
            width: 100%;
        }

        @keyframes show {

            0%,
            49.99% {
                opacity: 0;
                z-index: 1;
            }

            50%,
            100% {
                opacity: 1;
                z-index: 5;
            }
        }
    </style>
		
	</head>
	<body >
				

  <div class="container right-panel-active">
    <!-- 员工登录 -->
    <div class="container__form container--student">
        <form  method="post" id="mkforid"  accept-charset="utf-8" action="登录成功.jsp" onsubmit="return login_chkinput();" class="form">
            <h2 class="form__title">员工登录</h2>
            <div align="center">
   				<input type="radio" checked="true" name="poit" value="customer">员工<br/>
			</div>
            <input type="text" id="username" name="username" onblur="login_username_check()" placeholder="Account Number" class="input">
            <input type="password" onblur="login_password_check()" name="password" placeholder="Password" class="input">
            <input type="submit" value="登录">
        </form>
    </div>


    <!-- 管理员登录-->
    <div class="container__form container--teacher">
        <form  method="post" id="mkforid1"  action="登录成功.jsp" onsubmit="return login_chkinput1();" class="form">
            <h2 class="form__title">管理员登录</h2>
            <div align="center">
				<input type="radio" checked="true" name="poit" value="administor">管理员<br/>
			</div>
            <input type="text" id="username" name="username" onblur="login_username_check()" placeholder="Account Number" class="input">
            <input type="password" onblur="login_password_check()" name="password" placeholder="Password" class="input">
            <input type="submit" value="登录">
        </form>
    </div>

    <!-- 使滚动条显示在内容的上层 -->
    <div class="container__overlay">
        <div class="overlay">
            <div class="overlay__panel overlay--left">
                <button class="btn" id="student">我是员工</button>
            </div>
            <div class="overlay__panel overlay--right">
                <button class="btn" id="teacher">我是管理员</button>
            </div>
        </div>
    </div>
</div>
	
<script type="text/javascript">
function $$(id)
{
	return document.getElementById(id);
}
function login_username_check()
{//alert("?");
	var formm=document.getElementById("mkforid");
	if(formm.username.value.length<6)
	{
		$$('sername').innerHTML="长度过短";
		$$('sername').className="failure";
	}
	else 
	{
		$$('sername').innerHTML="长度合适";
		$$('sername').className="success";
	}
}

function login_password_check()
{
	var formm=document.getElementById("mkforid");
	if(formm.password.value.length<6)
	{
		$$('assword').innerHTML="长度过短";
		$$('assword').className="failure";
	}
	else 
	{
		$$('assword').innerHTML="长度合适";
		$$('assword').className="success";
	}
}

function login_chkinput()
{
	var formm=document.getElementById("mkforid");
	//alert(formm.username.value);
	if(formm.username.value=="")
	{
		alert("请输入用户名!");
		formm.username.focus();
		return false;
	}
	if(formm.password.value=="")
	{
		alert("请输入密码！");
		formm.password.focus();
		return false;
	}
	
	return true;
}

function login_chkinput1()
{
	var formm=document.getElementById("mkforid1");
	//alert(formm.username.value);
	if(formm.username.value=="")
	{
		alert("请输入用户名!");
		formm.username.focus();
		return false;
	}
	if(formm.password.value=="")
	{
		alert("请输入密码！");
		formm.password.focus();
		return false;
	}
	
	return true;
}

function hello()
{
	alert("good good study, day day happy!");
}

<!--滑动界面-->
    const studentBtn = document.getElementById("student");
    const teacherBtn = document.getElementById("teacher");
    const container = document.querySelector(".container");

    studentBtn.addEventListener("click", () => {
        container.classList.remove("right-panel-active");
    });

    teacherBtn.addEventListener("click", () => {
        container.classList.add("right-panel-active");
    });

</script>
	
	</body>
</html>