package r3sys.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Response_to_Queries_Expert_3 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            int q_id = Integer.parseInt(request.getParameter("query_id"));
            String responseText = request.getParameter("responseText");

            if (responseText == null || responseText.trim().isEmpty()) {
                response.getWriter().println("Response text cannot be empty.");
                return;
            }

            int e_id = ExpertGetSet.getId(); // Or: (int) request.getSession().getAttribute("eid");

            Connection con = DbConnection.connect();

            // Insert expert response into 'responses' table
            String insert = "INSERT INTO responses (q_id, e_id, responseText, date) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps1 = con.prepareStatement(insert)) {
                ps1.setInt(1, q_id);
                ps1.setInt(2, e_id);
                ps1.setString(3, responseText);
                ps1.setDate(4, java.sql.Date.valueOf(LocalDate.now()));
                ps1.executeUpdate();
            }

            // Update the query's status in 'queries' table
            String update = "UPDATE queries SET status = 'answered' WHERE q_id = ?";
            try (PreparedStatement ps2 = con.prepareStatement(update)) {
                ps2.setInt(1, q_id);
                ps2.executeUpdate();
            }

            con.close();

            // Redirect back to expert's query view page
            response.sendRedirect("ViewFarmers_Queries_Expert_2.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
