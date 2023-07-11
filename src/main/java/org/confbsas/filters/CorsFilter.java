package org.confbsas.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/*")
public class CorsFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        httpResponse.setHeader("Access-Control-Allow-Origin", "*"); // Permite el acceso desde cualquier origen
        httpResponse.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE"); // Permite los métodos HTTP especificados
        httpResponse.setHeader("Access-Control-Allow-Headers", "Content-Type"); // Permite el encabezado Content-Type
        filterChain.doFilter(servletRequest, servletResponse);
    }
}