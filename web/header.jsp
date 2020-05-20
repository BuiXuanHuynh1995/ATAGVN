<%@ page import="service.CategoryServiceImp" %>
<%@ page import="model.Category" %>
<%@ page import="service.ProductServiceImp" %>
<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ATAG.VN</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="boostrap/css/bootstrap.css">
    <link rel="stylesheet" href="boostrap/css/mainStyle.css">
</head>
<body>

<%
    CategoryServiceImp categoryServiceImp = new CategoryServiceImp();
%>
<header class="header-section">
    <div class="container-fluid">
        <div class="inner-header">
            <div class="logo">
                <a href="index.jsp"><img src="img/logo.png" alt="logo"></a>
            </div>
            <div class="header-right">
                <i class="fa fa-search"></i>
                <i class="fa fa-user">
                    <c:set var = "checkLogin" scope = "session" value = "${isLogin}"/>
                    <c:choose>
                        <c:when test = "${checkLogin == 1}">
                            ${loginName}
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </i>
                <a href="#">
                    <i class="fa fa-shopping-bag"></i>
                    <span>2</span>
                </a>
            </div>
            <div class="user-access">
                <a href="/signUp.jsp">Register</a>
                <a href="<c:set var = "checkLogin" scope = "session" value = "${isLogin}"/>
                    <c:choose>
                        <c:when test = "${checkLogin == 1}">
                            /index.jsp
                            <c:set var = "checkLogin" scope = "session" value = "0"/>
                        </c:when>
                        <c:otherwise>
                            /login.jsp
                        </c:otherwise>
                    </c:choose>" class="in">
                    <c:set var = "checkLogin" scope = "session" value = "${isLogin}"/>
                    <c:choose>
                        <c:when test = "${checkLogin == 1}">
                            Sign Out
                        </c:when>
                        <c:otherwise>
                            Sign In
                        </c:otherwise>
                    </c:choose>
                </a>
            </div>
            <nav class="main-menu mobile-menu">
                <ul>
                    <li><a class="active" href="index.jsp">Home</a></li>
                    <li><a href="">Category</a>
                        <ul class="sub-menu">
                            <%
                                for (Category category: categoryServiceImp.getListCategory()){
                            %>
                            <li><a href="showAllProduct.jsp?CategoryID=<%=category.getCategoryId()%>"><%=category.getCategoryName()%></a></li>
                            <%
                                }
                            %>
                        </ul>
                    </li>
                    <li><a href="">Blog</a>
                        <ul class="sub-menu">
                            <li><a href="">ATAG.VN Story</a></li>
                            <li><a href="">How to become a perfect Online Market ?</a></li>
                        </ul>
                    </li>
                    <li><a href="">Contact</a>
                        <ul class="sub-menu">
                            <li><a href="">Phone : (024).0000-0000</a></li>
                            <li><a href="">Email : cskh@atag.vn</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
</body>
</html>
