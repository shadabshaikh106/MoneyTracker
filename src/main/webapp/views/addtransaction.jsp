<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Transaction</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f4f8; padding: 20px; }
        .form-container { background: #fff; padding: 20px; border-radius: 10px; width: 400px; margin: auto; }
        h2 { text-align: center; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px; }
        button { margin-top: 15px; width: 100%; padding: 10px; background: #2c3e50; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background: #34495e; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add Transaction</h2>
     
    <c:if test="${not empty errorMessage}">
   <div style="color:red; font-weight:bold;">
       ${errorMessage}
   </div>
</c:if>
    <form action="${pageContext.request.contextPath}/transaction/save" method="post">
        <label>Person Name</label>
        <input type="text" name="personName" required>

        <label>Amount</label>
        <input type="number" name="amount" required step="0.01">

        <label>Type</label>
        <select name="type" required>
            <option value="Borrow">Borrow</option>
            <option value="Lend">Lend</option>
        </select>

        <label>Status</label>
        <select name="status" required>
            <option value="Pending">Pending</option>
            <option value="Paid">Paid</option>
        </select>

        <button type="submit">Save Transaction</button>
    </form>
   
    
</div>
</body>
</html>