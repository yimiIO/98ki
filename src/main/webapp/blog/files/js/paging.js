var Page = ${page} ,MaxPage = ${maxPage};

function locat(){
        var url=window.location.search;   // 接收地址中传递的参数并产生响应
         if(url.indexOf("?")!=-1){
                var str = url.substr(1)
                strs = str.split("&"); 
                for(i=0;i<strs.length;i++){ 
                        if([strs[i].split("=")[0]]=='page') Page=unescape(strs[i].split("=")[1]);
                }
        }
}
function Pagehtml(){// 分页代码
        var PageStr = "",jj = "";
    Page = parseInt(Page);
        var xPage = Page - 2,dPage = Page + 2
        if(xPage < 1){
                xPage = 1
                dPage = 5
        }
        if(dPage > MaxPage){
                dPage = MaxPage
                xPage = (dPage - 4)
        }
        if(xPage < 1){
                xPage = 1
        }
        if (Page == 1){
                PageStr += "<a class='page_turn'>上一页</a>"
        }else{
                PageStr += "<a class='page_turn' href='page"+ (Page - 1) +"'>上一页</a>"
        }
        if(xPage > 1){
                PageStr += "<a href='/'>1</a>"
        }
        if(xPage > 2){
                PageStr += " ..."
        }
        for(var j = xPage;j <= dPage;j++) {
                PageStr += (Page == j) ? " <a class=\"on\">" + j + "</a>" : " <a href='page"+ j +".html'>" + j + "</a>";
    }
        if(dPage < MaxPage - 1){
                PageStr += " ..."
        }
        if(dPage < MaxPage){
                PageStr += " <a href='?page"+ MaxPage +".html'>" + MaxPage + "</a>"
        }
        if (Page == MaxPage){
                PageStr += "<a class='page_turn'>下一页</a>"
        }else{
                PageStr += "<a class='page_turn' href='page"+ (Page + 1) +".html'>下一页</a>"
        }
        PageStr += ' 跳转到：<input id="page_text" type="text" name="page_text"><a id="page_btn" class="page_turn" href="javascript:;">GO</a>'
        return PageStr
}


locat();

if(MaxPage != "" && MaxPage > 1){
        document.getElementById("page").innerHTML = Pagehtml()
        document.getElementById("page_btn").onclick = function(){
                var _page = document.getElementById("page_text").value
                var r = /^[0-9]*[1-9][0-9]*$/;// 正整数
                if(_page != "" && r.test(_page) ){
                        if (MaxPage < _page){
                                _page = MaxPage
                        }
                        this.href = "page" + _page +".html"
                }
        }
        document.getElementById("page_text").onkeyup = function(event) {
                if (event == "undefined") {
                        event = window.event;
                }
                if (event.keyCode == 13) {
                        document.getElementById("page_btn").click();
                        return false;
                }
        }
}
