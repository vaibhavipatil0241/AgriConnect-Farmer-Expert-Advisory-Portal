package r3sys.com;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login_farmer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login_farmer() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = DbConnection.connect();

        try {
            // Check email and password in DB
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM farmer WHERE email = ? AND password = ?");
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int f_id = rs.getInt("f_id"); // Get farmer ID

                // ✅ Save to session
                HttpSession session = request.getSession();
                session.setAttribute("f_id", f_id);

                response.sendRedirect("Farmer_Dashboard.jsp"); // Go to farmer dashboard
            } else {
                response.sendRedirect("error.html"); // Wrong login
            }

            rs.close();
            pstmt.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}