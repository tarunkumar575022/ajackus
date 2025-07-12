<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>
    <Link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Add Employee</h2>
        <form id="employeeForm">
            <div class="Content">
            <label>First Name <input type="text" id="firstname" required > </label>
            <label>Last Name <input type="text" id="lastname" required> </label>
            <label>Email <input type="email" id="email" required> </label>
            <label>Department
                <select id="department" required>
                    <option value="">--select--</option>
                    <option >HR</option>
                    <option >IT</option>
                    <option >Finance<option>
                </select>
            </label>
            <label>Role
                <select id="role" required>
                    <option value="">--select--</option>
                    <option >Manager</option>
                    <option >Developer</option>
                    <option >Analyst<option>
                </select>
            </label>
            </div>
            <div class="form-actions">
                <button type="button" onclick="location.href = 'index.ftl'" class="btn">Cancel</button>
                <button type="submit">Add</button>
            </div>
        </form>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("employeeForm").addEventListener("submit", function(e) {
                e.preventDefault()
                const firstName = document.getElementById("firstname")
                const lastName = document.getElementById("lastname")
                const email = document.getElementById("email")
                const department = document.getElementById("department")
                const role = document.getElementById("role")

                const employees = JSON.parse(localStorage.getItem("employees")) || []
                const newEmployee = {
                    id: Date.now(),
                    firstName: firstName.value.trim(),
                    lastName: lastName.value.trim(),
                    email: email.value.trim(),
                    department: department.value,
                    role: role.value
                }
                employees.push(newEmployee)
                localStorage.setItem("employees", JSON.stringify(employees))
                window.location.href = 'index.ftl'
            })
        })
        
    </script>
</body>