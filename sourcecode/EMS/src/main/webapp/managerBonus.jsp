<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.EMS.entity.Payment, com.EMS.entity.Registration" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Manager Employees Bonus Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #ffcccc;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            font-weight: bold;
            color: #0f2035;
            text-align: center;
            margin-bottom: 20px;
        }

        .alert {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn {
            background-color: #428efa;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #306fcf;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            h1 {
                font-size: 1.5rem;
            }

            .table th, .table td {
                font-size: 12px;
                padding: 8px;
            }
        }

        @media (max-width: 576px) {
            .row > div {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-warning">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <% if (request.getAttribute("employee") != null && request.getAttribute("payment") != null) { %>
            <% Registration employee = (Registration) request.getAttribute("employee"); %>
            <% Payment pay = (Payment) request.getAttribute("payment"); %>
            <form action="Bonus" method="post">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <h1><%= employee.getFirstname() %> <%= employee.getLastname() %> Payment Details</h1>
                        <tbody>
                            <tr style="display: none;">
                                <td>Id</td>
                                <td style="display: none;">
                                    <input type="hidden" name="employeeId" value="<%= employee.getId() %>"/>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td>PayId</td>
                                <td style="display: none;">
                                    <input type="hidden" name="paymentId" value="<%= pay.getId() %>"/>
                                </td>
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
                                <td><input type="text" class="form-control" disabled name="salary" value="<%= pay.getSalary() %>"/></td>
                            </tr>
                            <tr>
                                <td>Bonus/month</td>
                                <td><input type="text" class="form-control" name="bonus" value="<%= pay.getBonus() %>"/></td>
                            </tr>
                            <tr>
                                <td>Total/month</td>
                                <td><input type="text" class="form-control" disabled name="total" value="<%= pay.getTotal() %>"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <button type="submit" class="btn">Update Bonus</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
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
