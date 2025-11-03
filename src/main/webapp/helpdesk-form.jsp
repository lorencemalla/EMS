<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Create HelpDesk Ticket</title>
    <style>
        body { font-family: Arial; background: #f5f6fa; margin: 0; padding: 20px; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { color: #43e97b; }
        label { display: block; margin: 15px 0 5px; font-weight: bold; }
        input, select, textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        button { background: #43e97b; color: white; padding: 12px 30px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; margin-top: 20px; }
        button:hover { background: #36c76a; }
        .back { color: #43e97b; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <a href="dashboard.jsp" class="back">← Back to Dashboard</a>
        <h2>Create Support Ticket</h2>
        <form action="<%= request.getContextPath() %>/helpdesk/create" method="post">
            <label>Subject *</label>
            <input type="text" name="subject" required>
            
            <label>Category *</label>
            <select name="category" required>
                <option value="">Select Category</option>
                <option value="Technical">Technical Issue</option>
                <option value="HR">HR Related</option>
                <option value="Payroll">Payroll</option>
                <option value="IT Support">IT Support</option>
                <option value="Other">Other</option>
            </select>
            
            <label>Priority *</label>
            <select name="priority" required>
                <option value="LOW">Low</option>
                <option value="MEDIUM" selected>Medium</option>
                <option value="HIGH">High</option>
                <option value="CRITICAL">Critical</option>
            </select>
            
            <label>Description *</label>
            <textarea name="description" rows="5" required></textarea>
            
            <button type="submit">Create Ticket</button>
        </form>
    </div>
</body>
</html>
