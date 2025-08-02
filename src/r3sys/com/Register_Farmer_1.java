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
 * Servlet implementation class Register_Farmer_1
 */
public class Register_Farmer_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register_Farmer_1() {
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

        int f_id = 0;  // Auto-increment
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO farmer VALUES (?, ?, ?, ?, ?, ?)");

            pstmt.setInt(1, f_id);
            pstmt.setString(2, name);
            pstmt.setString(3, contact);
            pstmt.setString(4, address);
            pstmt.setString(5, email);
            pstmt.setString(6, password);

            int i = pstmt.executeUpdate();

            if (i > 0) {
                response.sendRedirect("Farmer_Dashboard.jsp");  // ✅ redirect to login or dashboard
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

	}


