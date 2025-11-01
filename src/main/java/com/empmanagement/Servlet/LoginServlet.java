package com.empmanagement.servlet;

import com.empmanagement.dao.EmployeeDAO;
import com.empmanagement.dao.UserDAO;
import com.empmanagement.model.Employee;
import com.empmanagement.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;
    private EmployeeDAO employeeDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        employeeDAO = new EmployeeDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        User user = userDAO.authenticateUser(username, password);

        if (user != null) {
            
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());
            session.setAttribute("userId", user.getUserId());

            // Get employee details if exists
            Employee employee = employeeDAO.getEmployeeByUserId(user.getUserId());
            if (employee != null) {
                session.setAttribute("employee", employee);
                session.setAttribute("empId", employee.getEmpId());
            }

            
            session.setMaxInactiveInterval(30 * 60);

            
            response.sendRedirect("dashboard.jsp");
        } else {
           
            request.setAttribute("errorMessage", "Invalid username or password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.sendRedirect("login.jsp");
    }
}