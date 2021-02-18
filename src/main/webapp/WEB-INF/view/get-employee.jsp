<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>
        .spacer {
            border-spacing: 7px;
        }
    </style>
</head>
<body>

<table border="2px">
    <tr>
        <td>
            <form action="/getEmployee">
                <table class="spacer" cellspacing="5px" align="center">
                    <tr>
                        <td>
                            ID
                        </td>
                        <td>
                            <input type="text" name="empId">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="GET">
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td>
            <table class="spacer" cellspacing="5px" align="center">
                <tr style="font-style: italic">
                    <td>Name</td>
                    <td>Surname</td>
                    <td>Department</td>
                    <td>Salary</td>
                </tr>
                <tr>
                    <td>
                        ${employee.name}
                    </td>
                    <td>
                        ${employee.surname}
                    </td>
                    <td>
                        ${employee.department}
                    </td>
                    <td>
                        ${employee.salary}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>