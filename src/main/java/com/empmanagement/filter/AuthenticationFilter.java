package com.empmanagement.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

       
        HttpSession session = httpRequest.getSession(false);

        
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        
        String requestURI = httpRequest.getRequestURI();

        
        boolean isLoginRequest = requestURI.endsWith("login.jsp") || requestURI.endsWith("/login");

        if (isLoggedIn || isLoginRequest) {
            chain.doFilter(request, response);
        } else {
            
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        }
    }

    @Override
    public void destroy() {
    }
}