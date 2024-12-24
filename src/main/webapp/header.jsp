<div class="header">
    <div class="logo">
        <img src="resources/img/miraecinema.png" height="25px">
    </div>
    <div class="nav">
        <div>
            <a href="index.do">Home</a>
        </div>
        <div>
        	<%
       		String id = (String) session.getAttribute("userName");
       		if(id == null || id == "") {
       		%>
            <a href="login.do">Mypage</a>
       		<%
       		}else{
        	%>
       		<a href="tickets.do">Mypage</a>
            <%
            }
            %>
        </div>
        <div>
        	<%
       		if(id == null || id == "") {
       		%>
            <a href="login.do">Login</a>            
       		<%
       		}else{
        	%>
       		<a href="logout.do">Logout</a>
            <%
            }
            %>
        </div>
    </div>
</div>
