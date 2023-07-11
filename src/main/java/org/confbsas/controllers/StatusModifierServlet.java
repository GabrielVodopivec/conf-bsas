package org.confbsas.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

import static java.lang.Long.parseLong;

@WebServlet("/backoffice/users/modify")
public class StatusModifierServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dbURL, dbUser, dbPassword, statement, status, newStatus, idStr;

        status = req.getParameter("status");
        idStr = req.getParameter("id");
        long id = parseLong(idStr);

        dbURL = "jdbc:mysql://localhost:3306/conf_bsas";
        dbUser = "root";
        dbPassword = "password";

        newStatus = status.equals("active") ? "banned" : "active";

        statement = "UPDATE users SET status=? WHERE id=?";
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement pstmt = conn.prepareStatement(statement)) {
            pstmt.setString(1, newStatus);
            pstmt.setLong(2, id);
            int rowAffected = pstmt.executeUpdate();
            if (rowAffected > 0) {
                resp.sendRedirect(req.getContextPath() + "/backoffice/users");
            } else {
                resp.sendRedirect(req.getContextPath() + "/error-page");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/error-page");
        }
    }
}