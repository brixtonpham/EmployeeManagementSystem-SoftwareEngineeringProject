<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.EMS.entity.DirectoryDetails,com.EMS.entity.Permission" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Manager Directory Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');
        
        body {
            background-color: #f8f9fa;
            font-family: 'Quicksand', sans-serif;
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

        @media (max-width: 1024px) {
            .row {
                flex-direction: column;
            }

            .table-responsive {
                overflow-x: auto;
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            h1, h2 {
                font-size: 1.5rem;
            }

            .btn {
                padding: 5px 10px;
            }

            .table thead th, .table tbody td {
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
        <center>
        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-warning">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
        <h1>Directory Details</h1>
        <div class="row">
            <div class="col-md-6">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <h2>Directory Available</h2>
                        <thead>
                            <tr>
                                <th style="display: none;">Ids</th>
                                <th>Created By</th>
                                <th>Directory Name</th>
                                <th>Permission</th>
                                <th>Accessible To</th>
                                <th>ATE Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (request.getAttribute("directories") != null) { %>
                                <% ArrayList<DirectoryDetails> directories = (ArrayList<DirectoryDetails>) request.getAttribute("directories"); %>
                                <% for (int i = 0; i < directories.size(); i++) { %>
                                    <tr>
                                        <td style="display: none;"><input type="hidden" name="id" value="<%= directories.get(i).getId() %>"/></td>
                                        <td><%= directories.get(i).getCreatedBy() %></td>
                                        <td><%= directories.get(i).getDirectoryName() %></td>
                                        <td><%= directories.get(i).getPermissions() %></td>
                                        <td><%= directories.get(i).getAccessibleBy() %></td>
                                        <td><%= directories.get(i).getPermissionId() == 3 ? directories.get(i).getAteBy() : "" %></td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6">
                <form method="post" action="Directories">
                    <table class="table">
                        <h2>To Create New Directory</h2>
                        <tbody>
                            <tr>
                                <td>Directory Name</td>
                                <td><input type="text" name="directory" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>Permission</td>
                                <td>
                                    <select name="permission" class="form-control" required>
                                        <option value="-1">Select Permission</option>
                                        <% if (request.getAttribute("permission") != null) { %>
                                            <% ArrayList<Permission> permission = (ArrayList<Permission>) request.getAttribute("permission"); %>
                                            <% for (int z = 0; z < permission.size(); z++) { %>
                                                <option value="<%= permission.get(z).getId() %>"><%= permission.get(z).getPermission() %></option>
                                            <% } %>
                                        <% } %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <input type="submit" value="Create" class="btn btn-primary btn-submit">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <form method="post" action="updatePermission">
                    <table class="table">
                        <h2>To Update Permission of Directory</h2>
                        <tbody>
                            <tr>
                                <td>Directory</td>
                                <td>
                                    <select name="pubDir" class="form-control" required>
                                        <option value="-1">Select Directory</option>
                                        <% if (request.getAttribute("directories") != null) { %>
                                            <% ArrayList<DirectoryDetails> directory = (ArrayList<DirectoryDetails>) request.getAttribute("directories"); %>
                                            <% for (int z = 0; z < directory.size(); z++) { %>
                                                <% if (directory.get(z).getPermissionId() == 1) { %>
                                                    <option value="<%= directory.get(z).getId() %>"><%= directory.get(z).getDirectoryName() %></option>
                                                <% } %>
                                            <% } %>
                                        <% } %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Permission</td>
                                <td>
                                    <select name="newPermission" class="form-control" required>
                                        <option value="-1">Change Permission</option>
                                        <option value="2">Private</option>
                                        <option value="3">Protected</option>
                                        <option value="4">Default</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <input type="submit" value="Change" class="btn btn-primary btn-submit">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        </center>
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
