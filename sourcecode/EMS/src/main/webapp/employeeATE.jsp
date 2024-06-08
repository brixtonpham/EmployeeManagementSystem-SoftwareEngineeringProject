<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.EMS.entity.DirectoryDetails,com.EMS.entity.ATEDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Employee ATE Page</title>
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
            max-width: 80%;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        thead th {
            background-color: #428efa;
            color: white;
        }

        tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        tbody tr:last-of-type {
            border-bottom: 2px solid #428efa;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: 2px solid #428efa;
            background-color: #eff4fe;
            font-size: 16px;
            color: #000;
        }

        .btn-submit {
            background-color: #428efa;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #306fcf;
        }
    </style>
</head>
<body>
    <div class="container">
        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-info">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
            <div class="alert alert-success">
                <%= request.getAttribute("success") %>
            </div>
        <% } %>
        <h1>ATE Details</h1>
        <div class="row">
            <div class="col-md-6">
                <h2>Access Requested For Following Directory</h2>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="display: none;">Id</th>
                            <th>Directory Name</th>
                            <th>Supervised By</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (request.getAttribute("ATE") != null) { %>
                            <% ArrayList<ATEDetails> docs = (ArrayList<ATEDetails>) request.getAttribute("ATE"); %>
                            <% for (int i = 0; i < docs.size(); i++) { %>
                                <tr>
                                    <td style="display: none;">
                                        <input type="hidden" name="id" value="<%= docs.get(i).getId() %>" />
                                    </td>
                                    <td><%= docs.get(i).getDirName() %></td>
                                    <td><%= docs.get(i).getCreatedBy() %></td>
                                    <td><%= docs.get(i).getAteStatus() %></td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <h2>Request Access To Any Protected Directory Listed</h2>
                <form method="post" action="ATE">
                    <div class="form-group">
                        <label for="directory">Directory*</label>
                        <select name="directory" class="form-control">
                            <option value="-1">Select Protected Directory</option>
                            <% if (request.getAttribute("directory") != null) { %>
                                <% ArrayList<DirectoryDetails> directory = (ArrayList<DirectoryDetails>) request.getAttribute("directory"); %>
                                <% for (int z = 0; z < directory.size(); z++) { %>
                                    <option value="<%= directory.get(z).getId() %>"><%= directory.get(z).getDirectoryName() %></option>
                                <% } %>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group text-center">
                        <button type="submit" class="btn-submit">Request</button>
                    </div>
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
