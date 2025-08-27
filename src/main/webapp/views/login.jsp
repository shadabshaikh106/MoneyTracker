<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Form</title>

    <!-- ✅ Font Awesome CDN for Lock Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <style>
        body {
            background: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #f6fbff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            width: 380px;
            text-align: center;
        }

        .login-container i.fa-lock {
            font-size: 40px;
            color: #007bff;
            margin-bottom: 10px;
            animation: bounce 1.2s infinite;
        }

        .login-container h2 {
            color: #333;
            margin-bottom: 15px;
        }

        /* ✅ Success Message Style */
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 15px;
            font-size: 14px;
        }

        /* ✅ Error Message Style */
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 18px;
            text-align: left;
        }

        .form-group label {
            display: block;
            color: #555;
            margin-bottom: 6px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 20px;
        }

        .btn-group input,
        .btn-group button {
            flex: 1 1 45%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            color: #fff;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-login { background-color: #007bff; }
        .btn-cancel { background-color: #dc3545; }
        .btn-forgot { background-color: #6c757d; }
        .btn-register { background-color: #28a745; }

        .btn-group input:hover,
        .btn-group button:hover {
            opacity: 0.9;
        }

        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-8px);
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <i class="fas fa-lock"></i>
        <h2>Login</h2>

        <!-- ✅ Show success message -->
        <c:if test="${not empty success}">
            <div class="success-message">${success}</div>
        </c:if>

        <!-- ❌ Show error message -->
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login/process" method="post">
            <div class="form-group">
                <label>Username:</label>
                <input type="text" name="username" required />
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required />
            </div>
            <div class="btn-group">
                <input type="submit" value="Login" class="btn-login" />
                <button type="button" class="btn-cancel" onclick="window.close();">Cancel</button>
                <button type="button" class="btn-forgot" onclick="window.location.href='/forgotpassword'">Forgot Password</button>
                <button type="button" class="btn-register" onclick="window.location.href='/moneytracker/register/form'">New Register</button>
            </div>
        </form>
    </div>
</body>
</html>