<%@ page import="com.EMS.entity.Registration" %>
<%@ page import="java.util.ArrayList,java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Quicksand', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            display: flex;
        }

        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #0056b3;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: width 0.3s ease;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar a i {
            margin-right: 10px;
        }

        .sidebar a:hover {
    background-color: #004080;
    text-decoration: none; 
    font-weight: 500;
    color: #fff;
}


        .sidebar-collapsed {
            width: 80px;
        }

        .sidebar-collapsed a span {
            display: none;
        }

        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 260px;
            transition: margin-left 0.3s ease;
        }

        .main-container-collapsed {
            margin-left: 90px;
        }

        .content {
            padding: 20px;
            max-width: 800px;
            width: 100%;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .info-box {
            margin-bottom: 20px;
            color: white;
            text-align: center;
        }

        .info-box span {
            display: block;
            margin-bottom: 5px;
        }

        .footer {
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 80px;
            }

            .sidebar a span {
                display: none;
            }

            .main-container {
                margin-left: 90px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar" id="sidebar">
        <div>
            <div class="info-box">
                <span><b>Role Type:</b> 
                    <% if(session.getAttribute("role").equals(1)) { %>Admin<% } %>
                    <% if(session.getAttribute("role").equals(2)) { %>Manager<% } %>
                    <% if(session.getAttribute("role").equals(3)) { %>Employee<% } %>
                </span>
                <span><b>Status:</b> 
                    <% if(session.getAttribute("activityStatus").equals("TRUE")) { %>Active<% } %>
                    <% if(session.getAttribute("activityStatus").equals("FALSE")) { %>Inactive<% } %>
                </span>
            </div>
            <% if(session.getAttribute("role").equals(1)) { %>
                <a href="#" onclick="document.forms['admin'].submit()">
                    <i class="fas fa-tachometer-alt"></i> <span>Dashboard</span>
                </a>
                <a href="#" onclick="document.forms['admin1'].submit()">
                    <i class="fas fa-users"></i> <span>Active Users</span>
                </a>
                <a href="#" onclick="document.forms['admin2'].submit()">
                    <i class="fas fa-user-times"></i> <span>Inactive Users</span>
                </a>
                <a href="#" onclick="document.forms['admin3'].submit()">
                    <i class="fas fa-user"></i> <span>My Profile</span>
                </a>
                <a href="#" onclick="document.forms['admins'].submit()">
                    <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
                </a>
            <% } else if(session.getAttribute("role").equals(2)) { %>
                <a href="#" onclick="document.forms['manager'].submit()">
                    <i class="fas fa-tachometer-alt"></i> <span>Dashboard</span>
                </a>
                <a href="#" onclick="document.forms['manager2'].submit()">
                    <i class="fas fa-folder"></i> <span>My Directories</span>
                </a>
                <a href="#" onclick="document.forms['manager7'].submit()">
                    <i class="fas fa-file-upload"></i> <span>Documents</span>
                </a>
                <a href="#" onclick="document.forms['manager4'].submit()">
                    <i class="fas fa-calendar-alt"></i> <span>Leave Details</span>
                </a>
                <a href="#" onclick="document.forms['manager5'].submit()">
                    <i class="fas fa-user"></i> <span>My Profile</span>
                </a>
                <a href="#" onclick="document.forms['manager6'].submit()">
                    <i class="fas fa-dollar-sign"></i> <span>Payments</span>
                </a>
                <a href="#" onclick="document.forms['manager3'].submit()">
                    <i class="fas fa-users-cog"></i> <span>Sub-Employees</span>
                </a>
                <a href="#" onclick="document.forms['manager8'].submit()">
                    <i class="fas fa-sitemap"></i> <span>Sub-Managers Directory</span>
                </a>
                <a href="#" onclick="document.forms['manager9'].submit()">
                    <i class="fas fa-envelope"></i> <span>ATE Response</span>
                </a>
                <a href="#" onclick="document.forms['managers'].submit()">
                    <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
                </a>
            <% } else if(session.getAttribute("role").equals(3)) { %>
                <a href="#" onclick="document.forms['employee'].submit()">
                    <i class="fas fa-tachometer-alt"></i> <span>Dashboard</span>
                </a>
                <a href="#" onclick="document.forms['employee4'].submit()">
                    <i class="fas fa-file-upload"></i> <span>My Documents</span>
                </a>
                <a href="#" onclick="document.forms['employee1'].submit()">
                    <i class="fas fa-calendar-alt"></i> <span>Leave Details</span>
                </a>
                <a href="#" onclick="document.forms['employee2'].submit()">
                    <i class="fas fa-user"></i> <span>My Profile</span>
                </a>
                <a href="#" onclick="document.forms['employee3'].submit()">
                    <i class="fas fa-dollar-sign"></i> <span>Payments</span>
                </a>
                <a href="#" onclick="document.forms['employee5'].submit()">
                    <i class="fas fa-envelope"></i> <span>ATE Request</span>
                </a>
                <a href="#" onclick="document.forms['employees'].submit()">
                    <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
                </a>
            <% } %>
        </div>
        <div class="footer">
            <span><b>Employee Management System</b></span><br>
            <span><b>Logged In as:</b> <%=session.getAttribute("firstname") %></span>
        </div>
    </div>

    <div class="main-container" id="main-container">
        
    </div>

    <!-- Forms for submission -->
    <form name="admin" action="Role" method="post"></form>
    <form name="admin1" action="ActiveUsers" method="get"></form>
    <form name="admin2" action="InactiveUsers" method="get"></form>
    <form name="admin3" action="Profiles" method="get"></form>
    <form name="admins" action="logout" method="get"></form>

    <form name="manager" action="Role" method="post"></form>
    <form name="manager2" action="Directories" method="get"></form>
    <form name="manager7" action="UploadDocs" method="get"></form>
    <form name="manager4" action="Leaves" method="get"></form>
    <form name="manager5" action="Profiles" method="get"></form>
    <form name="manager6" action="Payments" method="get"></form>
    <form name="manager3" action="SupervisedUsers" method="get"></form>
    <form name="manager8" action="ManagerDirectories" method="get"></form>
    <form name="manager9" action="updateATE" method="get"></form>
    <form name="managers" action="logout" method="get"></form>

    <form name="employee" action="Role" method="post"></form>
    <form name="employee4" action="UploadDocs" method="get"></form>
    <form name="employee1" action="Leaves" method="get"></form>
    <form name="employee2" action="Profiles" method="get"></form>
    <form name="employee3" action="Payments" method="get"></form>
    <form name="employee5" action="ATE" method="get"></form>
    <form name="employees" action="logout" method="get"></form>

    <!-- Optional JavaScript -->
    <script>
        const sidebar = document.getElementById('sidebar');
        const mainContainer = document.getElementById('main-container');

        window.addEventListener('resize', function() {
            if (window.innerWidth <= 768) {
                sidebar.classList.add('sidebar-collapsed');
                mainContainer.classList.add('main-container-collapsed');
            } else {
                sidebar.classList.remove('sidebar-collapsed');
                mainContainer.classList.remove('main-container-collapsed');
            }
        });

        // Initial check
        if (window.innerWidth <= 768) {
            sidebar.classList.add('sidebar-collapsed');
            mainContainer.classList.add('main-container-collapsed');
        }
    </script>
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
