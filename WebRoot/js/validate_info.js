function $(id) {  
       return document.getElementById(id);  
   }  
     
   function check() { 
       var name = $("name").value; 
       var tel = $("tel").value;  
       var email = $("email").value;  
      
       $("nameinfo").innerHTML = "";  
       $("telinfo").innerHTML = "";  
       $("emailinfo").innerHTML = "";  
       
       if(name == "") {  
           $("nameinfo").innerHTML = "姓名不能为空";  
            return false;  
        }  
          
        for(var i = 0; i < name.length; i++) {  
            var j = name.subString(i , i+1);  
            if(isNaN(j) == false) {  
                $("nameinfo").innerHTML = '姓名中不能包含数字';  
                return false;  
            }  
        }  
       if(email == "") {  
           $("emailinfo").innerHTML = "Email值不能为空";  
            return false;  
        }  
          
        if(email.indexOf("@") == -1 || email.indexOf(".") == -1) {  
            $("emailinfo").innerHTML = "邮箱格式不正确,必须包含@和.";  
            return false;  
        }  
             
    }   
      
   
   function checkName() {  //校验姓名  
       $('nameinfo').innerHTML = "";  
       var name = $('name').value;  
       if(name == "") {  
          $("nameinfo").innerHTML = "姓名不能为空";  
           return false;  
       }  
         
       for(var i = 0; i < name.length; i++) {  
           var j = name.subString(i , i+1);  
           if(isNaN(j) == false) {  
               $("nameinfo").innerHTML = '姓名中不能包含数字';  
               return false;  
           }  
       }  
   }
   
   
   function checkTel() {  //校验手机号  
       $('telinfo').innerHTML = "";  
       var tel = $('tel').value;  
       if(tel == "") {  
            $('telinfo').innerHTML = "值不能为空";  
            $("telinfo").innerHTML.style.fontsize="10px";
            return false;  
       }
       if(tel.length!=11) {  
           $("telinfo").innerHTML = "长度必须等于11";  
           return false;  
        } 
   }
   
   function checkEmail() {  //校验Email  
       $('emailinfo').innerHTML = "";  
       var email = $('email').value;  
       if(email == "") {  
            $('emailinfo').innerHTML = "值不能为空";  
            return false;  
       }  
         
       if(email.indexOf('@') == -1 || email.indexOf('.') == -1) {  
            $('emailinfo').innerHTML = "必须包含@和.";  
            return false;  
       }  
   } 