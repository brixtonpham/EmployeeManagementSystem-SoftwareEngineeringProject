<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.EMS.entity.DirectoryDetails,com.EMS.entity.Employeedocs" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EMS - Employee Upload/Download Page</title>
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
            max-width: 100%;
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

        
    </style>
</head>
<body>
    <div class="container">
        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-primary">
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
            <div class="col-md-6 mb-3">
                <caption class="caption"><h2>Documents Available</h2></caption>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="display: none;">Id</th>
                                <th>Directory Name</th>
                                <th>Document</th>
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
                                        <td style="display: none;">
                                            <input type="hidden" name="id" value="<%= docs.get(i).getId() %>"/>
                                        </td>
                                        <td><%= docs.get(i).getDirectoryName() %></td>
                                        <td><%= docs.get(i).getDocName() %></td>
                                        <td><%= docs.get(i).getComment() %></td>
                                        <td><%= docs.get(i).getCreatedBy() %></td>
                                        <td><%= docs.get(i).getDate() %></td>
                                        <td>
                                            <form action="DownloadDoc" method="post">
                                                <input type="hidden" name="docId" value="<%= docs.get(i).getId() %>"/>
                                                <input type="submit" value="View" class="btn btn-primary btn-sm"/>
                                            </form>
                                        </td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <form method="post" action="UploadDocs" enctype="multipart/form-data">
                    <caption class="caption"><h2>Upload New Document</h2></caption>
                    <table class="table">
                        <thead>
                            <tr>
                                <th colspan="2" class="text-danger text-center">* represents Mandatory fields</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Document Name*</td>
                                <td><input type="text" name="docName" placeholder="Name" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>Document*</td>
                                <td><input type="file" name="docFile" class="form-control-file" required></td>
                            </tr>
                            <tr>
                                <td>Comments</td>
                                <td><textarea name="docComment" placeholder="Comments" class="form-control"></textarea></td>
                            </tr>
                            <tr>
                                <td>Directory*</td>
                                <td>
                                    <select name="directory" class="form-control" required>
                                        <option value="-1">Select Directory</option>
                                        <% if (request.getAttribute("directory") != null) { %>
                                            <% ArrayList<DirectoryDetails> directory = (ArrayList<DirectoryDetails>) request.getAttribute("directory"); %>
                                            <% for (int z = 0; z < directory.size(); z++) { %>
                                                <option value="<%= directory.get(z).getId() %>"><%= directory.get(z).getDirectoryName() %></option>
                                            <% } %>
                                        <% } %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <input type="submit" value="Upload" class="btn btn-submit">
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
