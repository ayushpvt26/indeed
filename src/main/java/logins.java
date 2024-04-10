import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/logins")
public class logins extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String pass = request.getParameter("password");

        String jdbcUrl = "jdbc:mysql://localhost:3306/ayush";
        String dbUser = "root";
        String dbPassword = "admin";

        String selectQuery = "SELECT username, password FROM logins WHERE username = ? AND password = ?;";
        String selectCompanyQuery = "SELECT company FROM logins WHERE username = ? AND password = ?;";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                 PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, pass);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<html><body>");

                    if (resultSet.next()) {
                        // If login is successful, retrieve the company name
                        try (PreparedStatement companyStatement = connection.prepareStatement(selectCompanyQuery)) {
                            companyStatement.setString(1, name);
                            companyStatement.setString(2, pass);

                            try (ResultSet companyResultSet = companyStatement.executeQuery()) {
                                if (companyResultSet.next()) {
                                    String co = companyResultSet.getString("company");
                                    // Set company name as session attribute for future use
                                    request.getSession().setAttribute("company_name", co);
                                }
                            }
                        }
                        response.sendRedirect("jobposting.jsp");
                    } else {
                        out.println("<h1>Login failed. Invalid credentials.</h1>");
                    }

                    out.println("</body></html>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
