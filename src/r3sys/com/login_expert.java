package r3sys.com;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class login_expert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login_expert() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = DbConnection.connect();

        try {
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM expert WHERE email = ? AND password = ?");
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int e_id = rs.getInt("e_id");
                ExpertGetSet.setEid(e_id);  
                response.sendRedirect("Expert_Dashboard.jsp");
            } else {
                response.sendRedirect("error.html");
            }

            rs.close();
            pstmt.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
