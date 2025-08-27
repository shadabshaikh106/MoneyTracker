<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>People List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg border-0 rounded-3">
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">People List</h4>
            <a href="/people/" class="btn btn-success btn-sm">+ Add Person</a>
        </div>

        <div class="card-body p-4">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Name</th>
                        <th>Surname</th>
                        <th>Mobile</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="person" items="${people}">
                        <tr>
                            <td>${person.name}</td>
                            <td>${person.surname}</td>
                            <td>${person.mobile}</td>
                            <td>${person.email}</td>
                            <td>${person.address}</td>
                            <td class="text-center">
                                <a href="/people/edit?id=${person.id}" class="btn btn-warning btn-sm me-2">Edit</a>
                                <a href="/people/delete?id=${person.id}" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this person?')">
                                   Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty people}">
                        <tr>
                            <td colspan="6" class="text-center text-muted">No people added yet.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>