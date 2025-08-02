package r3sys.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostWeather_Admin
 */
public class PostWeather_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostWeather_Admin() {
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

        int w_id = Integer.parseInt(request.getParameter("w_id"));
        String title = request.getParameter("postTitle");
        String desc = request.getParameter("postDesc");
        String date = request.getParameter("date"); // in yyyy-mm-dd format

        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO weather (w_id, postTitle, postDesc, date) VALUES (?, ?, ?, ?)");

            ps.setInt(1, w_id);
            ps.setString(2, title);
            ps.setString(3, desc);
            ps.setDate(4, Date.valueOf(date));

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("Admin_Dashboard.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

	}


