<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Job Listings</title>
   
    <style >
    
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap');

.navbar {
    background-color: #fffffff2;
    width: 100%;
    position: fixed;
    display: flex;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    height: 64px;
}

.body {
    font-family: "Noto Sans", sans-serif;
}


.navbar div img {
    height: 60px;
    padding: 0px 40px;
}

.navbar ul {
    font-family: "Noto Sans", "Helvetica Neue", Helvetica, Arial, "Liberation Sans", Roboto, Noto, sans-serif;
    margin: 10px 0px;
    padding: 1px 0px;
    display: flex;
    color: #313335;
    list-style: none;
}

.navbar ul li a {
    text-decoration: none;
    font-size: 20px;
    font-weight: 000;
    color: #313335;
    margin: 10px 1px;
    padding: 10px 16px;
}

.navbar ul li a:hover {
    color: #0077B5;
    border-bottom: 4px solid #0077B5;
}

.main1 {
    border: 0px solid black;
    padding: 20px 10px;
    display: flex;
    margin: 10px 0px;
    text-align: center;
    justify-content: center;
    justify-items: center;
}

.front-main {
    margin: 10px 10px;
    padding: 10px 10px;
    border: 2px solid #0077B5;
    width: 50%;
    text-align: left;

}

.main1 img {
    height: 350px;
}

.main1 h1 {
    margin: 10px 10px;
    padding: 20px 10px;
    font-family: "Noto Sans", sans-serif;
    font-optical-sizing: auto;
    font-weight: 487;
    font-size: 50px;
    color: #313335;
    font-style: italic;
    font-variation-settings:"wdth" 200;
}

.main1 h2,
h2 {
    margin: 10px 10px;
    padding: 10px 0px;
    font-family: "Noto Sans", sans-serif;
    font-weight: 587;
    font-size: 30px;
    color: #313335;
    font-variation-settings:"wdth" 300;
}

.main1 p,
p {
    margin: 10px 10px;
    padding: 10px 0px;
    font-family: "Noto Sans", sans-serif;

    font-weight: 287;
    font-size: 15px;
    color: #232425;



    font-variation-settings:
        "wdth" 300;
}

.main1 button {
    font-weight: 550;
    color: #fafafa;
    width: 200px;
    font-family: "Noto Sans", sans-serif;
    padding: 20px 10px;
    background-color: #0077B5;
    border: 2px solid #0077B5;
    border-radius: 10px;
    font-size: 15px;
    cursor: pointer;
    margin: 10px 30px;
}

.sq {
    background-color: #fff;
    border-radius: 15px;
    border: 1px solid rgba(138, 134, 134, 0.265);
    margin: 150px 10px;
    padding: 10px 10px;
    box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.062);
    width: 50%;
    max-width: 270px;
    text-align: left;
}

.sqf {
    background-color: #fff;
    border-radius: 15px;
    border: 0px solid rgba(138, 134, 134, 0.265);
    margin: 0px 0px;
    display: flex;
    padding: 0px 0px;
    box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.062);



}

.sqimg {
    border-radius: 15px;
    border: 1px solid rgba(138, 134, 134, 0.265);
    margin: 130px 10px;
    padding: 10px 10px;
    box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.062);
    width: 50%;
    max-width: 270px;

}

.context {
    border-radius: 15px;
    border: 0px solid rgba(138, 134, 134, 0.265);
    margin: 170px 10px;
    padding: 10px 10px;
    width: 90%;
    font-style: normal;

    text-align: left;
}

.context2 {
    text-align: center;
    border-radius: 15px;
    border: 0px solid rgba(138, 134, 134, 0.265);
    margin: 170px 10px;
    padding: 10px 10px;
    width: 50%;


}

.myform input {
    border-radius: 10px;
    max-width: 300px;
    padding: 20px 20px;
    width: 1090px;
    border: 0px solid rgba(0, 0, 0, 0.132);
    height: 10px;
    font-size: 20px;
}


.myform button {
    padding: 14px 10px;
    margin: 20px 10px;
}

.myform button:hover {
    background-color: #0b4768ed;
}

.jobinfo h1,
.jobinfo h2,
.jobinfo h4,
.jobinfo p {
    margin-bottom: 0px;
    line-height: 1;
    padding: 0px 0px;
    border: 0px solid red;
}

.container {
    max-width: 370px;
    height: 440px;
    text-align: left;
    margin: 30px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.job-description {
    margin-bottom: 20px;
}

.job-description h2 {
    margin-top: 0;
    margin-bottom: 0px;
}

.job-description p {
    margin: 0px 0px;
    margin-top: 0px 0px;
}

.job-description ul {
    margin-top: 10px;
    text-align: justify;
    padding-left: 20px;
}

.job-description li {
    margin-bottom: 5px;
}

.salary {
    background-color: #35a91b44;
    padding: 3px;
    border-radius: 10px;
    font-weight: bold;
    display: inline-block;
    margin-top: 0px;
}

.main2 {
    width: 50%;
    border: 0px solid red;
}

.scrollable-div {
    width: 50%;
    height: 570px;
    /* Set your desired height */
    overflow: auto;
    /* Add scrollbar when content overflows */
    border: 0px solid #ccc;
    padding: 10px;
    cursor: pointer;
}

.scrollable-div::-webkit-scrollbar {
    width: 10px;
    /* Width of the scrollbar */
}

.scrollable-div::-webkit-scrollbar-track {
    background: #f1f1f1;
    /* Track color */
}

.scrollable-div::-webkit-scrollbar-thumb {
    background: #dcd9d9;
    /* Thumb color */
    border-radius: 15px;
    /* Rounded corners */
}

.scrollable-div::-webkit-scrollbar-thumb:hover {
    background: #dcd9d9e3; width: 18px;
    /* Thumb color on hover */
}
    
    </style>
</head>
<body>
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
    </nav><br>

    <div class="main1">
        <div class="sqf">
            <form action="" class="myform">
                <input type="text" placeholder="Search job positions">
                <input type="text" placeholder="Search job">
                <button>Find job</button>
            </form>
        </div>
        </div>

        <div class="main1">        
        <div class="scrollable-div">
           
             <%
             try { String jdbcUrl = "jdbc:mysql://localhost:3306/ayush";
                   String dbUser = "root";
                   String dbPassword = "admin";
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM indeed_jobs;");

                        while (resultSet.next()) {
                %>
                 <div class="container">
                <div class="job-description">
                    <h2><%= resultSet.getString("position") %></h2>
                    <p><strong></strong> <%= resultSet.getString("company_name") %></p>
                    <p><strong></strong> <%= resultSet.getString("location") %></p>
                    <p><strong></strong> <span class="salary"><%= resultSet.getString("salary") %> per year</span></p>
                    <h3>Description:</h3>
                    <ul>
                        <li><%= resultSet.getString("discription") %></li>
                        <li>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
                        <li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                    </ul>
                 </div></div><%
                        }
                        resultSet.close();
                        statement.close();
                        connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
               
               
        </div>
              <div class="main2">

            content
                   </div>
        </div> 
 
</body>
</html>
