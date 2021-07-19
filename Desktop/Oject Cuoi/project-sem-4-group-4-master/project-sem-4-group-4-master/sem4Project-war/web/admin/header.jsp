<%-- 
    Document   : header
    Created on : Jun 18, 2021, 2:05:53 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="shortcut icon" href="/images/logo-mb.png" type="image/png">
        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <!-- BOXICONS -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <!-- APP CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/app.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/custom.css">
        <!-- SCRIPT -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>

    <body>

        <!-- SIDEBAR -->
        <div class="sidebar">
            <div class="sidebar-logo">
                <img src="https://cdn.iconscout.com/icon/free/png-256/home-803-450320.png" alt="">
                <div class="sidebar-close" id="sidebar-close">
                    <i class='bx bx-left-arrow-alt'></i>
                </div>
            </div>
            <div class="sidebar-user">
                <div class="sidebar-user-info">
                    <div class="sidebar-user-name">Admin</div>
                </div>
            </div>
            <!-- SIDEBAR MENU -->
            <ul class="sidebar-menu">
                <li>
                    <a href="" class="">
                        <i class='bx bxl-stack-overflow'></i>
                        <span>Dashbroad</span>
                    </a>
                </li>
                <!-- end li-->
                <li>
                    <a href="${pageContext.request.contextPath}/admin-typesong?do=list" class="sidebar-menu-dropdown">
                        <i class='bx bx-repeat'></i>
                        <span>Type of song</span>
                    </a>
                </li>
                <!-- end li-->

                <li>
                    <a href="${pageContext.request.contextPath}/ManageRevenue?date=hientai" class="sidebar-menu-dropdown"/>
                    <img height="30px" src="https://img.icons8.com/dotty/80/000000/economic-improvement.png"/> 
                    <span> &nbsp;Manage Revenue</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/ManageBillOrder?date=hientai" class="sidebar-menu-dropdown"/>
                    <img height="30px" src="https://img.icons8.com/ios/50/000000/create-order--v2.png"/> 
                    <span>  &nbsp;Manage Order</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class='bx bx-log-out bx-flip-horizontal'></i> 
                        <span>Thoát</span>
                    </a>
                </li>
                <!-- end li-->
            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
        <!-- END SIDEBAR -->
        <input type="hidden" id="url" name="url" value="<?php echo $homeurl;?>">
        <!-- MAIN CONTENT -->
        <div class="main">