<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <style>
        .spacer {
            border-spacing: 7px;
        }

        input:invalid:not(:placeholder-shown) {
            border-color: red;
        }

        input:valid:not(:placeholder-shown) {
            border-color: green;
        }

        .addButtonProp {
            height: 20px;
            width: 100%;
        }
    </style>
</head>

<body>
<table border="2px">
    <tr>
        <td>
            <table class="spacer" cellspacing="5px" align="center">
                <tr style="font-style: italic">
                    <td>ID</td>
                    <td>Name</td>
                    <td>Surname</td>
                    <td>Department</td>
                    <td>Salary</td>
                    <td>Operations</td>
                </tr>
                <c:forEach var="emp" items="${employeeList}">
                    <c:url var="updateButton" value="/updateInfo">
                        <c:param name="empId" value="${emp.id}"/>
                    </c:url>
                    <%--                                                                            --%>
                    <c:url var="deleteButton" value="/deleteEmployee">
                        <c:param name="empId" value="${emp.id}"/>
                    </c:url>
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.surname}</td>
                        <td>${emp.department}</td>
                        <td>${emp.salary}</td>
                        <td>
                            <input type="button" value="Update" onclick="window.location.href='${updateButton}'">
                            <input type="button" value="Delete" onclick="window.location.href='${deleteButton}'">
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </td>
        <td>
            <table>
                <form:form action="/saveEmployee" modelAttribute="employee">
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            <form:input type="text" path="name" minlength="1" maxlength="18" placeholder="name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Surname
                        </td>
                        <td>
                            <form:input type="text" path="surname" minlength="1" maxlength="18" placeholder="surname"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Salary
                        </td>
                        <td>
                            <form:input type="number" path="salary" min="500" max="1500"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Department
                        </td>
                        <td>
                            <form:select path="department">
                                <form:option value="IT" label="IT"/>
                                <form:option value="HR" label="HR"/>
                                <form:option value="Sales" label="Sales"/>
                            </form:select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input class="addButtonProp" type="submit" value="ADD">
                        </td>
                    </tr>
                </form:form>

                <%--<form:select path="department">
                                    <form:options items="${employee.departments}"/>
                                </form:select>--%>
                <%--<form action="/saveEmployee">
                    Name<br>
                    <input type="text" name="name" placeholder="name"/>
                    Surname<br>
                    <input type="text" name="surname" placeholder="surname"/>
                    Department<br>
                    <input type="text" name="department" placeholder="department"/>
                    Salary<br>
                    <input type="text" name="salary" placeholder="0"/>
                    <br>
                    <input type="submit" value="ADD">
                </form>--%>
            </table>
        </td>
    </tr>
</table>
<br><br>
<input type="button" value="add"
       onclick="window.location.href='/addNewEmployee'">

<input type="button" value="get"
       onclick="window.location.href='/getEmployee'">
</body>
</html>