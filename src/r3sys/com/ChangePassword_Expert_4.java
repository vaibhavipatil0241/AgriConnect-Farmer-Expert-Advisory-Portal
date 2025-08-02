package r3sys.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePassword_Expert_4
 */
public class ChangePassword_Expert_4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword_Expert_4() {
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

        int expertId = ExpertGetSet.getId();  // get logged-in expert id

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("<h3 style='color:red;'>New passwords do not match!</h3>");
            return;
        }

        try {
            Connection con = DbConnection.connect();

            PreparedStatement checkStmt = con.prepareStatement("SELECT password FROM expert WHERE e_id = ?");
            checkStmt.setInt(1, expertId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");

                if (!dbPassword.equals(currentPassword)) {
                    response.getWriter().println("<h3 style='color:red;'>Current password is incorrect!</h3>");
                } else {
                    PreparedStatement updateStmt = con.prepareStatement("UPDATE expert SET password = ? WHERE e_id = ?");
                    updateStmt.setString(1, newPassword);
                    updateStmt.setInt(2, expertId);

                    int updated = updateStmt.executeUpdate();
                    if (updated > 0) {
                        response.sendRedirect("Expert_Dashboard.jsp");
                    } else {
                        response.getWriter().println("<h3 style='color:red;'>Failed to update password.</h3>");
                    }
                }
            } else {
                response.getWriter().println("<h3 style='color:red;'>Expert not found!</h3>");
            }

            rs.close();
            checkStmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>An error occurred. Try again later.</h3>");
        }
    }

	}


