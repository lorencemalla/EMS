package com.empmanagement.servlet;

import com.empmanagement.dao.LeaveDAO;
import com.empmanagement.model.Leave;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/leave/*")
public class LeaveServlet extends HttpServlet {

    private LeaveDAO leaveDAO;

    @Override
    public void init() throws ServletException {
        leaveDAO = new LeaveDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getPathInfo();
        if (action == null) action = "/list";

        HttpSession session = request.getSession(false);
        String role = (String) session.getAttribute("role");

        switch (action) {
            case "/list":
                List<Leave> leaves;
                if ("ADMIN".equals(role)) {
                    leaves = leaveDAO.getAllLeaves();
                } else {
                    int empId = (int) session.getAttribute("empId");
                    leaves = leaveDAO.getLeavesByEmployeeId(empId);
                }
                request.setAttribute("leaves", leaves);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/leave-list.jsp");
                dispatcher.forward(request, response);
                break;

            case "/new":
                
                if ("EMPLOYEE".equals(role)) {
                    RequestDispatcher formDispatcher = request.getRequestDispatcher("/WEB-INF/views/leave-form.jsp");
                    formDispatcher.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
                }
                break;

            case "/approve":
                int leaveId = Integer.parseInt(request.getParameter("id"));
                int userId = (int) session.getAttribute("userId");
                leaveDAO.updateLeaveStatus(leaveId, "APPROVED", userId, "Leave approved");
                response.sendRedirect(request.getContextPath() + "/leave/list");
                break;

            case "/reject":
                leaveId = Integer.parseInt(request.getParameter("id"));
                userId = (int) session.getAttribute("userId");
                leaveDAO.updateLeaveStatus(leaveId, "REJECTED", userId, "Leave rejected");
                response.sendRedirect(request.getContextPath() + "/leave/list");
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/leave/list");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession(false);
        int empId = (int) session.getAttribute("empId");

        Leave leave = new Leave();
        leave.setEmpId(empId);
        leave.setLeaveTypeId(Integer.parseInt(request.getParameter("leaveType")));
        leave.setStartDate(Date.valueOf(request.getParameter("startDate")));
        leave.setEndDate(Date.valueOf(request.getParameter("endDate")));
        leave.setTotalDays(Integer.parseInt(request.getParameter("totalDays")));
        leave.setReason(request.getParameter("reason"));

        leaveDAO.applyLeave(leave);
        response.sendRedirect(request.getContextPath() + "/leave/list");
    }
}
