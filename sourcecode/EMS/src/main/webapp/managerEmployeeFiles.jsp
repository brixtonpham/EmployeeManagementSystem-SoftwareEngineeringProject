<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.EMS.entity.DirectoryDetails,com.EMS.entity.Employeedocs" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Sub-Employees Uploaded Page</title>
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
        <h1>Documents Details</h1>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <h2>Documents Available</h2>
                        <thead>
                            <tr>
                                <th style="display: none;">Ids</th>
                                <th>Directory Name</th>
                                <th>Docs</th>
                                <th>Comments</th>
                                <th>Uploaded By</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (request.getAttribute("docs") != null) { %>
                                <% ArrayList<Employeedocs> docs = (ArrayList<Employeedocs>) request.getAttribute("docs"); %>
                                <% for (int i = 0; i < docs.size(); i++) { %>
                                    <tr>
                                        <td style="display: none;"><input type="hidden" name="id" value="<%= docs.get(i).getId() %>"/></td>
                                        <td><%= docs.get(i).getDirectoryName() %></td>
                                        <td><%= docs.get(i).getDocName() %></td>
                                        <td><%= docs.get(i).getComment() %></td>
                                        <td><%= docs.get(i).getCreatedBy() %></td>
                                        <td><%= docs.get(i).getDate() %></td>
                                        <td>
                                            <form action="DownloadDoc" method="post">
                                                <input type="hidden" name="docId" value="<%= docs.get(i).getId() %>"/>
                                                <input type="submit" value="View" class="btn btn-primary btn-sm">
                                            </form>
                                        </td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
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
