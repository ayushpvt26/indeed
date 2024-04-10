

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		  String uname = request.getParameter("username");
	        String email = request.getParameter("email");
	        String pass = request.getParameter("password");
	        String conpass = request.getParameter("confirmpassword");
	        String company = request.getParameter("company");
		      

	        String jdbcUrl = "jdbc:mysql://localhost:3306/ayush";
	        String dbUser = "root";
	        String dbPassword = "admin";

	        String insertQuery = "INSERT INTO logins(username,password, email, company) VALUES (?, ?, ?, ?)";

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver"); 
	            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
	                    PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
	                preparedStatement.setString(1, uname);
	                preparedStatement.setString(2, pass);
	              
	                preparedStatement.setString(4, company);
	                preparedStatement.setString(3, email);
	                HttpSession session = request.getSession();
	                
	                // Set session attributes
	                session.setAttribute("company_name", company);

	                int rowsAffected = preparedStatement.executeUpdate();

	                response.setContentType("text/html");
	                PrintWriter out = response.getWriter();
	                out.println("<html><body>");
	                if (rowsAffected > 0) {
	                	
	                	
	                	   response.sendRedirect("loginpage.jsp");
	                        
	                    out.println("<h1>Job posted successfully!</h1>");
	                } else {
	                    out.println("<h1>Failed to post job.</h1>");
	                }
	                out.println("</body></html>");
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
		
		
		
		
		
	}

}
