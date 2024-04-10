<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Profile - Indeed</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Profile section styles */
        .company-card {
            display: flex;
            flex-direction: column;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .company-logo {
            width: 170px;
            height: 170px;
            border: 0px solid red;
            border-radius: 50%;
            margin: 0 auto 10px;
        }

        .company-name {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
        }

        .company-description {
            text-align: center;
            color: #666;
            margin-bottom: 20px;
        }

        .buttons {
            display: flex;
            justify-content: space-around;
        }

        .button {
            padding: 4px 10px;
            margin: 0px 3px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .main-div {
            border: 0px solid red;
            height: 900px;
            display: flex;
            width: 100%;
            padding: 20px 20px;
            gap: 10px;
            text-align: center;
            justify-content: center;
        }

        .left-header {
            padding-top: 13px;
            width: 20%;
            height: 100%;
            border: 0px solid red;
        }

        .main-content {
            padding-top: 10px;
            width: 50%;
            border: 1px solid #ccc;
            height: 100%;
            background-color: #fff;
            margin-top: 50px;
            border-radius: 5px;
        }

        .right-header {
            padding-top: 50px;
            width: 20%;
            height: 100%;
            border: 0px solid red;
        }

        .currentopenings {
            background-color: #fff;
            margin-top: 3px;
            border-radius: 5px;
            text-align: justify;
            padding: 0px 0px;
            border: 1px solid #ccc;
        }

        .currentopenings p {
            margin-top: 0px;
            padding: 0px 0px;
            font-weight: 00;
        }
            .container {
    display:none;
        max-width: 100%;
        height:100%;
        margin: 0 auto;
        padding: 10px 10px;
    }

    h2 {
        margin: 0px 0;
        text-align: center;
    }

    .job-form {
       
        border-radius: 5px;
       
        padding: 20px;
        margin-bottom: 10px;
    }

    .job-form form {
        display: flex;
        flex-direction: column;
    }

    .job-form form label {
        font-weight: bold;
        margin-bottom: 8px;
    }

    .job-form form input[type="text"],
    .job-form form textarea {
        padding: 7px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 10px;
    }

    .job-form form button {
        padding: 12px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .job-form form button:hover {
        background-color: #0056b3;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #007bff;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    </style>
</head>
<body>

<header>
    <nav class="navbar">
        <div>
            <a href="index.html">
                <img src="images/Screenshot 2024-02-12 223027.png" alt="logo">
            </a>
        </div>
        <ul>
            <li><a href="loginpage.jsp">Post job</a></li>
            <li><a href="find.jsp">Find job</a></li>
        </ul>
    </nav>
</header>

<div class="main-div">
    <div class="left-header">
        <br><br>
        <div class="company-card">
            <img src="images/pro1.jpg" alt="Compan" class="company-logo">
        
            
            <div class="company-name">
    <h3><strong><%= (String) session.getAttribute("company_name") %></strong> </h3>
</div>
            
            
          
            <div class="company-description">We are a leading company in the industry.</div>
            <div class="buttons">
                <button class="button" onclick="toggleDiv()">Post New Opening</button>
                <button class="button" onclick="editProfile()">Edit Profile</button>
            </div>
        </div>
    </div>
    <div class="main-content">
        <div class="container" id="hiddenDiv">
            <div class="job-form">
                <h2>ADD JOB</h2>
                <form method="post" action="postjob">
                    
                    
                    <label for="position">POSITION:</label>
                    <input type="text" id="position" name="position" required>
            
                    <label for="location">LOCATION:</label>
                    <input type="text" id="location" name="location" required>
                    
                    <label for="salary">SALARY:</label>
                    <input type="text" id="salary" name="salary" required>
            
                    <label for="description">DESCRIPTION:</label>
                    <textarea id="description" name="description" rows="6" required></textarea>
            
                    <button type="submit" name="addJob">Submit</button>
                    <br>
                </form>
            </div>
        </div>
    </div>
    <div class="right-header">
        <h3>Current Openings</h3>
        <%
            try {
                HttpSession sessions = request.getSession();
                String co = (String) session.getAttribute("company_name");
                
                String jdbcUrl = "jdbc:mysql://localhost:3306/ayush";
                String dbUser = "root";
                String dbPassword = "admin";

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT position, location FROM indeed_jobs where company_name=?");
                preparedStatement.setString(1, co);
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
        %>
                    <div class="currentopenings">
                        <p><strong>Position:</strong> <%= resultSet.getString("position") %></p>
                        <p><strong>Location:</strong> <%= resultSet.getString("location") %></p>
                    </div>
        <%
                }
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>

<script>
    var divVisible = false;

    function toggleDiv() {
        var div = document.getElementById('hiddenDiv');
        // Toggle the visibility of the div
        if (divVisible) {
            div.style.display = 'none'; // Hide the div
        } else {
            div.style.display = 'block'; // Show the div
        }
        // Update the visibility flag
        divVisible = !divVisible;
    }
</script>

</body>
</html>
