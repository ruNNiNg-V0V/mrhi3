<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="header">
    <div class="logo">
        <img src="resources/img/miraecinema.png" height="25px">
    </div>
    <div class="nav">
        <div>
            <a href="index.do">Home</a>
        </div>
        <div>
            <c:if test="${not empty sessionScope.id}">
                <a href="mypage.do">Mypage</a>
            </c:if>
            <c:if test="${empty sessionScope.id}">
                <a href="login.do">Mypage</a>
            </c:if>
        </div>
        <div>
            <c:if test="${not empty sessionScope.id}">
                <a href="logout.do">Logout</a>
            </c:if>
            <c:if test="${empty sessionScope.id}">
                <a href="login.do">Login</a>
            </c:if>
        </div>
    </div>
</div>
