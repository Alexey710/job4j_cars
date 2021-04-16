<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
     <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
          integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
          integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <title>Cars</title>
     <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <style type="text/css">
   #bt1 {
    position: absolute;
    top: 65px; 
    left: 1055px;
    font-size:18px;
    font-weight: bold;
    height:40px;
    width:270px; 
    background: #B22222;
    color: white;
    border-radius: 10px;
   }
   #select1 {
    height:40px;
    width:270px;
    position: absolute;
    top: 65px; 
    left: 215px;
    border-radius: 10px;
    border: 3px solid #B22222;
    font-weight: bold;
    color: #B22222;
   }
   
   #radio1 {
    height:20px;
    width:20px;
    position: absolute;
    top: 75px; 
    left: 545px;
   }
   #text1 {
    position: absolute;
    top: 75px; 
    left: 575px;
    font-weight: bold;
    color: #B22222;
   }
   #radio2 {
    height:20px;
    width:20px;
    position: absolute;
    top: 75px; 
    left: 745px;
    border: 3px solid #FFC0CB;
    font-weight: bold;
    color: #B22222;
   }
   #text2 {
    position: absolute;
    top: 75px; 
    left: 775px;
    font-weight: bold;
    color: #B22222;
   }
   #header1 {
       position: absolute;
       top: 1px; 
       left: 215px;
       font-weight: bold;
       font-size:27px;
       color: #B22222;
   }
   #container {
       position: absolute;
       top: 100px;
       left: 200px;
       
   }
   #frame {
    position: absolute;
    top: 50px;
    left: 215px;
    border: 3px solid #B22222;
    height: 1px;
    width:1110px;
    
  }
  #exit {
    position: absolute;
    top: 5px;
    right: 175px;
  }
   
    </style>
</head>
<body onload="getParameter();">
    <%  
        if (request.getAttribute("posts") == null) {
            response.sendRedirect(request.getContextPath() + "/start"); 
        }
    %>
   
    
    <script>
       
        function getParameter() {
        
        let fromJavaSide = '<c:out value="${radio}" />';
      
        if (fromJavaSide === "all") {
            document.getElementById("radio1").checked = true;
            document.getElementById("radio2").checked = false;
        }
        if (fromJavaSide === "today") {
            document.getElementById("radio2").checked = true;
            document.getElementById("radio1").checked = false;
        }
        }
    </script>
    
    <div id="header1">AUTO <span><i class='fas fa-car-alt'></i></span> MARKET</div>
  
    <div id='frame' background:brown"></div>
    
    <div>
        <form name="form1" action="<%=request.getContextPath()%>/marks" method="POST">
            <select id="select1" name="select1" type="text" class="form-control" onchange = "document.form1.submit();">
                <option selected disabled hidden>выберите марку автомобиля</option>
                <option value="Toyota">Toyota</option>
                <option value="VAZ">VAZ</option>
                <option value="BMW">BMW</option>
            </select>
            </form>
            
            <form name="form2" action="<%=request.getContextPath()%>/show" method="POST">
            <label id = "text1" for="today">все объявления</label>
            <input type="radio"  id="radio1" name="radio" class="radioClass" value="all" onchange = "document.form2.submit();">
            <label id = "text2" for="all">объявления за сегодня</label>
            <input type="radio"  id="radio2" name="radio" class="radioClass" value="today" onchange = "document.form2.submit();">
            </form>
           
          
            <br><button id="bt1" onclick="document.location.href ='http://localhost:8080/cars/edit_ad.jsp';">
                добавить объявление <i class='fas fa-car-side'></i></button><br>
        
    </div>
       
    <div id="container" class="container pt-3">
       
                <div  class="card" class="row">
                    <div class="card-header bg-danger text-white">
                    Объявления
                    </div>
                    <div class="card-body">
                         
    <table class="table" id="table">
        <thead>
        <tr>
            <th>Фото</th>
            <th>Дата объявления</th>
            <th>Описание</th>
        </tr>
        </thead>
        <tbody>
            
            <c:forEach items="${posts}" var="post">
                        <tr>
                            <td>
                                <img src="<c:url value='/download?name=${post.id}.jpg'/>" width="100px" height="100px"/>
                            </td>
                            <td>
                               <c:out value="${post.created}"/>
                            </td>
                            <td>
                                <c:out value="${post.description}"/>
                            </td>
                            
                        </tr>
            </c:forEach>
   
        </tbody>
    </table>
                           
                    </div>
                </div>
    </div>
            
    <a  id="exit" class="nav-link" href="<%=request.getContextPath()%>/login.jsp"> <c:out value="${user.name}"/> | Выйти</a>        

</body>
</html>