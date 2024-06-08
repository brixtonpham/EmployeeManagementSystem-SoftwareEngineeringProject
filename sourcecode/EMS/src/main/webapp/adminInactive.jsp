<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Admin Inactive Employees Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap');

        body {
            background-color: #f8f9fa;
            font-family: 'Quicksand', sans-serif;
            display: flex;
        }

        .table-container {
            margin: 50px auto;
            padding-left: 80px;
        }

        @media (min-width: 768px) {
            .table-container {
                padding-left: 250px;
            }
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

        .table thead th {
            background-color: #0056b3;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .form-inline button {
            margin-left: 10px;
        }

        .form-container {
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 20px;
            max-width: 80%;
            margin: 50px auto;
        }

        .table-responsive {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <% if(request.getAttribute("success") != null) { %>
        <div class="alert alert-success">
            <%= request.getAttribute("success") %>
        </div>
    <% } %>
    <% if(request.getAttribute("failed") != null) { %>
        <div class="alert alert-danger">
            <%= request.getAttribute("failed") %>
        </div>
    <% } %>

    <div class="form-container">
        <h1 class="text-center">Inactive Employee List</h1>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th style="display: none;">Id</th>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Select Manager</th>
                        <th>Select RoleType</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(request.getAttribute("inActiveEmployees") != null) { %>
                        <% ArrayList<Registration> inActiveEmployees = (ArrayList<Registration>) request.getAttribute("inActiveEmployees"); %>
                        <% for (int i = 0; i < inActiveEmployees.size(); i++) { %>
                            <form name="save<%= i %>" action="InactiveUsers" method="post" class="form-inline">
                                <tr>
                                    <td style="display: none;">
                                        <input type="hidden" name="employeeId" value="<%= inActiveEmployees.get(i).getId() %>" />
                                    </td>
                                    <td><%= inActiveEmployees.get(i).getFirstname() %></td>
                                    <td><%= inActiveEmployees.get(i).getLastname() %></td>
                                    <td><%= inActiveEmployees.get(i).getEmail() %></td>
                                    <td><%= inActiveEmployees.get(i).getAddress() %></td>
                                    <td><%= inActiveEmployees.get(i).getPhone() %></td>
                                    <td>
                                        <select name="managerId" class="form-control">
                                            <option value="-1">Select Manager</option>
                                            <% if(request.getAttribute("mangersList") != null) { %>
                                                <% ArrayList<Registration> mangersList = (ArrayList<Registration>) request.getAttribute("mangersList"); %>
                                                <% for (int z = 0; z < mangersList.size(); z++) { %>
                                                    <option value="<%= mangersList.get(z).getId() %>">
                                                        <%= mangersList.get(z).getFirstname() %> <%= mangersList.get(z).getLastname() %>
                                                    </option>
                                                <% } %>
                                            <% } %>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="roleType" class="form-control">
                                            <option value="-1">Select Role</option>
                                            <option value="2">Manager</option>
                                            <option value="3">Employee</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </td>
                                </tr>
                            </form>
                        <% } %>
                    <% } %>
                </tbody>
            </table>
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
