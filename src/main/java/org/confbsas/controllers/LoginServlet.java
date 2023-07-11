package org.confbsas.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.Objects;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String ref = req.getHeader("Referer");
        String url = req.getRequestURL().toString();
//        System.out.println(ref);
//        System.out.println(url);

        if (Objects.isNull(ref) || !ref.equals(url)) {
            session.setAttribute("loginStatus", "initial");
        }

        getServletContext()
                .getRequestDispatcher("/login.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email, password, dbURL, dbUser, dbPassword, statement;
        email = req.getParameter("email");
        password = req.getParameter("password");

        dbURL = "jdbc:mysql://localhost:3306/conf_bsas";
        dbUser = "root";
        dbPassword = "password";

        statement = "SELECT * FROM users WHERE email=? AND password=?";
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement pstmt = conn.prepareStatement(statement)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    if (rs.getString("status").equals("banned")) {
                        session.setAttribute("loginStatus", "banned");
                        resp.sendRedirect(req.getRequestURI());
                    } else {
                        session.setAttribute("name", rs.getString("name"));
                        session.setAttribute("role", rs.getString("role"));
                        session.setAttribute("loginStatus", "succes");
                        System.out.println(session.getId());
                        resp.sendRedirect(req.getContextPath());
                    }
                } else {
                    session.setAttribute("loginStatus", "fail");
                    resp.sendRedirect(req.getRequestURI());
                }
            }


        } catch (SQLException e) {
            System.out.println("Mensaje de Error: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/error-page");
        }

    }

}