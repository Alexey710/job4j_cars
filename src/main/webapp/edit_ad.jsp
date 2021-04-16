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
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <title>Cars</title>
    <style type="text/css">
   #header1 {
    position: absolute;
    top: 1px; 
    left: 600px;
    font-weight: bold;
    font-size:27px;
    color: #B22222;
   }
   
   #select1 {
    height:40px;
    width:350px;
    position: absolute;
    top: 80px; 
    left: 110px;
    border-radius: 10px;
    border: 3px solid #B22222;
    font-weight: bold;
    color: #B22222;
   }
   #check1 {
    position: absolute;
    top: 145px; 
    left: 940px;
    visibility: hidden;
   }
   #select2 {
    height:40px;
    width:350px;
    position: absolute;
    top: 140px; 
    left: 110px;
    border-radius: 10px;
    border: 3px solid #B22222;
    font-weight: bold;
    color: #B22222;
   }
   #check2 {
    position: absolute;
    top: 205px; 
    left: 940px;
    visibility: hidden;
   }
   #select3 {
    height:40px;
    width:350px;
    position: absolute;
    top: 200px; 
    left: 110px;
    border-radius: 10px;
    border: 3px solid #B22222;
    font-weight: bold;
    color: #B22222;
   }
   #check3 {
    position: absolute;
    top: 265px; 
    left: 940px;
    visibility: hidden;
   }
   #select4 {
    height:40px;
    width:350px;
    position: absolute;
    top: 260px; 
    left: 110px;
    border-radius: 10px;
    border: 3px solid #B22222;
    font-weight: bold;
    color: #B22222;
   }
   #check4 {
    position: absolute;
    top: 325px; 
    left: 940px;
    visibility: hidden;
   }
   #select5 {
    height:40px;
    width:350px;
    position: absolute;
    top: 320px; 
    left: 110px;
    border-radius: 10px;
    border: 3px solid #B22222;
    font-weight: bold;
    color: #B22222;
   }
   #check5 {
    position: absolute;
    top: 385px; 
    left: 940px;
    visibility: hidden;
   }
   #select6 {
    height:40px;
    width:350px;
    position: absolute;
    top: 380px; 
    left: 110px;
    border-radius: 10px;
    border: 3px solid #B22222;
    font-weight: bold;
    color: #B22222;
   }
    #check6 {
    position: absolute;
    top: 445px; 
    left: 940px;
    visibility: hidden;
   }
   
   #bt1 {
    position: absolute;
    top: 460px; 
    left: 160px;
    font-size:18px;
    font-weight: bold;
    height:80px;
    width:250px; 
    background: #FFC0CB;
    color: white;
    border-radius: 10px;
   }
   
   #ref1 {
    position: absolute;
    top: 620px; 
    left: 585px;
    
   }
   
   #icon1 {
    position: absolute;
    top: 580px; 
    left: 90px;
   }
   
   #frame {
    position: absolute;
    top: 60px; 
    border: 2px solid #B22222;
    height: 650px;
    width:40%;
    margin:0 30%  0 30% ;
  }
  #frame2 {
    position: absolute;
    top: 60px; 
    border: 2px solid #B22222;
    height: 30px;
    width:40%;
    margin:0 30%  0 30% ;
  }

    </style>
</head>
<body onload="mark()">
    
    <script>
        
        function checkTegs(){
            console.log("start checkTegs");
          
            let sum = 0;
            if($('#select1').val()!== null) {
                document.getElementById("check1").style="visibility: visible"; sum++; 
            } else {document.getElementById("check1").style="visibility: hidden";}
            if($('#select2').val()!== null&&$('#select2').val()!=="выберите модель"&&$('#select2').val()!=='') {
                document.getElementById("check2").style="visibility: visible"; sum++;  
            } else {document.getElementById("check2").style="visibility: hidden";}
            if($('#select3').val()!== null&&$('#select3').val()!=='') {
                document.getElementById("check3").style="visibility: visible"; sum++;  
            } else {document.getElementById("check3").style="visibility: hidden";}
            if($('#select4').val()!=='') {
                document.getElementById("check4").style="visibility: visible"; sum++; 
            } else {document.getElementById("check4").style="visibility: hidden";}
            if($('#select5').val()!=='') {
                document.getElementById("check5").style="visibility: visible"; sum++; 
            } else {document.getElementById("check5").style="visibility: hidden";}
            if($('#select6').val()!=='') {
                document.getElementById("check6").style="visibility: visible"; sum++; 
            } else {document.getElementById("check6").style="visibility: hidden";}
            if(sum === 6) {
                let btn = document.getElementById("bt1");
                btn.style="background:#00FF00"; 
                btn.removeAttribute("disabled", "true"); 
            } else {
                let btn = document.getElementById("bt1");
                btn.style="background:#FFC0CB"; 
                btn.setAttribute("disabled", "true"); 
            }
        }
       
        function mark() {
            
        console.log("start mark");
        
        $.ajax({
            type: "POST",
            url: 'http://localhost:8080/cars/show_mark',
            data: JSON.stringify("request"),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {
                console.log(data);
                let marks = '<option selected disabled hidden>выберите марку</option>';
                for(let i=0; i<data.length; i++) {
                    marks += '<option>' + data[i].name +'</option>';
                }
                $('#select1').empty().append(marks);
                checkTegs();
            },
            error: function(errMsg) {
                console.log(errMsg);
            }
        });
    }
     function model() {
            
        console.log("start model");
  
        let query = JSON.stringify($('#select1').val());
        $.ajax({
            type: "POST",
            url: 'http://localhost:8080/cars/models',
            data: query,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data) {
                console.log(data);
                let select = '<option selected disabled hidden>выберите модель</option>';
                for(let i=0; i<data.length; i++) {
                    select += '<option>' + data[i].name +'</option>';
                }
                $('#select2').empty().append(select);
                checkTegs();
            },
            error: function(errMsg) {
                console.log(errMsg);
            }
        });
    }
    
    function block() {
    document.getElementById("bt1").disabled = 'true';
    document.getElementById('form1').submit();
    }
    </script>
    
    <div id="check1"><span style="color:#00FF00"><i class='fas fa-check fa-2x'></i></span></div>
    <div id="check2"><span style="color:#00FF00"><i class='fas fa-check fa-2x'></i></span></div>
    <div id="check3"><span style="color:#00FF00"><i class='fas fa-check fa-2x'></i></span></div>
    <div id="check4"><span style="color:#00FF00"><i class='fas fa-check fa-2x'></i></span></div>
    <div id="check5"><span style="color:#00FF00"><i class='fas fa-check fa-2x'></i></span></div>
    <div id="check6"><span style="color:#00FF00"><i class='fas fa-check fa-2x'></i></span></div>
                        
    
     <a id="header1" class="nav-link" href="<%=request.getContextPath()%>/index.jsp">AUTO <span><i class='fas fa-car-alt'></i></span> MARKET</a> 
    
    <div id='frame2' style="color:white; background:brown">&nbsp;&nbsp;&nbsp;Новое объявление</div>
    <div id='frame'>
        <form id="form1" action="<%=request.getContextPath()%>/post.do" method="post">
            <select id="select1" name="mark" type="text" class="form-control"  onchange='return model();'>
                <option selected disabled hidden>выберите марку</option>
            </select>
            <select id="select2"  name="modelCar" type="text" class="form-control" onchange='checkTegs();'>
                <option>выберите модель</option>
            </select>
            <select id="select3"  name="body" type="text" class="form-control" onchange='checkTegs();'>
                <option selected disabled hidden>выберите тип кузова</option>
                <option>седан</option>
                <option>хетчбэк</option>
                <option>универсал</option>
                <option >внедорожник</option>
            </select>
            <input id="select4" name="year" placeholder="введите год выпуска" type="text" class="form-control" onchange='checkTegs();'> 
            </input>
            <input id="select5" name="price" placeholder="введите стоимость, руб." type="text" class="form-control" onchange='checkTegs();'>
            </input>
            <input id="select6" name="mileage" placeholder="введите пробег, км" type="text" class="form-control" onchange='checkTegs();'>
                
            </input>
            <button type="submit" disabled id="bt1" onclick="return block();">добавить объявление <i class='fas fa-car-side'></i></button>
        </form>
    </div>
   
          
    <a id="ref1" class="nav-link" href="<%=request.getContextPath()%>/post.do">Перейти в раздел МОИ ОБЪЯВЛЕНИЯ</a>        
   
      
    
</body>
</html>