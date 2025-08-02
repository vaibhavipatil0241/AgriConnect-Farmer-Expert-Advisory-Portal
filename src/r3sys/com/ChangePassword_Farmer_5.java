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
 * Servlet implementation class ChangePassword_Farmer_5
 */
public class ChangePassword_Farmer_5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword_Farmer_5() {
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

        int fid = FarmerGetSet.getId();  

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("<h3 style='color:red;'>New passwords do not match!</h3>");
            return;
        }

        try {
            Connection con = DbConnection.connect();

            
            PreparedStatement checkStmt = con.prepareStatement("SELECT password FROM farmer WHERE f_id = ?");
            checkStmt.setInt(1, fid);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");

                if (!dbPassword.equals(currentPassword)) {
                    response.getWriter().println("<h3 style='color:red;'>Current password is incorrect!</h3>");
                } else {
                    
                    PreparedStatement updateStmt = con.prepareStatement(
                        "UPDATE farmer SET password = ? WHERE f_id = ?");
                    updateStmt.setString(1, newPassword);
                    updateStmt.setInt(2, fid);

                    int rowsUpdated = updateStmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        response.sendRedirect("Farmer_Dashboard.jsp");
                    } else {
                        response.getWriter().println("<h3 style='color:red;'>Failed to update password.</h3>");
                    }
                }
            } else {
                response.getWriter().println("<h3 style='color:red;'>Farmer not found!</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>An error occurred. Try again.</h3>");
        }
    }

	}

