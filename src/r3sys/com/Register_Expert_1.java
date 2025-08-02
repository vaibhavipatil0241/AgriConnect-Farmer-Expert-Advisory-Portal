package r3sys.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register_Expert_1
 */
public class Register_Expert_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register_Expert_1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        Connection con = DbConnection.connect();

        int e_id = 0;  // auto-incremented
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            PreparedStatement pstmt = con.prepareStatement(
                "INSERT INTO expert (e_id, name, specialization, contact, email, password) VALUES (?, ?, ?, ?, ?, ?)"
            );
            pstmt.setInt(1, e_id);  // if auto-increment, you can skip it or set 0
            pstmt.setString(2, name);
            pstmt.setString(3, specialization);
            pstmt.setString(4, contact);
            pstmt.setString(5, email);
            pstmt.setString(6, password);

            int i = pstmt.executeUpdate();

            if (i > 0) {
                response.sendRedirect("Expert_Dashboard.jsp");  // redirect to success page
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }

}


