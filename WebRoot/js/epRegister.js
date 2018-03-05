var epRName;

window.onload = function(){
	var ProvinceUl = document.getElementById("ProvinceUl");
	var provinceLis = ProvinceUl.getElementsByTagName("li");
	var citys = document.getElementById("DivCity");
	var cityDivs = citys.getElementsByTagName("div");

    var DivCities = document.getElementById("DivCity");
    var cityLis = DivCities.getElementsByTagName("li");


	for(var i= 0,len = provinceLis.length;i<len;i++){
        provinceLis[i].index = i;
        provinceLis[i].onclick = function(){
            for(var n= 0;n<len;n++){
            	if(n != this.index)
            	{
                	cityDivs[n].className="cityHide";
                	provinceLis[n].className = "";
            	}
            	else
            	{
            		this.className = "selected1";
            		cityDivs[this.index].className="";
            	}
            }	
        }
    };

    for(var p=0, plen=cityLis.length;p<plen;p++){
        cityLis[p].index = p;
        cityLis[p].onclick = function(){
            for(var q=0; q<plen; q++){
                if(q != this.index)
                {
                    cityLis[q].className = "";
                }
                else
                {
                    this.className = "selected1";
                    epRName = cityLis[this.index].innerHTML;
                }
            }
        }
    };
}

function displayCity(){
    var DivCity1 = document.getElementById("DivCity1");
    var DivCity2 = document.getElementById("DivCity2");
    DivCity1.style.display = "block";
    DivCity2.style.display = "block";
}

function closeCity(){
    var DivCity1 = document.getElementById("DivCity1");
    var DivCity2 = document.getElementById("DivCity2");
    DivCity1.style.display = "none";
    DivCity2.style.display = "none";
}


function chooseCity(){
    var cityBt = document.getElementById("en_city");
    cityBt.value = epRName;
    closeCity();
}