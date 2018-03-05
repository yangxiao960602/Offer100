var cindustryName;
var cpublishTime;

window.onload = function(){
            var IndustryUl = document.getElementById("IndustryUl");
            var IndustryLis = IndustryUl.getElementsByTagName("li");

            var industries = document.getElementById("DivCategories");
            var categoryDivs = industries.getElementsByTagName("div");

            var DivCategories = document.getElementById("DivCategories");
            var categoryLis = DivCategories.getElementsByTagName("li");

            var publishTimeDiv = document.getElementById("publishTime");
            var publishTimeLis = publishTimeDiv.getElementsByTagName("li");


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
                            cindustryName = categoryLis[this.index].innerHTML;
                        }
                    }
                }
            };

            for(var p=0, plen=publishTimeLis.length;p<plen;p++){
                publishTimeLis[p].index = p;
                publishTimeLis[p].onclick = function(){
                    for(var q=0; q<plen; q++){
                        if(q != this.index)
                        {
                            publishTimeLis[q].className = "";
                        }
                        else
                        {
                            this.className = "selected2";
                            cpublishTime = publishTimeLis[this.index].innerHTML;
                        }
                    }
                }
            };
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

function chooseIndustry(){
    var industryBt = document.getElementById("jobinfo_category");
    industryBt.value = cindustryName;
    closeIndustry();
}
