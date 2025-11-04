package com.empmanagement.servlet;

import com.empmanagement.dao.HelpDeskDAO;
import com.empmanagement.model.HelpDesk;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/helpdesk/*")
public class HelpDeskServlet extends HttpServlet {

    private HelpDeskDAO helpDeskDAO;

    @Override
    public void init() throws ServletException {
        helpDeskDAO = new HelpDeskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<HelpDesk> tickets = helpDeskDAO.getAllTickets();
        request.setAttribute("tickets", tickets);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/helpdesk-list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        int empId = (int) session.getAttribute("empId");

        HelpDesk ticket = new HelpDesk();
        ticket.setEmpId(empId);
        ticket.setSubject(request.getParameter("subject"));
        ticket.setDescription(request.getParameter("description"));
        ticket.setCategory(request.getParameter("category"));
        ticket.setPriority(request.getParameter("priority"));

        helpDeskDAO.createTicket(ticket);
        response.sendRedirect(request.getContextPath() + "/helpdesk/list");
    }
}