<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!doctype html>
	<html lang="en">
	  <head>
		<title>EMS - Welcome Page</title>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="WEB-INF\css\welcome.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap');
h1 {
    font-weight: bold;
}

h1, h2, h3, h4, h5, h6, p, li, a, label {
    margin: 0px;
    padding: 0px;
    font-family: Quicksand, sans-serif;
    font-weight: normal;
    font-style: normal;
    font-stretch: normal;
    letter-spacing: normal;
    color: rgb(15, 32, 53);
    -webkit-font-smoothing: antialiased;
}

.button.blue {
    border: 1px solid rgb(15, 113, 253);
    background-color: rgb(15, 113, 253);
    color: rgb(255, 255, 255);
}

.button.default {
    padding: 12px 30px;
    font-family: Mulish, sans-serif;
    font-style: normal;
    font-weight: 700;
    font-size: 20px;
}

.button.big {
    padding: 10px 32px 8px;
    line-height: unset;
    font-size: 20px;
}

.button {
    display: inline-block;
    font-family: Quicksand, sans-serif;
    font-size: 13px;
    font-weight: normal;
    font-stretch: normal;
    font-style: normal;
    line-height: 38px;
    letter-spacing: 0.52px;
    border-radius: 30px;
    color: rgb(15, 113, 253);
    text-align: center;
    transition: all 0.6s ease-out 0s;
    text-decoration: none !important;
    background: white;
    border: none;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.row {
    display: flex;
    justify-content: center;
    width: 100%;
}

.col-12 {
    text-align: center;
}

.mt-3, .my-3, .mt-md-5, .my-md-5 {
    margin-top: 1rem !important;
    margin-bottom: 1rem !important;
}

@media (max-width: 768px) {
    h1 {
        font-size: 29px;
        text-align: center;
        line-height: 34px;
        margin-top: 0px;
        margin-bottom: 16px;
        font-family: "Quicksand", sans-serif;
        font-weight: bold;
    }

    p {
        font-size: 17px;
        line-height: 20px;
    }
}

@media only screen and (min-width: 768px) {
    h1 {
        margin-top: 0px;
        margin-bottom: 16px;
        text-align: center;
        font-size: 42px;
        font-weight: bold;
        font-family: "Quicksand", sans-serif;
    }

    p {
        font-size: 24px;
        font-weight: 500;
        line-height: 1.12;
    }
}

		</style>
	</head>
	  <body>
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1>Employee Management System</h1>
					<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veritatis odio corporis omnis pariatur ut quidem, aut adipisci numquam porro ducimus in dignissimos perspiciatis? Provident asperiores eos aliquid fugit, veritatis dignissimos!</p>
					<div class="row mt-3 mb-3 mt-md-5 mb-md-5">
						<div class="col-sm-12 col-md-6">
							<form action="login" method="get"><button class="button default blue big btnstartfreetrial" type="submit" name="login">Sign In</button></form>
						</div>
						<div class="col-sm-12 col-md-6">
							<form action="register" method="get"><button class="button big" style="line-height:40px;" type="submit" name="register">Register <i class="fa fa-long-arrow-right"></i></button></form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	  </body>
	</html>