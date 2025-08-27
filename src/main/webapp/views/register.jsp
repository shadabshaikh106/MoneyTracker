<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration Form</title>
    <style>
        body {
            background: #f0f4f8;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 400px;
        }

        .form-container h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #cccccc;
            box-sizing: border-box;
        }

        .form-group input[type="submit"],
        .form-group input[type="button"] {
            width: 48%;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }

        .form-group input[type="button"] {
            background-color: #f44336;
            float: right;
        }

        .form-group input[type="submit"]:hover,
        .form-group input[type="button"]:hover {
            opacity: 0.9;
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Registration Form</h2>

        <form action="/moneytracker/register/insert" method="post">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" required />
            </div>

            <div class="form-group">
                <label>Mobile No:</label>
                <input type="tel" name="mobile" pattern="[0-9]{10}" maxlength="10" title="Enter a valid 10-digit mobile number" required />
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required />
            </div>

            <div class="form-group">
                <label>UserName:</label>
                <input type="text" name="username" required />
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required />
            </div>

            <div class="form-group">
                <label>Confirm Password:</label>
                <input type="password" name="confirmPassword" required />
            </div>

            <!-- New Balance Field -->
            <div class="form-group">
                <label>Initial Balance:</label>
                <input type="number" name="balance" min="0" step="0.01" value="0.00" required />
            </div>

            <div class="form-group">
                <input type="submit" value="Register" />
                <input type="button" value="Cancel" onclick="window.location.href='/login'" />
            </div>
        </form>

        <div class="message">
            <p class="error">${error}</p>
        </div>
    </div>
</body>
</html>