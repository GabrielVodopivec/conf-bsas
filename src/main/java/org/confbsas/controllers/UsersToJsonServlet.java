package org.confbsas.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.confbsas.models.User;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/backoffice/users/json")
public class UsersToJsonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String dbURL, dbUser, dbPassword, statement;
        List<User> userList = new ArrayList<>();
        dbURL = "jdbc:mysql://localhost:3306/conf_bsas";
        dbUser = "root";
        dbPassword = "password";

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
            statement = "SELECT * FROM users WHERE role != \"admin\"";
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(statement)) {
                while (rs.next()) {
                    userList.add(new User(
                            rs.getLong("id"),
                            rs.getString("name"),
                            rs.getString("last_name"),
                            rs.getString("email"),
                            rs.getString("role"),
                            rs.getString("status")
                    ));
                }
            }

            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(userList);

            resp.setContentType("application/json");
            resp.getWriter().write(json);

        } catch (SQLException e) {
            resp.sendRedirect("/error-page.jsp");
        }
    }
}