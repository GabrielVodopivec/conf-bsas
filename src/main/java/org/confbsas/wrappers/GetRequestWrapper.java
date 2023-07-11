package org.confbsas.wrappers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;

public class GetRequestWrapper extends HttpServletRequestWrapper {
    public GetRequestWrapper(HttpServletRequest request) {
        super(request);
    }

    @Override
    public String getMethod() {
        return "GET";
    }
}