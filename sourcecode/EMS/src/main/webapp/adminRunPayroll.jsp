<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.EMS.entity.Payment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Admin Active Employees Payroll Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap');
        
        body {
            background-color: #f8f9fa;
            font-family: 'Quicksand', sans-serif;
        }

        /* Default styles for screens 768px or smaller */
		.container {
		    margin: auto;
		    padding-left: 80px;
		}
		
		/* Styles for screens wider than 768px */
		@media (min-width: 768px) {
		    .container {
		        margin: auto;
		    	padding-left: 250px;
		    }
		}


        h2 {
            font-weight: bold;
            color: #0f2035;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container {
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 2px solid #428efa;
            background-color: #eff4fe;
            font-size: 16px;
            color: #000;
        }

        input[type="submit"] {
            background-color: #428efa;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #306fcf;
        }

        .alert {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }

        .alert-success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-warning" role="alert">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
        <% if (request.getAttribute("employee") != null && request.getAttribute("payment") != null) { 
            Registration employee = (Registration) request.getAttribute("employee"); 
            Payment pay = (Payment) request.getAttribute("payment"); %>
        <div class="form-container">
            <h2><%= employee.getFirstname() %> <%= employee.getLastname() %> Payroll Details</h2>
            <form action="RunPayroll" method="post">
                <input type="hidden" name="employeeId" value="<%= employee.getId() %>">
                <input type="hidden" name="paymentId" value="<%= pay.getId() %>">
                <input type="hidden" name="bonus" value="<%= pay.getBonus() %>">

                <table>
                    <tbody>
                        <tr style="display: none;">
                            <td>Id</td>
                            <td><input type="hidden" name="employeeId" value="<%= employee.getId() %>"></td>
                        </tr>
                        <tr>
                            <td>Full Name</td>
                            <td><%= employee.getFirstname() %> <%= employee.getLastname() %></td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td><%= employee.getRoles() %></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><%= employee.getEmail() %></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><%= employee.getAddress() %></td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td><%= employee.getPhone() %></td>
                        </tr>
                        <tr>
                            <td>Supervising Manager</td>
                            <td><%= employee.getUsername() %> <%= employee.getPassword() %></td>
                        </tr>
                        <tr>
                            <td>Salary/annum</td>
                            <td><input type="text" name="salary" value="<%= pay.getSalary() %>"></td>
                        </tr>
                        <tr>
                            <td>Bonus/month</td>
                            <td><input type="text" disabled value="<%= pay.getBonus() %>"></td>
                        </tr>
                        <tr>
                            <td>Total/month</td>
                            <td><input type="text" name="total" disabled value="<%= pay.getTotal() %>"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="Update & Run">
                            </td>
                        </tr>    
                    </tbody>
                </table>
            </form>
        </div>
        <% } %>
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
