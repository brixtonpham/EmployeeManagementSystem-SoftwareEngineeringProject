<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!doctype html>
    <html lang="en">

    <head>
        <title>EMS - Login</title>
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
        
                * {
                    font-family: "Quicksand", sans-serif;
                    font-weight: normal;
                    font-stretch: normal;
                    font-style: normal;
                    letter-spacing: normal;
                    line-height: 1;
                    margin:0;
                    padding:0;
                }
        
                *,
                ::after,
                ::before {
                    box-sizing: border-box;
                }
        
                .login {
                    height: 100vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background-color: #f8f9fa;
                }
        
                .login-form {
                    padding: 80px 30px 12px 30px;
                    max-width: 611px;
                    background: white;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    border-radius: 10px;
                }
        
                .login-form .logo {
                    width: 100%;
                    max-width: 335px;
                    height: unset;
                    margin-bottom: 20px;
                }
        
                .login-form img {
                    margin-top: -5px;
                    width: 32px;
                }
        
                .login-form h1 {
                    margin-top: 38px;
                    font-family: "Quicksand", sans-serif;
                    font-size: 55px;
                    font-weight: 600;
                    line-height: .91;
                    color: #0f2035;
                    text-align: left;
                }
        
                #frm_login {
                    margin-bottom: 5px;
                }
        
                .login-form .form-group input[type=text],
                .login-form .form-group input[type=password] {
                    margin-top: 20px;
                    padding: 15px 15px 10px 15px;
                    width: 100%;
                    border: solid 2px #428efa;
                    background-color: #eff4fe;
                    font-size: 22px;
                    color: #000;
                }
        
                .login-form .form-group {
                    position: relative;
                    width: 100%;
                }
        
                .login-form .form-group label {
                    display: block;
                    margin: 0;
                    font-size: 17px;
                    line-height: 1.06;
                    letter-spacing: .56px;
                    color: #0f2035;
                    text-align: left;
                    transition: top 700ms cubic-bezier(.23, 1, .32, 1) 0ms, left 700ms cubic-bezier(.23, 1, .32, 1) 0ms, font-size 700ms cubic-bezier(.23, 1, .32, 1) 0ms, color 700ms cubic-bezier(.23, 1, .32, 1) 0ms;
                }
        
                .login-form .form-group>label {
                    position: absolute;
                    top: 39px;
                    left: 18px;
                }
        
                .login-form .form-group.error label,
                .login-form .form-group input:focus+label,
                .login-form .form-group input:not(:placeholder-shown)+label {
                    left: 0;
                    top: 0;
                }
        
                .login-form #btn-login {
					    padding: 0 0px;
					    width: 33%;
					    height: 36px;
					    border: solid 1px #0f71fd;
					    background-color: #0f71fd;
					    font-size: 16px;
					    font-weight: 500;
					    line-height: 24px;
					    letter-spacing: 0.92px;
					    color: #fff;
					    text-align: center;
					    cursor: pointer;
					    outline: 0;
					    border-radius: 30px;
                }
                .login-form #btn-login:hover{
                	border: solid 1px #0044a4;
					background-color: #0044a4;
					color: #fff;
                }
                .login-formn .button:hover {
                    border: solid 1px #0044a4;
    				background-color: #0044a4;
    				color: #fff;
                }
        
                .new-acct .button {
                	    color: #0f2035;
					    background-color: white;
					    font-size: 14px;
					    font-weight: 500;
					    line-height: 30px;
					    border: none;
					    transition: 0.2s;
					    margin: 4px;
                }
        
                .new-acct .button:hover {
                   color: #0044a4;

                }
            </style>
    </head>

    <body>
        <div class="login">
            <div class="class=" col-xl-auto col-lg-12 d-table-cell align-self-center">
                <div class="login-form">
                    <div class="logo">
                      

                    </div>
                    <h1>Login</h1>
                    <form action="login" method="post" id="frm_login">
                        <% if(request.getAttribute("loginerror") !=null) { %>
                            <p style="color:red;">
                                <%= request.getAttribute("loginerror") %>
                            </p>
                            <% } %>

                                <div class="form-group">
                                    <input class="sign-in-input dynamic-label" data-val="true"
                                        data-val-length="The field Username must be a string with a maximum length of 25."
                                        data-val-length-max="25" data-val-required="The Username field is required."
                                        id="tbUsername" maxlength="25" name="username" placeholder="&nbsp;" tabindex="3"
                                        type="text" value="">
                                    <label id="tbUsernameLabelID" for="tbUsername">Username</label>
                                    <span
                                        class="field-validation-valid login-validation-error-holder error-msg-text text-shadow"
                                        data-valmsg-for="username" data-valmsg-replace="true"></span>
                                </div>
                                <div class="form-group">
                                    <input class="sign-in-input dynamic-label" data-val="true"
                                        data-val-length="The field Password must be a string with a maximum length of 25."
                                        data-val-length-max="25" data-val-required="The Password field is required."
                                        id="tbPassword" maxlength="25" name="password" placeholder="&nbsp;" tabindex="3"
                                        type="password" value="">
                                    <label id="tbPasswordLabelID" for="tbPassword">Password</label>
                                    <span
                                        class="field-validation-valid login-validation-error-holder error-msg-text text-shadow"
                                        data-valmsg-for="password" data-valmsg-replace="true"></span>
                                </div>
                                <button id="btn-login" type="submit" class="button blue">Login</button>
                    </form>
                    <div class="new-acct">
                        <form action="register" method="get">

                            <button class="button big" type="submit" name="register">Don't have an account?, <b>Click
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