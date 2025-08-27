<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Transactions</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f4f8; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background: #2c3e50; color: white; }
    </style>
</head>
<body>
    <h2>Transaction History</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Person</th>
            <th>Amount</th>
            <th>Type</th>
            <th>Status</th>
            <th>Date</th>
        </tr>
        <c:forEach var="txn" items="${transactions}">
            <tr>
                <td>${txn.id}</td>
                <td>${txn.personName}</td>
                <td>₹${txn.amount}</td>
                <td>${txn.type}</td>
                <td>${txn.status}</td>
                <td>${txn.createdAt}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>