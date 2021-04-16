<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.Collection" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
          integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <title>car market</title>
    <style type="text/css">
   #header1 {
       position: absolute;
       top: 1px; 
       left: 195px;
       font-weight: bold;
       font-size:27px;
       color: #B22222;
   }    
   #exit {
       position: absolute;
       top: 10px;
       right: 195px;
   }
   #container {
       position: absolute;
       top: 50px;
       left: 190px;
       
   }
    </style>
</head>
<body>
      
       
<a id="header1" class="nav-link" href="<%=request.getContextPath()%>/index.jsp">AUTO <span><i class='fas fa-car-alt'></i></span> MARKET</a>

<div id="container" class="container pt-3">
    

    <div  class="card" class="row">
        <div  style="width: 100%">
            <div class="card-header bg-danger text-white">
                Мои объявления
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Объявления</th>
                        <th scope="col">Фото</th>
                    </tr>
                    </thead>
                    <tbody>
                     

                    <c:forEach items="${posts}" var="post">
                        <tr>
                            <td>
                                <c:out value="${post.description}"/><br><br>
                                <a href='<c:url value="/delete_photo?name=${post.id}.jpg"/>'>
                                    <i class="fa fa-camera fa-stack-5x" style="color: red">удалить фото</i>
                                </a>
                                <br>
                                <a href='<c:url value="/upload.jsp?id=${post.id}"/>'>
                                    <i class="fa fa-camera fa-stack-5x" style="color: green">добавить фото</i>
                                </a>
                                <br><br>    
                                
                                <a class="btn btn-danger" href="<c:url value='/delete_post?id=${post.id}'/>">
                                    <i class="fa fa-trash"></i> удалить объявление
                                </a>
                                
                            </td>
                            <td>
                                <img src="<c:url value='/download?name=${post.id}.jpg'/>" width="180px" height="180px"/>
                                
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<a  id="exit" class="nav-link" href="<%=request.getContextPath()%>/login.jsp"> <c:out value="${user.name}"/> | Выйти</a>    
</body>
</html>

