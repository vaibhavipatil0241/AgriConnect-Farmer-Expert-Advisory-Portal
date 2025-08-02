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
 * Servlet implementation class AddExpert_Admin_1
 */
public class AddExpert_Admin_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddExpert_Admin_1() {
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
	        String name = request.getParameter("name");
	        String specialization = request.getParameter("specialization");
	        String contact = request.getParameter("contact");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        Connection con = DbConnection.connect();

	        try {
	            PreparedStatement pstmt = con.prepareStatement(
	                "INSERT INTO expert (name, specialization, contact, email, password) VALUES (?, ?, ?, ?, ?)"
	            );
	            pstmt.setString(1, name);
	            pstmt.setString(2, specialization);
	            pstmt.setString(3, contact);
	            pstmt.setString(4, email);
	            pstmt.setString(5, password);

	            int rows = pstmt.executeUpdate();

	            if (rows > 0) {
	                response.sendRedirect("Admin_Dashboard.jsp");
	            } else {
	                response.sendRedirect("error.jsp");
	            }

	            pstmt.close();
	            con.close();

	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");
	        }
	    }
	
	}


