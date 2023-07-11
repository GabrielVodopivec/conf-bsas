package org.confbsas.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.confbsas.wrappers.GetRequestWrapper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String ref = req.getHeader("Referer");
        String url = req.getRequestURL().toString();
        Boolean commingFromOtherURL = false;

        if (Objects.nonNull(ref)) {
            commingFromOtherURL = ref.equals(url);
        }

        if (!commingFromOtherURL) {
            session.setAttribute("signupStatus", "initial");
            session.setAttribute("userInfo", null);
        }

//        System.out.println("Url anterior: " + ref);
//        System.out.println("Url actual: " + url);
        getServletContext().getRequestDispatcher("/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String name, lastName, email, password, dbURL, dbUser, dbPassword, statement;
        Map<String, String> userInfo = new HashMap<>();
//        System.out.println("Esta haciendo POST La caca");
        name = req.getParameter("name");
        lastName = req.getParameter("lastName");
        email = req.getParameter("email");
        password = req.getParameter("password");

        userInfo.put("name", name);
        userInfo.put("lastName", lastName);
        userInfo.put("email", email);
        userInfo.put("password", password);

        session.setAttribute("userInfo", userInfo);

        dbURL = "jdbc:mysql://localhost:3306/conf_bsas";
        dbUser = "root";
        dbPassword = "password";

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
            statement =
                    "INSERT INTO users(name, last_name, email, password) " +
                            "VALUES (?, ?, ?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(statement);
            pstmt.setString(1, name);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, password);

            int rowAffected = pstmt.executeUpdate();

            if (rowAffected > 0) session.setAttribute("signupStatus", "success");

            resp.sendRedirect(req.getRequestURI());

        } catch (SQLException e) {
            if (e.getMessage().contains("Duplicate")) {
                session.setAttribute("signupStatus", "Ya existe un usuario con ese email");
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/signup");
//                HttpServletRequest newReq = new GetRequestWrapper(req);
//                requestDispatcher.forward(newReq, resp);
                resp.sendRedirect(req.getRequestURI());
            } else {
                String msg = "Oops! Hubo problemas mientras intentábamos registrarte...";
                session.setAttribute("signupStatus", msg);
                resp.sendRedirect(req.getContextPath() + "/error-page");

            }
        }
    }
}