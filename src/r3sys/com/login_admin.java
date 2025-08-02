package r3sys.com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class login_admin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login_admin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // ✅ Fixed admin credentials
        String adminEmail = "admin@admin.com";
        String adminPassword = "admin123";

        if (email.equals(adminEmail) && password.equals(adminPassword)) {
            HttpSession session = request.getSession();
            session.setAttribute("admin_id", 1);  // Set fixed admin ID

            response.sendRedirect("Admin_Dashboard.jsp");
        } else {
            response.sendRedirect("error.html");
        }
    }
}
