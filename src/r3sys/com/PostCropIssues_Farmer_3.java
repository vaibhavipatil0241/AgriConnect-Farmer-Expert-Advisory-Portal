package r3sys.com;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class PostCropIssues_Farmer_3 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String getFileName(Part part) {
        if (part == null) return null;
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("f_id") == null) {
            out.println("<h3>Session expired. Please login again.</h3>");
            return;
        }

        int f_id = (int) session.getAttribute("f_id");
        String cropType = request.getParameter("cropType");
        String issueDescription = request.getParameter("issueDescription");
        String date = request.getParameter("date");
        String status = "Pending";

        // Handle file upload
        Part filePart = request.getPart("cropImage");  // Name should match JSP form field
        if (filePart == null) {
            out.println("<h3>No file selected.</h3>");
            return;
        }
        String fileName = getFileName(filePart);
        String uploadPath = getServletContext().getRealPath("") + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Save file path to DB
        String imagePath = "uploads/" + fileName;

        try (Connection con = DbConnection.connect()) {
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO queries (f_id, cropType, issueDescription, imagePath, date, status) VALUES (?, ?, ?, ?, ?, ?)"
            );
            pst.setInt(1, f_id);
            pst.setString(2, cropType);
            pst.setString(3, issueDescription);
            pst.setString(4, imagePath);
            pst.setString(5, date);
            pst.setString(6, status);

            int rows = pst.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("Farmer_Dashboard.jsp");
            } else {
                out.println("<h3>Failed to submit issue.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
