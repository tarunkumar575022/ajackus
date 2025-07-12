<#assign employees = [
    { id: 1, firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com', department: 'HR', role: 'Manager' },
    { id: 2, firstName: 'Jane', lastName: 'Smith', email: 'jane.smith@example.com', department: 'IT', role: 'Developer' },
]>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employye Directory</title>
    <Link rel="stylesheet" href = "css/styles.css">
</head>

<body>
    <header class="header">
        <h1>Employee Directory</h1>
        <button onclick="location.href = 'form.ftl'">Add Employee</button>
    </header>

    <main>
        <div id="employeeList" class="card-container">
            <#list employees as emp>
                <div data-id="${emp.id}" class="employee-card">
                    <strong>${emp.firstName} ${emp.lastName}</strong>
                    <p><strong>Email:</strong>${emp.email}</p>
                    <p><strong>Department:</strong>${emp.department}</p>
                    <p><strong>Role:</strong>${emp.role}</p>
                    <div class="card-actions">
                        <button class="btn" onclick="editEmployee('${emp.id}')">Edit</button>
                        <button class="btn btn-blue" onclick="deleteEmployee('${emp.id}')">Delete</button>
                    </div>
                </div>
            <#list>
        </div>
    </main>

    <footer class="footer"> 2025 Employee Directory App. All rights reserved.</footer>

    <script src="js/main.js"></script>
</body>
</html>