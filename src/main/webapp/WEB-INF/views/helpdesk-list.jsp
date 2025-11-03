<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>HelpDesk Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 30px 20px;
            color: #333;
        }
        h1, h2 {
            text-align: center;
            color: #43e97b;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            margin-bottom: 30px;
            color: #43e97b;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            padding: 6px 14px;
            border: 2px solid #43e97b;
            border-radius: 6px;
            transition: background-color 0.3s, color 0.3s;
        }
        a:hover {
            background-color: #43e97b;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 14px rgba(67, 233, 123, 0.15);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 14px 18px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            font-size: 14px;
        }
        th {
            background-color: #43e97b;
            color: white;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }
        tr:hover {
            background-color: #e9fbe7;
        }
        /* Responsive */
        @media (max-width: 768px) {
            table, thead, tbody, tr, th, td {
                display: block;
            }
            tr {
                margin-bottom: 25px;
            }
            th {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            td {
                padding-left: 50%;
                position: relative;
                text-align: right;
                font-size: 13px;
            }
            td:before {
                position: absolute;
                top: 14px;
                left: 15px;
                width: 45%;
                white-space: nowrap;
                font-weight: 700;
                content: attr(data-label);
                color: #43e97b;
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <h1>HelpDesk Management</h1>
    <a href="${pageContext.request.contextPath}/dashboard.jsp">← Back to Dashboard</a>
    <h2>Support Tickets</h2>
    <table>
        <thead>
            <tr>
                <th>Ticket ID</th>
                <th>Employee</th>
                <th>Subject</th>
                <th>Category</th>
                <th>Priority</th>
                <th>Status</th>
                <th>Created At</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ticket" items="${tickets}">
                <tr>
                    <td data-label="Ticket ID">${ticket.ticketId}</td>
                    <td data-label="Employee">${ticket.employeeName}</td>
                    <td data-label="Subject">${ticket.subject}</td>
                    <td data-label="Category">${ticket.category}</td>
                    <td data-label="Priority">${ticket.priority}</td>
                    <td data-label="Status">${ticket.status}</td>
                    <td data-label="Created At">${ticket.createdAt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
