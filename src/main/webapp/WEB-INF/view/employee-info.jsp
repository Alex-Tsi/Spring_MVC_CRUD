<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>


<body>
<form:form action="/saveEmployee" modelAttribute="employee">
    <table>
        <form:hidden path="id"/>
            <%--По-сути форма вызывает геттеры для полей модели, но только для тех, что указаны в path
            но отправляет она совершенно новый объект такого же типа и перед отправкой сетает поля из forms
            ЭТО НЕ ТОЧНО!--%>
        <tr>
            <td>
                Name
            </td>
            <td>
                <form:input path="name" placeholder="Input name"/>
            </td>
        </tr>
        <tr>
            <td>
                Surname
            </td>
            <td>
                <form:input path="surname" placeholder="Input surname"/>
            </td>
        </tr>
        <tr>
            <td>
                Department
            </td>
            <td>
                <form:input path="department" placeholder="Department"/>
            </td>
        </tr>
        <tr>
            <td>
                Salary
            </td>
            <td>
                <form:input type="text" path="salary" placeholder="salary"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="OK">
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
