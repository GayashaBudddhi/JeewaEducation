<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Student registration

	        <form:form method="POST" 
          action="/spring-mvc-xml/addEmployee" modelAttribute="user">
             <table>
                <tr>
                    <td><form:label path="fullName">Name</form:label></td>
                    <td><form:input path="fullName"/></td>
                </tr>
                <tr>
                    <td><form:label path="userId">Id</form:label></td>
                    <td><form:input path="userId"/></td>
                </tr>
                <tr>
                    <td><form:label path="username">
                      Contact Number</form:label></td>
                    <td><form:input path="username"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form:form>

</body>
</html>