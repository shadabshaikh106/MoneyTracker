<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${person.id == null ? "Add Person" : "Edit Person"}</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg border-0 rounded-3">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">${person.id == null ? "Add Person" : "Edit Person"}</h4>
                </div>

                <div class="card-body p-4">
                    <form action="${person.id == null ? '/people/save' : '/people/update'}" method="post">
                        <c:if test="${person.id != null}">
                            <input type="hidden" name="id" value="${person.id}"/>
                        </c:if>

                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" value="${person.name}" class="form-control" required/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Surname</label>
                            <input type="text" name="surname" value="${person.surname}" class="form-control"/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mobile</label>
                            <input type="text" name="mobile" value="${person.mobile}" class="form-control"/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" value="${person.email}" class="form-control"/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <textarea name="address" class="form-control" rows="3">${person.address}</textarea>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn ${person.id == null ? 'btn-success' : 'btn-warning'}">
                                ${person.id == null ? "Save" : "Update"}
                            </button>
                            <a href="/dashboard/" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>