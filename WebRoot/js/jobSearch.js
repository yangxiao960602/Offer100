var cityName;
var industryName;
var salary;
var year;
var eduction;

window.onload = function(){
	 		var ProvinceUl = document.getElementById("ProvinceUl");
	 		var provinceLis = ProvinceUl.getElementsByTagName("li");
            var IndustryUl = document.getElementById("IndustryUl");
            var IndustryLis = IndustryUl.getElementsByTagName("li");
	 		var citys = document.getElementById("DivCity");
	 		var cityDivs = citys.getElementsByTagName("div");
            var industries = document.getElementById("DivCategories");
            var categoryDivs = industries.getElementsByTagName("div");

            var DivCities = document.getElementById("DivCity");
            var cityLis = DivCities.getElementsByTagName("li");

            var DivCategories = document.getElementById("DivCategories");
            var categoryLis = DivCategories.getElementsByTagName("li");

            var salaryDiv = document.getElementById("salary");
            var salaryLis = salaryDiv.getElementsByTagName("li");

            var yearDiv = document.getElementById("year");
            var yearLis = yearDiv.getElementsByTagName("li");

            var educationDiv = document.getElementById("education");
            var educationLis = educationDiv.getElementsByTagName("li");



	 		for(var i= 0,len = provinceLis.length;i<len;i++){
                provinceLis[i].index = i;
                provinceLis[i].onclick = function(){
                    for(var n=0;n<len;n++){
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
                            cityName = cityLis[this.index].innerHTML;
                        }
                    }
                }
            };

            for(var j= 0,jlen = IndustryLis.length;j<jlen;j++){
                IndustryLis[j].index = j;
                IndustryLis[j].onclick = function(){
                    for(var m= 0;m<jlen;m++){
                        if(m != this.index)
                        {
                            categoryDivs[m].className="cityHide";
                            IndustryLis[m].className = "";
                        }
                        else
                        {
                            this.className = "selected1";
                            categoryDivs[this.index].className="";
                        }
                    }   
                }
            };

            for(var p=0, plen=categoryLis.length;p<plen;p++){
                categoryLis[p].index = p;
                categoryLis[p].onclick = function(){
                    for(var q=0; q<plen; q++){
                        if(q != this.index)
                        {
                            categoryLis[q].className = "";
                        }
                        else
                        {
                            this.className = "selected1";
                            industryName = categoryLis[this.index].innerHTML;
                        }
                    }
                }
            };

            for(var p=0, plen=salaryLis.length;p<plen;p++){
                salaryLis[p].index = p;
                salaryLis[p].onclick = function(){
                    for(var q=0; q<plen; q++){
                        if(q != this.index)
                        {
                            salaryLis[q].className = "";
                        }
                        else
                        {
                            this.className = "selected2";
                            salary = salaryLis[this.index].innerHTML;
                        }
                    }
                }
            };


            for(var p=0, plen=yearLis.length;p<plen;p++){
                yearLis[p].index = p;
                yearLis[p].onclick = function(){
                    for(var q=0; q<plen; q++){
                        if(q != this.index)
                        {
                            yearLis[q].className = "";
                        }
                        else
                        {
                            this.className = "selected2";
                            year = yearLis[this.index].innerHTML;
                        }
                    }
                }
            };


            for(var p=0, plen=educationLis.length;p<plen;p++){
                educationLis[p].index = p;
                educationLis[p].onclick = function(){
                    for(var q=0; q<plen; q++){
                        if(q != this.index)
                        {
                            educationLis[q].className = "";
                        }
                        else
                        {
                            this.className = "selected2";
                            education = educationLis[this.index].innerHTML;
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

function displayIndustry(){
    var DivCity1 = document.getElementById("DivCity1");
    var DivCategory2 = document.getElementById("DivCategory");
    DivCity1.style.display = "block";
    DivCategory2.style.display = "block";
}

function closeIndustry(){
    var DivCity1 = document.getElementById("DivCity1");
    var DivCategory2 = document.getElementById("DivCategory");
    DivCity1.style.display = "none";
    DivCategory2.style.display = "none";
}

function chooseCity(){
    var cityBt = document.getElementById("jobinfo_place");
    cityBt.value = cityName;
    closeCity();
}

function chooseIndustry(){
    var industryBt = document.getElementById("jobinfo_category");
    industryBt.value = industryName;
    closeIndustry();
}
