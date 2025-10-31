<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System - Home</title>
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
            color: #fff;
        }

        /* Navigation Bar */
        .navbar {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
            color: white;
            letter-spacing: 1px;
        }

        .nav-buttons a {
            display: inline-block;
            margin-left: 15px;
            padding: 12px 30px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s;
        }

        .btn-login {
            background: white;
            color: #667eea;
            border: 2px solid white;
        }

        .btn-login:hover {
            background: transparent;
            color: white;
        }

        .btn-register {
            background: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-register:hover {
            background: white;
            color: #667eea;
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding: 80px 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .hero h1 {
            font-size: 56px;
            font-weight: 700;
            margin-bottom: 20px;
            line-height: 1.2;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
        }

        .hero p {
            font-size: 22px;
            margin-bottom: 40px;
            opacity: 0.95;
            line-height: 1.6;
        }

        .hero-buttons a {
            display: inline-block;
            margin: 10px 15px;
            padding: 16px 40px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            font-size: 18px;
            transition: all 0.3s;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        }

        .btn-primary {
            background: white;
            color: #667eea;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
        }

        .btn-secondary {
            background: transparent;
            color: white;
            border: 3px solid white;
        }

        .btn-secondary:hover {
            background: white;
            color: #667eea;
            transform: translateY(-3px);
        }

        /* Features Section */
        .features {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 60px 20px;
            margin: 50px auto;
            max-width: 1200px;
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .features h2 {
            text-align: center;
            font-size: 42px;
            margin-bottom: 50px;
            font-weight: 700;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.15);
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            transition: all 0.3s;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .feature-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .feature-card h3 {
            font-size: 24px;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .feature-card p {
            font-size: 16px;
            opacity: 0.9;
            line-height: 1.6;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 30px 20px;
            background: rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }

        .footer p {
            font-size: 16px;
            opacity: 0.8;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .navbar {
                padding: 15px 20px;
                flex-direction: column;
                gap: 15px;
            }

            .logo {
                font-size: 24px;
            }

            .nav-buttons a {
                margin-left: 8px;
                padding: 10px 20px;
                font-size: 14px;
            }

            .hero h1 {
                font-size: 36px;
            }

            .hero p {
                font-size: 18px;
            }

            .hero-buttons a {
                padding: 14px 30px;
                font-size: 16px;
            }

            .features h2 {
                font-size: 32px;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo">🏢 EMS</div>
        <div class="nav-buttons">
            <a href="login.jsp" class="btn-login">Login</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Employee Management System</h1>
        <p>
            Streamline your workforce operations with our comprehensive Employee Management System. 
            Manage employees, track attendance, process leave requests, and handle help desk tickets 
            all in one powerful platform.
        </p>
        <div class="hero-buttons">
            <a href="login.jsp" class="btn-primary">Get Started</a>
            <a href="#features" class="btn-secondary">Learn More</a>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="features">
        <h2>Why Choose Our System?</h2>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">👥</div>
                <h3>Employee Management</h3>
                <p>Comprehensive employee profiles with detailed information, department tracking, and role-based access control.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">📅</div>
                <h3>Attendance Tracking</h3>
                <p>Real-time attendance monitoring with check-in/check-out functionality and detailed attendance reports.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🏖️</div>
                <h3>Leave Management</h3>
                <p>Streamlined leave application process with approval workflows and leave balance tracking.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🎫</div>
                <h3>Help Desk Support</h3>
                <p>Integrated ticketing system for employee queries and issue resolution with priority management.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🔒</div>
                <h3>Secure Access</h3>
                <p>Role-based authentication ensures data security with separate access levels for admins and employees.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">📊</div>
                <h3>Easy Reporting</h3>
                <p>Generate comprehensive reports on attendance, leaves, and employee performance metrics.</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 Employee Management System. All rights reserved.</p>
    </footer>
</body>
</html>
