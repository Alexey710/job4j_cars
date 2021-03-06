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
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
          integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <script>
        function validate() {
            if ($('#password').val() == "") {
                alert($('#password').attr('title'));
                return false;
            }
            if ($('#email').val() == "") {
                alert($('#email').attr('title'));
                return false;
            }
            if ($('#name').val() == "") {
                alert($('#name').attr('title'));
                return false;
            }
        }
    </script>
    <title>регистрация CARMARKET</title>
    <style type="text/css">
   #main_container {
    position: absolute;   
    left: 475px;
    top: 50px;
    width: 500px; 
    height: 300px;
   }
   #header1 {
       position: absolute;
       top: 1px; 
       left: 600px;
       font-weight: bold;
       font-size:27px;
       color: #B22222;
   } 
    </style>

</head>
<body>

    <a id="header1" class="nav-link" href="<%=request.getContextPath()%>/index.jsp">AUTO <span><i class='fas fa-car-alt'></i></span> MARKET</a>
    <div id="main_container" class="row">
        <div class="card" style="width: 100%">
            <div class="card-header bg-danger text-white">
                Регистрация
            </div>
            <div class="card-body">
                <form action="<%=request.getContextPath()%>/reg.do" method="post">
                    <div class="form-group">
                        <label>Имя</label>
                        <input id="name" title="Enter  name." type="text" class="form-control" name="name">
                    </div>
                    <div class="form-group">
                        <label>Почта</label>
                        <input id="email" title="Enter email." type="text" class="form-control" name="email">
                    </div>
                    <div class="form-group">
                        <label>Пароль</label>
                        <input id="password" title="Enter password." type="text" class="form-control" name="password">
                    </div>
                    <button style="background:brown; color: white" type="submit" class="btn btn-primary" onclick="return validate();">
                        Зарегистрироваться
                    </button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>