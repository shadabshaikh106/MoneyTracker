<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .reset-box {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 350px;
        }

        .reset-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .reset-box label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        .reset-box input[type="password"] {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .reset-box input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .reset-box input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }

        .success {
            color: green;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="reset-box">
    <h2>Reset Password</h2>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <c:if test="${not empty success}">
        <p class="success">${success}</p>
    </c:if>

    <form action="/resetpassword" method="post">
        <label for="newPassword">Password</label>
        <input type="password" id="newPassword" name="newPassword" required />

        <label for="confirmPassword">Re-type Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required />

        <input type="submit" value="Reset Password" />
    </form>
</div>

</body>
</html>