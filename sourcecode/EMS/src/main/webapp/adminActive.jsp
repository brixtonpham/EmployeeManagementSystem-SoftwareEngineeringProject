<%@include file="include.jsp" %>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
        <%@ page import="java.util.ArrayList" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="ISO-8859-1">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <title>EMS - Admin Active Employees Page</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous">
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');

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

                    h1 {
                        font-weight: bold;
                        color: #0f2035;
                        text-align: center;
                        margin-bottom: 20px;
                    }

                   

                    .form-inline {
                        display: flex;
                        justify-content: flex-end;
                        margin-bottom: 20px;
                    }

                    .alert {
                        color: red;
                        text-align: center;
                        margin-bottom: 20px;
                    }

                    @media (min-width: 768px) {
                        .container {
                            padding-left: 250px;
                            padding-right: 250px;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="form-container">
                    <% if (request.getAttribute("error") !=null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                        <% } %>
                            <% if (request.getAttribute("failed") !=null) { %>
                                <div class="alert alert-danger">
                                    <%= request.getAttribute("failed") %>
                                </div>
                                <% } %>
                                    <h1>Active Employee List</h1>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th style="display: none;">Id</th>
                                                    <th>Firstname</th>
                                                    <th>Lastname</th>
                                                    <th>RoleType</th>
                                                    <th>Email</th>
                                                    <th>Address</th>
                                                    <th>Phone</th>
                                                    <th>Paycheck</th>
                                                    <th>Organization-Profile</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% if (request.getAttribute("activeEmployees") !=null) { %>
                                                    <% ArrayList<Registration> activeEmployees = (ArrayList
                                                        <Registration>) request.getAttribute("activeEmployees"); %>
                                                            <% for (int i=0; i < activeEmployees.size(); i++) { %>
                                                                <tr>
                                                                    <td style="display: none;">
                                                                        <input type="hidden" name="id"
                                                                            value="<%= activeEmployees.get(i).getId() %>" />
                                                                    </td>
                                                                    <td>
                                                                        <%= activeEmployees.get(i).getFirstname() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= activeEmployees.get(i).getLastname() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= activeEmployees.get(i).getRoles() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= activeEmployees.get(i).getEmail() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= activeEmployees.get(i).getAddress() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= activeEmployees.get(i).getPhone() %>
                                                                    </td>
                                                                    <td>
                                                                        <form name="pay<%= i %>" action="RunPayroll"
                                                                            method="get" class="form-inline">
                                                                            <input type="hidden" name="employeeId"
                                                                                value="<%= activeEmployees.get(i).getId() %>" />
                                                                            <button type="submit">RunPayroll</button>
                                                                        </form>
                                                                    </td>
                                                                    <td>
                                                                        <form name="profile<%= i %>"
                                                                            action="OrganizationProfiles" method="get"
                                                                            class="form-inline">
                                                                            <input type="hidden" name="employeeId"
                                                                                value="<%= activeEmployees.get(i).getId() %>" />
                                                                            <button
                                                                                type="submit">Update-Profile</button>
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