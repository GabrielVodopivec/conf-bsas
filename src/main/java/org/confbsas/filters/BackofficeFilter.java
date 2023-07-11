package org.confbsas.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Objects;

@WebFilter("/backoffice/*")
public class BackofficeFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
            HttpServletRequest servletRequest = (HttpServletRequest) req;
            HttpSession session = servletRequest.getSession();
            String role = (String) session.getAttribute("role");
            if (Objects.nonNull(role) && role.equals("admin")) {
                chain.doFilter(req, res);
            } else {
                HttpServletResponse servletResponse = (HttpServletResponse) res;
                servletResponse.sendRedirect(servletRequest.getContextPath());
            }
    }
}