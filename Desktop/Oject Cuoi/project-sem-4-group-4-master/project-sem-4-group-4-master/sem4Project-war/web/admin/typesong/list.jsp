<%-- 
    Document   : index
    Created on : Jun 18, 2021, 2:09:08 PM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<div class="main-header">
    <div class="mobile-toggle" id="mobile-toggle">
        <i class='bx bx-menu-alt-right'></i>
    </div>
    <div class="main-title">Category</div>
</div>
<div class="main-content">
     <div class="row">
        <div class="col-4">
            <a href="${pageContext.request.contextPath}/admin/typesong/create.jsp" class="btn btn-default light-text"><i class='bx bx-plus'></i> Create new</a>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="box">
                <div class="box-header">List</div>
                <div class="box-body overflow-scroll">
                    <table cellspacing="0">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Operation</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${list}">
                                <tr>
                                    <td>${item.typeID}</td>
                                    <td>${item.typeName}</td>
                                    <td>${item.description}</td>
                                    <td class="operations">
                                        <a href="${pageContext.request.contextPath}/admin-typesong?do=edit&id=${item.typeID}" class="btn-default bg-blue light-text"><i class='bx bx-pencil'></i> Edit</a>
                                        <form method="post" action="${pageContext.request.contextPath}/admin-typesong">
                                            <input type="hidden" name="typeID" value="${item.typeID}">
                                            <input type="submit" name="submit" value="del" class="btn-sm btn-default bg-red light-text">
                                        </form>
                                    </td>
                                </tr>
                             </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>