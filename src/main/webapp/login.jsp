<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!doctype html>
<html lang="en">
  <head>
  	<title>Connexion</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/menu.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">

	<div class="site-mobile-menu">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
			<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
		</div>

		<header class="site-navbar" role="banner">

		<div class="container">
			<div class="row align-items-center">


			<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>

			</div>

			</div>
		</div>

		</header>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Connexion</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">

		      	<form action="LoginServlet" method="POST" class="signin-form">
		      	    <% if(request.getAttribute("errMessage")!=null){ String error = request.getAttribute("errMessage").toString();%>
                    <div  style="color : red"><%=error%></div>
                    <% }%>
                    <div class="form-group">
		      			<input type="text" name="email"  class="form-control" placeholder="E-mail" required>
                    </div>
	            <div class="form-group">
	              <input id="password-field" name="password" type="password" class="form-control" placeholder="Mot de passe" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3">Se connecter</button>
	            </div>

	            <div class="form-group">
	            	<a href="RegisterServlet" text-align="center">Pas encore de compte ? inscrivez vous</a>
	            </div>
	          </form>
		</div>
	</section>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/popper.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

	</body>
</html>