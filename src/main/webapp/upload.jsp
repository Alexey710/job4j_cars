<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="ru.job4j.cars.repository.AdRepository" %>
<%@ page import="ru.job4j.cars.model.Post" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Upload</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
          integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <style type="text/css">
       #header1 {
       position: absolute;
       top: 1px; 
       left: 600px;
       font-weight: bold;
       font-size:27px;
       color: #B22222
       }
       #main_container {
       position: absolute;   
       left: 475px;
       top: 30px;
       width: 500px; 
       height: 300px;
       }
    </style>
</head>

<body>
<%
    String id = request.getParameter("id");
    Post post = new Post();
    if (id != null) {
        AdRepository rep = new AdRepository();
        post = rep.findPostById(Integer.valueOf(id));
    }
%>
<a id="header1" class="nav-link" href="<%=request.getContextPath()%>/index.jsp">AUTO <span><i class='fas fa-car-alt'></i></span> MARKET</a> 
<div id="main_container" class="container">
    <table class="table">
        <thead>
        <tr>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${images}" var="image" varStatus="status">
            <tr valign="top">
                <td><a href="<c:url value='/download?name=${image}'/>">Download</a></td>
                <td>
                    <img src="<c:url value='/download?name=${image}'/>" width="100px" height="100px"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h2>Загрузка фото</h2>
    <form action="<%=request.getContextPath()%>/upload?id=<%=post.getId()%>" method="post" enctype="multipart/form-data">
        <div class="checkbox">
            <input type="file" name="file">
        </div>
        <button type="submit" class="btn btn-default">Загрузить</button>
    </form>
</div>
</body>
</html>

