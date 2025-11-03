<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Leave Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 30px 20px;
            color: #444;
        }
        
        a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
        }
        a:hover {
            text-decoration: underline;
        }
        
        h1, h2 {
            text-align: center;
            color: #667eea;
            margin-bottom: 20px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 14px rgba(102, 126, 234, 0.15);
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
            background-color: #667eea;
            color: white;
            font-weight: 700;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }
        
        tr:hover {
            background-color: #f0f0f0;
        }

        /* For action links in actions column */
        td a {
            margin-right: 18px;
            padding: 6px 12px;
            border-radius: 6px;
            border: 1px solid transparent;
            transition: all 0.3s ease;
        }

        td a[href*=\"approve\"] {
            background-color: #43a047;
            color: white;
            border-color: #388e3c;
        }

        td a[href*=\"approve\"]:hover {
            background-color: #388e3c;
            border-color: #2e7031;
        }

        td a[href*=\"reject\"] {
            background-color: #e53935;
            color: white;
            border-color: #c62828;
        }

        td a[href*=\"reject\"]:hover {
            background-color: #c62828;
            border-color: #b71c1c;
        }

        /* Responsive for smaller screens */
        @media (max-width: 768px) {
            table, thead, tbody, tr, th, td {
                display: block;
            }

            tr {
                margin-bottom: 20px;
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
                top: 12px;
                left: 15px;
                width: 45%;
                white-space: nowrap;
                font-weight: 600;
                color: #667eea;
                content: attr(data-label);
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <h1>Leave Management</h1>
    <a href="${pageContext.request.contextPath}/dashboard.jsp">← Back to Dashboard</a>
    <h2>Leave Requests</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Employee</th>
                <th>Type</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="leave" items="${leaves}">
                <tr>
                    <td data-label="ID">${leave.leaveId}</td>
                    <td data-label="Employee">${leave.employeeName}</td>
                    <td data-label="Type">${leave.leaveTypeName}</td>
                    <td data-label="Start Date">${leave.startDate}</td>
                    <td data-label="End Date">${leave.endDate}</td>
                    <td data-label="Status">${leave.status}</td>
                    <td data-label="Actions">
                        <c:if test="${sessionScope.role == 'ADMIN' && leave.status == 'PENDING'}">
                            <a href="${pageContext.request.contextPath}/leave/approve?id=${leave.leaveId}">Approve</a>
                            <a href="${pageContext.request.contextPath}/leave/reject?id=${leave.leaveId}">Reject</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
