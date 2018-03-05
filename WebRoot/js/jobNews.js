window.onload = function(){
	    var wrap=document.getElementById("wrap");
      var pic=document.getElementById("pic");
      var list=document.getElementById("list").getElementsByTagName("li");
      var index=0;
      var timer=null;

      function auto(){
        timer=setInterval(function(){
          index++;
          if(index>=list.length){
            index=0;
          }
          change(index);
        },2000);  
      }
      auto();

      function change(curIndex){
        pic.style.marginTop=-260*curIndex+'px';
        for(var n=0;n<list.length;n++){
            list[n].className='';
        }
          list[curIndex].className='on';
          index=curIndex;
       }

       wrap.onmouseover=function(){
          clearInterval(timer);
       }

       wrap.onmouseout=auto();

       for(var i=0;i<list.length;i++){
          list[i].id=i;
          list[i].onmouseover=function(){
            change(this.id);          
          }
        }
}
