<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Frugal</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>


	<div class="container">
		<div class="row text-center" id="h1">
			<h1>frugal</h1>
			<!-- <p>Budgeting through amalgamation.</p> -->
		</div>
		<div class="row text-center">
			<p>Through acrimonious amalgamation, you and your partner can
				climb the mountain to financial freedom.</p>
		</div>



		<div class="container">
			<div class="row main">
				<div class="main-login main-center">
					<form class="" method="POST" action="login.do">

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-users fa" aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="username"
										id="usernamename" placeholder="Enter your Username" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="password" id="email"
										placeholder="Enter your Password" />
								</div>
							</div>
						</div>
						<div class="text-center">
							<span id="badlogin">
								<c:if test="${! empty badLogin}">
									${badLogin}
								</c:if>
							</span>
						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-default btn-block">Sign
								In</button>
						</div>
					</form>
					<form action="CreateFamily.do" method="POST">
						<div class="form-group text-center">
							<button type="submit" class="btn btn-default btn-block">Sign
								Up</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>