

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

@WebServlet("/postjob")
public class postjob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String company = request.getParameter("company_name");
	        String position = request.getParameter("position");
	        String location = request.getParameter("location");
	        String salary = request.getParameter("salary");
	        String description = request.getParameter("description");

	        String jdbcUrl = "jdbc:mysql://localhost:3306/ayush";
	        String dbUser = "root";
	        String dbPassword = "admin";

	        String insertQuery = "INSERT INTO indeed_jobs(company_name, position, location, salary, discription) VALUES (?, ?, ?, ?, ?)";

	        try {
	        	  HttpSession sessions = request.getSession();
	                String co = (String) sessions.getAttribute("company_name");
	            Class.forName("com.mysql.cj.jdbc.Driver"); 
	            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
	                    PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
	                preparedStatement.setString(1, co);
	                preparedStatement.setString(2, position);
	                preparedStatement.setString(3, location);
	                preparedStatement.setString(4, salary);
	                preparedStatement.setString(5, description);
	              

	                int rowsAffected = preparedStatement.executeUpdate();

	                response.setContentType("text/html");
	                PrintWriter out = response.getWriter();
	                out.println("<html><body>");
	                if (rowsAffected > 0) {
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
