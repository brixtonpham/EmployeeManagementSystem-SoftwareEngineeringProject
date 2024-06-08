<%@include file="include.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.EMS.entity.DirectoryDetails, com.EMS.entity.ATEDetails" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Employee ATE Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap');

        body {
            background-color: #f8f9fa;
            font-family: 'Quicksand', sans-serif;
        }

        .container {
            border-radius: 10px;
            padding: 20px;
            max-width: 80%;
            margin: 50px auto;
        }

        h1, h2 {
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
            max-width: 80%;
            margin: 0 auto;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        select, button {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 2px solid #428efa;
            background-color: #eff4fe;
            font-size: 16px;
            color: #000;
        }

        button {
            background-color: #428efa;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #306fcf;
        }

        .alert {
            text-align: center;
            margin-bottom: 20px;
        }

        .alert-warning {
            color: blue;
        }

        .alert-danger {
            color: red;
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
    <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger" role="alert">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>
    <% if (request.getAttribute("success") != null) { %>
        <div class="alert alert-success" role="alert">
            <%= request.getAttribute("success") %>
        </div>
    <% } %>

    <h1>ATE Details</h1>
    <div class="form-container">
        <h2>Accessing Permission Requested For Following Directory</h2>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th style="display: none;">Ids</th>
                <th>Directory Name</th>
                <th>Requested By</th>
                <th>Status</th>
                <th>Permission</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% if (request.getAttribute("ATE") != null) { %>
                <% ArrayList<ATEDetails> docs = (ArrayList<ATEDetails>) request.getAttribute("ATE"); %>
                <% for (int i = 0; i < docs.size(); i++) { %>
                    <tr>
                        <form name="ate<%=i%>" method="post" action="updateATE">
                            <td style="display: none;">
                                <input type="hidden" name="ateId" value="<%= docs.get(i).getId() %>"/>
                            </td>
                            <td><%= docs.get(i).getDirName() %></td>
                            <td><%= docs.get(i).getCreatedBy() %></td>
                            <td><%= docs.get(i).getAteStatus() %></td>
                            <td>
                                <select name="permission">
                                    <option value="1">Accept</option>
                                    <option value="0">Decline</option>
                                </select>
                            </td>
                            <td>
                                <button type="submit">Respond</button>
                            </td>
                        </form>
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
