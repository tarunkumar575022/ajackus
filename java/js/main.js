const employees = JSON.parse(localStorage.getItem("employees")) || [
    { id: 1, firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com', department: 'HR', role: 'Manager' },
    { id: 2, firstName: 'Jane', lastName: 'Smith', email: 'jane.smith@example.com', department: 'IT', role: 'Developer' },
]

localStorage.setItem('employees', JSON.stringify(employees));

function renderEmployees() {
    const container = document.getElementById("employeeList")
    container.innerHTML = ""
    employees.forEach(emp => {
        const card = document.createElement("div")
        card.innerHTML = `
            <strong> ${emp.firstName} ${emp.lastName} </strong>
            <P> <strong>Email: </strong> ${emp.email} </p>
            <P> <strong>Department: </strong> ${emp.department} </p>
            <P> <strong>Role: </strong> ${emp.role} </p>
            <div>
                <button onclick="editEmployee(${emp.id})"> Edit </button>
                <button onclick="deleteEmployee(${emp.id})"> Delete </button>
            </div>
        `
        container.appendChild(card)
    })
}


function deleteEmployee(id) {
    const index = employees.findIndex(emp => emp.id === id)
    if (index > -1 && confirm("Delete this Employee")) {
        employees.splice(index, 1)
        localStorage.setItem("employees", JSON.stringify(employees))
        renderEmployees()
    }
}


function editEmployee(id) {
    const emp = employees.find(emp => emp.id === id)

    if(emp) {
        const newName = prompt("New First Name:", emp.firstName)
        const newEmail = prompt("New Email:", emp.email)

        if (newName && newEmail) {
            emp.firstName = newName
            emp.email = newEmail
            localStorage.setItem("employees", JSON.stringify(employees))
            renderEmployees()
        }
    }
}


document.addEventListener("DOMContentLoaded", renderEmployees);