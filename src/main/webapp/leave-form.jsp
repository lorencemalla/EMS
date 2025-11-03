<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Request Leave</title>
    <style>
        body { font-family: Arial; background: #f5f6fa; margin: 0; padding: 20px; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { color: #667eea; }
        label { display: block; margin: 15px 0 5px; font-weight: bold; }
        input, select, textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        button { background: #667eea; color: white; padding: 12px 30px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; margin-top: 20px; }
        button:hover { background: #5568d3; }
        .back { color: #667eea; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <a href="dashboard.jsp" class="back">← Back to Dashboard</a>
        <h2>Request Leave</h2>
        <form action="<%= request.getContextPath() %>/leave/apply" method="post">
            <label>Leave Type *</label>
            <select name="leaveType" required>
                <option value="">Select Type</option>
                <option value="1">Casual Leave</option>
                <option value="2">Sick Leave</option>
                <option value="3">Privilege Leave</option>
            </select>
            
            <label>Start Date *</label>
            <input type="date" name="startDate" required>
            
            <label>End Date *</label>
            <input type="date" name="endDate" required>
            
            <label>Total Days *</label>
            <input type="number" name="totalDays" required>
            
            <label>Reason *</label>
            <textarea name="reason" rows="4" required></textarea>
            
            <button type="submit">Submit Leave Request</button>
        </form>
    </div>
</body>
</html>
