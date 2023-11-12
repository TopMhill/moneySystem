<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>

<!DOCTYPE html>
<meta charset="utf-8">
<html>
	<head>
		<title>添加管理员 </title>
		
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

		
        
        body{
        	align-items: center;
			background:url("back.jpg") no-repeat;
			background-attachment: fixed;
            background-size: 100% 100%;
            background-position: center center;
            overflow: auto;
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
				
<jsp:include page="getuser.jsp"/>
<center>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
  <div class="container right-panel-active" vlign="center">
    
        <form  method="post" id="mkforid"  action="添加管理员成功.jsp" onsubmit="return login_chkinput();" class="form">
            <h2 class="form__title">添加管理员</h2>

            <input type="text" id="admin_account" name="admin_account" placeholder="Account Number" class="input">
            <input type="password" name="admin_password" placeholder="Password" class="input">
            <input type="submit" value="添加">
        </form>
  </div>
</center>

	
<script type="text/javascript">
function $$(id)
{
	return document.getElementById(id);
}

function login_chkinput()
{
	var formm=document.getElementById("mkforid");
	//alert(formm.username.value);
	if(formm.admin_account.value=="")
	{
		alert("请输入用户名!");
		formm.admin_account.focus();
		return false;
	}
	if(formm.admin_password.value=="")
	{
		alert("请输入密码！");
		formm.admin_password.focus();
		return false;
	}
	
	return true;
}

function hello()
{
	alert("good good study, day day happy!");
}


</script>
	
	</body>
</html>