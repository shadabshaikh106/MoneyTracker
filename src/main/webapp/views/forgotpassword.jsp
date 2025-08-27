<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .logo-title {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .logo-title i {
            font-size: 32px;
            color: #007bff;
            margin-right: 10px;
        }

        .logo-title h2 {
            font-size: 24px;
            color: #333;
            margin: 0;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            background-color: #007bff;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .success-msg {
            color: green;
            font-size: 14px;
            margin-top: 10px;
        }

        .error-msg {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="logo-title">
            <i class="fas fa-lock"></i>
            <h2>Forgot Password</h2>
        </div>

        <form action="/forgotpassword/process" method="post">

            <!-- Email or Mobile input -->
            <label>Enter Email or Mobile:</label>
            <input type="text" name="input" value="${input}" required />

            <!-- OTP Section -->
            <c:if test="${not empty showOtp and not empty otp}">
                <p class="success-msg">Your OTP is: <strong>${otp}</strong></p>
                <label>Enter OTP:</label>
                <input type="text" name="otpEntered" required />
            </c:if>

            <input type="submit" value="Submit" />
        </form>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <p class="error-msg">${error}</p>
        </c:if>
    </div>

</body>
</html>
