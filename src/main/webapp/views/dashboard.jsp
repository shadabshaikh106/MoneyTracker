<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Secure Bank</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f6f8;
        }
        .sidebar {
            width: 220px;
            height: 100vh;
            background-color: #2c3e50;
            color: white;
            float: left;
            padding-top: 20px;
            box-sizing: border-box;
        }
        .sidebar .logo {
            text-align: center;
            padding: 0 10px 20px 10px;
        }
        .sidebar .logo img {
            max-width: 120px; /* Bigger logo */
            height: auto;
            display: block;
            margin: 0 auto 10px auto;
        }
        .sidebar .logo h2 {
            font-size: 18px;
            margin-top: 8px;
        }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #34495e;
        }
        .main {
            margin-left: 220px;
            padding: 20px;
        }
        .card {
            background: white;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .card h3 {
            margin: 0;
        }
        .stats {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        .stat-card {
            background: white;
            padding: 15px;
            flex: 1;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            font-size: 18px;
        }
        .quick-buttons {
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn-borrow { background-color: red; color: white; margin-right: 10px; }
        .btn-lend { background-color: green; color: white; }
        .btn-search { background-color: #3498db; color: white; }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        .status-borrow { color: red; }
        .status-lend { color: green; }
        .btn-edit { background-color: #f39c12; color: white; }
        .btn-delete { background-color: #e74c3c; color: white; }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="SecureBank Logo">
        <h2>Secure Bank</h2>
   </div>

    <a href="${pageContext.request.contextPath}/people/">Add Person</a>
    <a href="${pageContext.request.contextPath}/people/view">View People</a>
    <a href="${pageContext.request.contextPath}/transaction/">Add Transaction</a>
    <a href="${pageContext.request.contextPath}/transaction/list">View Transactions</a>
    <a href="logout">Logout</a>
</div>

<div class="main">
    <h1>Welcome, ${sessionScope.username}</h1>

    <!-- Stats -->
    <div class="stats">
        <div class="stat-card">
            <h3>Total Balance: ₹${balance}</h3>
        </div>
        <div class="stat-card">
            <h3>Total Borrowed: ₹${borrowedAmount}</h3>
        </div>
        <div class="stat-card">
            <h3>Total Lent: ₹${lentAmount}</h3>
        </div>
    </div>

    <!-- Quick Buttons -->
    <div class="quick-buttons">
        <form action="addTransaction" method="get" style="display:inline;">
            <input type="hidden" name="type" value="Borrow">
            <button type="submit" class="btn btn-borrow">Borrow Money</button>
        </form>
        <form action="addTransaction" method="get" style="display:inline;">
            <input type="hidden" name="type" value="Lend">
            <button type="submit" class="btn btn-lend">Lend Money</button>
        </form>
    </div>

    <!-- Search -->
    <div class="card">
        <h3>Quick Search Transactions</h3>
        <form action="/transaction/searchTransactions" method="get">
            <input type="text" name="keyword" placeholder="Search by name, amount, or status" required>
            <button type="submit" class="btn btn-search">Search</button>
        </form>
    </div>

    <!-- Recent Transactions -->
    <div class="card">
        <h3>Recent Transactions</h3>
        <table>
            <tr>
                <th>Person</th>
                <th>Amount</th>
                <th>Type</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <c:forEach var="txn" items="${recentTransactions}">
                <tr>
                    <td>${txn.personName}</td>
                    <td>₹${txn.amount}</td>
                    <td>${txn.type}</td>
                    <td class="${txn.type == 'Borrow' ? 'status-borrow' : 'status-lend'}">${txn.status}</td>
                    <td>
                        <form action="editTransaction" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="${txn.id}" />
                            <button type="submit" class="btn btn-edit">Edit</button>
                        </form>
                        <form action="deleteTransaction" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${txn.id}" />
                            <button type="submit" class="btn btn-delete">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!-- Search Results -->
    <c:if test="${not empty searchResults}">
        <div class="card">
            <h3>Search Results</h3>
            <table>
                <tr>
                    <th>Person</th>
                    <th>Amount</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="txn" items="${searchResults}">
                    <tr>
                        <td>${txn.personName}</td>
                        <td>₹${txn.amount}</td>
                        <td>${txn.type}</td>
                        <td class="${txn.type == 'Borrow' ? 'status-borrow' : 'status-lend'}">${txn.status}</td>
                        <td>
                            <form action="editTransaction" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="${txn.id}" />
                                <button type="submit" class="btn btn-edit">Edit</button>
                            </form>
                            <form action="deleteTransaction" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${txn.id}" />
                                <button type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </c:if>
</div>

</body>
</html>