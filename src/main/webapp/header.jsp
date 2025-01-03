<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.miraecinema.biz.member.MemberVO"%>

<div class="header">
	<div class="logo">
		<img src="resources/img/miraecinema.png" height="25px">
	</div>
	<div class="nav">
		<div>
			<a href="index.do">Home</a>
		</div>
		<div>
			<a href="Information.jsp">Info</a>
		</div>
		<div>
			<%
        	MemberVO member = (MemberVO) session.getAttribute("member");
        	
        	String id="";
        	
        	if(member!=null){
        		id = member.getId();
        	}
        	
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
