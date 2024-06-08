<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!doctype html>
    <html lang="en">

    <head>
        <title>EMS - Registration</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap');

            body {
                background-color: #f8f9fa;
                font-family: 'Quicksand', sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                padding:0;
            }

            h1,
            h5 {
                font-weight: bold;
                color: #0f2035;
            }
            h1{
            	margin-top:50px;
            }

            .container {
   	 			height: fit-content;
            }
            .card {
        
            	height: fit-content;
                margin: 250px auto 50px auto;
                /* width: 100%; */
                max-width: 500px;
                background: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
          
            }
            .card-body {
                padding: 20px;
            }

            .form-group label {
                color: #0f2035;
                font-weight: 500;
            }

            .form-control {
                border-radius: 5px;
                border: 2px solid #428efa;
                background-color: #eff4fe;
                font-size: 16px;
                color: #000;
            }

            .button {
                display: inline-block;
                padding: 10px 32px;
                font-family: 'Quicksand', sans-serif;
                font-size: 18px;
                font-weight: 500;
                line-height: 50px;
                letter-spacing: 0.92px;
                border-radius: 30px;
                color: #fff;
                text-align: center;
                background-color: #428efa;
                border: none;
                cursor: pointer;
                transition: all 0.6s ease-out;
                margin-bottom: 10px;
                width: 100%;
            }

            .button:hover {
                background-color: #0044a4;
            }

            .card-footer {
                background-color: white;
                border: none;
                padding:0;
                
            }

            .card-footer .button {
                color: #0f2035;
                background-color: white;
                font-size: 14px;
                font-weight: 500;
                transition: 0.2s;
            }

            .card-footer .button:hover {
            color: #0056b3;
            }

            @media (max-width: 768px) {
                .button {
                    height: 40px;
                    font-size: 16px;
                    line-height: 40px;
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="card">
                        <h1 class="mb-4 text-center">Registration Page</h1>
            
                <div class="card-body">
                    <h5 class="card-title text-center">Please fill in all the following information:</h5>
                    <form action="register" method="post" class="mt-3 ">
                        <% if (request.getAttribute("error") !=null) { %>
                            <p style="color:red;">
                                <%= request.getAttribute("error") %>
                            </p>
                            <% } %>
                                <div class="form-group">
                                    <label for="firstname">First Name</label>
                                    <input name="firstname" type="text" class="form-control" maxlength="25"
                                        placeholder="First Name">
                                </div>
                                <div class="form-group">
                                    <label for="lastname">Last Name</label>
                                    <input name="lastname" type="text" class="form-control" maxlength="25"
                                        placeholder="Last Name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input name="email" type="email" class="form-control" maxlength="30"
                                        placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input name="address" type="text" class="form-control" maxlength="30"
                                        placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input name="phone" type="text" class="form-control" maxlength="10"
                                        placeholder="Phone">
                                </div>
                                <div class="form-group">
                                    <label for="uid">Username</label>
                                    <input name="uid" type="text" class="form-control" maxlength="10"
                                        placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" type="password" class="form-control" maxlength="10"
                                        placeholder="Password">
                                </div>
                                <button type="submit" class="button">Register</button>
                    </form>
                    <div class="card-footer text-muted">
                        <form action="login" method="get">
                            <button class="button big" type="submit" name="login">Already have an account? <b>Click
                                    here</b> <i class="fa fa-long-arrow-right"></i></button>
                        </form>
                    </div>
                </div>
               
            </div>

        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    </body>

    </html>