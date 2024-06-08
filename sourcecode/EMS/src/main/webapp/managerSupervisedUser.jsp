<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Manager Employees Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Quicksand', sans-serif;
        }

        .container {
            max-width: 100%;
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
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #306fcf;
        }

        .table-responsive {
            margin-bottom: 20px;
        }

        @media (max-width: 1024px) {
            .table-responsive {
                overflow-x: auto;
            }
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
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        <% if (request.getAttribute("failed") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("failed") %>
            </div>
        <% } %>
        <div class="table-responsive">
            <table class="table table-bordered">
                <h1>Employee List</h1>
                <thead class="thead-dark">
                    <tr>
                        <th style="display: none;">Id</th>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>RoleType</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Bonus</th>
                        <th>Leave Details</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (request.getAttribute("activeEmployees") != null) { %>
                        <% ArrayList<Registration> activeEmployees = (ArrayList<Registration>) request.getAttribute("activeEmployees"); %>
                        <% for (int i = 0; i < activeEmployees.size(); i++) { %>
                            <tr>
                                <td style="display: none;"><input type="hidden" name="id" value="<%= activeEmployees.get(i).getId() %>"/></td>
                                <td><%= activeEmployees.get(i).getFirstname() %></td>
                                <td><%= activeEmployees.get(i).getLastname() %></td>
                                <td><%= activeEmployees.get(i).getRoles() %></td>
                                <td><%= activeEmployees.get(i).getEmail() %></td>
                                <td><%= activeEmployees.get(i).getAddress() %></td>
                                <td><%= activeEmployees.get(i).getPhone() %></td>
                                <td>
                                    <form name="bonus<%= i %>" action="Bonus" method="get">
                                        <input type="hidden" name="employeeId" value="<%= activeEmployees.get(i).getId() %>"/>
                                        <button type="submit" class="btn btn-primary">Bonus</button>
                                    </form>
                                </td>
                                <td>
                                    <form name="leave<%= i %>" action="LeavesResponse" method="get">
                                        <input type="hidden" name="employeeId" value="<%= activeEmployees.get(i).getId() %>"/>
                                        <button type="submit" class="btn btn-primary">Leave</button>
                                    </form>
                                </td>
                            </tr>
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
