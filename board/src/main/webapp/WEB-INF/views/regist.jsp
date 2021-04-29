<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<title>KHU's Board</title>




</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">REGIST FORM</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action = "registUser">
                            <fieldset>
                                <div class="form-group">
                                	<label class="control-label" >이메일을 입력하세요</label>
                                    <input class="form-control" placeholder="E-mail"  name="email" type="email" autofocus >
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Name" name="name" type="text" value="">
                                </div>
                                
                                <div class="form-group">
                                	
                                    <input class="form-control" placeholder="Tel" name="tel" type="text" value=""> 
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <input  type="submit" id ="submit"   style= "pointer-events: none;"class="btn btn-lg btn-default btn-block" value = "입력하세요"/>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@ include file="/WEB-INF/include/include-scripts.jspf"%>

<script type="text/javascript">
$(document).ready(function(){
	$("input[name='email']").bind("keyup",function(){
	    $.ajax({
	        url : "checkEmail",
	        type: "get",
	        data : { "EMAIL" : $("input[name='email']").val() },
	        success : function(responseData){
	        	
	            $("#ajax").remove();
	            
	            if(responseData.EMAIL.length < 4 || responseData.NAME != null){
	            	$(".control-label").html("사용불가능한 이메일입니다.");
	            	$("input[name='email']").parent().attr('class','form-group has-error');
	            	$("#submit").attr('class','btn btn-lg btn-danger btn-block');
	            	$("#submit").attr("value","ERROR");
		            $("#submit").css("pointer-events","none");
	            	return false;
	            }else{
		            $(".control-label").html("사용가능한 이메일입니다.");
		            $("input[name='email']").parent().attr('class','form-group has-success');
		            $("#submit").attr('class','btn btn-lg btn-success btn-block');
		            $("#submit").attr("value","가입");
		            $("#submit").css("pointer-events","visible");
	            }

	        },
	        error : function(request,status,error){
	        	alert("code:"+request.status+"\n"+"error:"+error);
	        	$("input[name='email']").parent().attr('class','form-group has-error');
	        	$("#submit").attr('class','btn btn-lg btn-danger btn-block');
	            $("#submit").attr("value","ERROR");
	            $("#submit").css("pointer-events","none");

	        }
	        
	    });
		
	});
	
});



</script>


</body>

</html>