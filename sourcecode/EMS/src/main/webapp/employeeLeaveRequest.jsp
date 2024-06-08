<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.EMS.entity.LeaveDetails,com.EMS.entity.Permission,com.EMS.entity.Leave" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Employee/Manager Leave Request Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');
        
        body {
            background-color: #f8f9fa;
            font-family: 'Quicksand', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            max-width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1, h2 {
            font-weight: bold;
            color: #0f2035;
            text-align: center;
            margin-bottom: 20px;
        }

        .alert {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            text-align: left;
            padding: 12px;
        }

        th {
            background-color: #428efa;
            color: white;
        }

        tr:nth-of-type(even) {
            background-color: #f9f9f9;
        }

        .form-control, .btn {
            margin-bottom: 10px;
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

        .btn-submit {
            width: 100%;
        }

        .caption {
            text-align: center;
            margin-bottom: 20px;
        }

        .table thead th {
            font-size: 16px;
        }

        .table tbody td {
            font-size: 14px;
        }

        .leave-status {
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-primary">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
        <h1>Leave Details</h1>
        <div class="row">
            <div class="col-md-6">
                <caption class="caption"><h2>Leave Details</h2></caption>
                <% if (request.getAttribute("leaveNum") != null) { %>
                    <% Leave leavenum = (Leave) request.getAttribute("leaveNum"); %>
                    <p class="leave-status text-danger">Number Of Leaves Remaining: <b><%= leavenum.getLeaveNum() %></b></p>
                <% } %>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="display: none;">Id</th>
                            <th>Details</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (request.getAttribute("leave") != null) { %>
                            <% ArrayList<LeaveDetails> leave = (ArrayList<LeaveDetails>) request.getAttribute("leave"); %>
                            <% for (int i = 0; i < leave.size(); i++) { %>
                                <tr>
                                    <td style="display: none;">
                                        <input type="hidden" name="id" value="<%= leave.get(i).getId() %>"/>
                                    </td>
                                    <td><%= leave.get(i).getDetails() %></td>
                                    <td><%= leave.get(i).getResponse() %></td>
                                    <td><%= leave.get(i).getDate() %></td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <form method="post" action="Leaves">
                    <caption class="caption"><h2>Request Leave</h2></caption>
                    <p></p>
                    <table class="table">
                        <thead>
                            <tr>
                                <th colspan="2">Request Leave Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Details</td>
                                <td><textarea class="form-control" name="leave" required></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <input type="submit" value="Request" class="btn btn-submit">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
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
