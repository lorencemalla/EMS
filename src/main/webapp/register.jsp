<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Employee Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .register-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            width: 100%;
            padding: 40px;
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logo-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo-section h1 {
            color: #667eea;
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .logo-section p {
            color: #666;
            font-size: 16px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #333;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            color: #333;
            transition: all 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .password-toggle {
            position: relative;
        }

        .password-toggle input {
            padding-right: 45px;
        }

        .toggle-btn {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #667eea;
            cursor: pointer;
            font-size: 18px;
            padding: 5px;
        }

        .btn-register {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
        }

        .btn-register:active {
            transform: translateY(0);
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            color: #666;
            font-size: 15px;
        }

        .login-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .back-home {
            text-align: center;
            margin-top: 15px;
        }

        .back-home a {
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .back-home a:hover {
            text-decoration: underline;
        }

        .error-message {
            background: #fee;
            color: #c33;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #c33;
            font-size: 14px;
        }

        .success-message {
            background: #efe;
            color: #3c3;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #3c3;
            font-size: 14px;
        }

        /* Responsive */
        @media (max-width: 576px) {
            .register-container {
                padding: 30px 20px;
            }

            .logo-section h1 {
                font-size: 26px;
            }

            .logo-section p {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="logo-section">
            <h1>🏢 Create Account</h1>
            <p>Join our Employee Management System</p>
        </div>

        <!-- Display Error Message -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <!-- Display Success Message -->
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="success-message">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/register" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">Username *</label>
                <input type="text" id="username" name="username" required 
                       pattern="[a-zA-Z0-9_]{3,20}" 
                       title="Username must be 3-20 characters (letters, numbers, underscore only)">
            </div>

            <div class="form-group">
                <label for="email">Email *</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group password-toggle">
                <label for="password">Password *</label>
                <input type="password" id="password" name="password" required 
                       minlength="6" 
                       title="Password must be at least 6 characters">
                <button type="button" class="toggle-btn" onclick="togglePassword('password')">👁️</button>
            </div>

            <div class="form-group password-toggle">
                <label for="confirmPassword">Confirm Password *</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <button type="button" class="toggle-btn" onclick="togglePassword('confirmPassword')">👁️</button>
            </div>

            <div class="form-group">
                <label for="role">Register As *</label>
                <select id="role" name="role" required>
                    <option value="">-- Select Role --</option>
                    <option value="EMPLOYEE">Employee</option>
                    <option value="ADMIN">Admin</option>
                </select>
            </div>

            <button type="submit" class="btn-register">Register</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>

        <div class="back-home">
            <a href="index.jsp">← Back to Home</a>
        </div>
    </div>

    <script>
        function togglePassword(fieldId) {
            const passwordField = document.getElementById(fieldId);
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
            } else {
                passwordField.type = 'password';
            }
        }

        function validateForm() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                alert('Passwords do not match!');
                return false;
            }

            if (password.length < 6) {
                alert('Password must be at least 6 characters long!');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
