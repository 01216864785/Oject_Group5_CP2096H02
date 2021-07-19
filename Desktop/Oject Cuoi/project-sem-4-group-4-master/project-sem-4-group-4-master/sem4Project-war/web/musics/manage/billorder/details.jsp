<%-- 
    Document   : listAll
    Created on : Jul 11, 2021, 12:22:25 PM
    Author     : hmtua
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../../admin/header.jsp"%>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function openCity(evt, cityName) {
                var i, x, tablinks;
                x = document.getElementsByClassName("city");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablink");
                for (i = 0; i < x.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " w3-red";
            }
        </script>
        <script>
            $(document).ready(function () {
                $("#myInput1").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable1 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
            $(document).ready(function () {
                $("#myInput2").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable2 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
            $(document).ready(function () {
                $("#myInput3").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable3 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
            $(document).ready(function () {
                $("#myInput4").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable4 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
        <style>
            /* Removes the clear button from date inputs */
            input[type="date"]::-webkit-clear-button {
                display: none;
            }

            /* Removes the spin button */
            input[type="date"]::-webkit-inner-spin-button { 
                display: none;
            }

            /* Always display the drop down caret */
            input[type="date"]::-webkit-calendar-picker-indicator {
                color: #2c3e50;
            }

            /* A few custom styles for date inputs */
            input[type="date"] {
                appearance: none;
                -webkit-appearance: none;
                color: #95a5a6;
                font-family: "Helvetica", arial, sans-serif;
                font-size: 18px;
                background-color: #fff;
                padding:5px;
                display: inline-block !important;
                visibility: visible !important;
                border: 1px solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }

            input[type="date"], focus {
                color: #95a5a6;
                box-shadow: none;
                -webkit-box-shadow: none;
                -moz-box-shadow: none;
            }
            .w3-container{
                padding:10px
            }
            .form-group {
                margin-bottom: 1rem;
            }
            .card {
                position: relative;
                display: -webkit-box;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }
            .card-header {
                padding: .75rem 1.25rem;
                margin-bottom: 0;
                background-color: rgba(0,0,0,.03);
                border-bottom: 1px solid rgba(0,0,0,.125);
            }
            .card-body {
                -webkit-box-flex: 1;
                flex: 1 1 auto;
                padding: 1.25rem;
            }
            .w3-col{
                padding:2px;
            }
            div[name="Dashboard"]{
                background-color:#ffffff;
                width:98%;
                border-radius:2px;
                border:1;
                box-shadow: 0px 0px 1px;
                padding:5px;
            }
            .dashboardNoiDung{
                text-align: right!important;
            }
            .google-visualization-table-tr-head{

                text-align: left;
            }
            .google-visualization-table-tr-even{
                text-align: left;
            }
            #table{
                width:100%;
                height:640px;
                overflow: hidden;
            }
            #table:hover{
                width:100%;
                height:640px;
                overflow-y:scroll; 
            }
            ::-webkit-scrollbar {
                width: 5px;
            }
            ::-webkit-scrollbar-track {
                background: #f1f1f1; 
            }
            ::-webkit-scrollbar-thumb {
                background: #888;
                border-radius:10px;
            }
            ::-webkit-scrollbar-thumb:hover {
                background: #555; 
            }
              .w3-modal-content{
                border: 1px solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }
        </style>
    </head>
    <body>
        <div class="w3-container">
            <div class="w3-row">
                <div class="w3-col container" style="width:50%">
                    <h2 class="">
                        <img height="40px" src="https://img.icons8.com/fluent/48/000000/details-popup.png"/>
                        <b>Details Revenue</b>
                    </h2>
                </div>
                <div class="w3-col container" style="width:50%">
                    <div style="text-align: right">
                        <% LocalDate d1 = java.time.LocalDate.now();%>
                        <input value="<% out.print(d1);%>" id="date" type="date" required="required">
                    </div>
                </div>
            </div>
            <div class="card form-group">
                <div class="card-body">
                    <div class="w3-bar  ">
                        <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event, 'London')"> Total</button>
                        <button class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Paris')">Orders Paid </button>
                        <button class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Chua')">Orders Unpaid</button>
                        <button class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Huy')">Order Canceled</button>
                        <br/><hr style="background-color: red;height:1px"/>              
                    </div>
                    <div id="London" class=" city">
                        <div class="w3-row">
                            <div class="w3-col container" style="width:35%">
                                <input style=" border-radius:2px;" class="w3-input w3-border w3-padding" type="text" placeholder="Search..." id="myInput1" onkeyup="myFunction()">
                            </div>
                        </div>
                        <br/>
                        <div id="table">
                            <table class="w3-table-all w3-hoverable"  style=" border-radius:2px;">            
                                <thead >
                                    <tr class="w3-light-grey">
                                        <th></th>  
                                        <th>Song Name</th>
                                        <th>Customer Name</th>
                                        <th>Date Order</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                    </tr>
                                </thead >
                                <tbody id="myTable1">
                                    <%
                                        int a = 0;
                                        List l = new ArrayList();
                                        l = (ArrayList) request.getAttribute("informationOrderDate");
                                        for (int idx = 0; idx < l.size(); idx++) {
                                            a++;
                                            String t = l.get(idx).toString();
                                            char[] ch = t.substring(1, t.indexOf("]")).toCharArray();
                                            String SongID, OrderID, SongName, CustomerName, DateOrder, PriceSong, StatusPay, StatusOrder, DatePay;
                                            String cat = t.substring(1, t.indexOf("]"));

                                            SongID = cat.substring(0, cat.indexOf("/"));
                                            String cat2 = cat.substring(cat.indexOf("/") + 1);

                                            OrderID = cat2.substring(0, cat2.indexOf("/"));
                                            String cat3 = cat2.substring(cat2.indexOf("/") + 1);

                                            SongName = cat3.substring(0, cat3.indexOf("/"));
                                            String cat4 = cat3.substring(cat3.indexOf("/") + 1);

                                            CustomerName = cat4.substring(0, cat4.indexOf("/"));
                                            String cat5 = cat4.substring(cat4.indexOf("/") + 1);

                                            DateOrder = cat5.substring(0, cat5.indexOf("/"));
                                            DateOrder = DateOrder.substring(0, DateOrder.indexOf("."));
                                            String cat6 = cat5.substring(cat5.indexOf("/") + 1);

                                            PriceSong = cat6.substring(0, cat6.indexOf("/"));
                                            String cat7 = cat6.substring(cat6.indexOf("/") + 1);

                                            StatusPay = cat7.substring(0, cat7.indexOf("/"));
                                            String cat8 = cat7.substring(cat7.indexOf("/") + 1);

                                            StatusOrder = cat8.substring(0, cat8.indexOf("/"));
                                            String cat9 = cat8.substring(cat8.indexOf("/") + 1);

                                            DatePay = cat9;

                                    %>
                                    <tr>
                                        <td><% out.print(a); %></td>
                                        <td>
                                            <% out.print(SongName); %><br/>
                                            <a  href="#<% out.print(OrderID);%>"  onclick="document.getElementById('<%out.print(OrderID);%>').style.display = 'block'" style="color: #008CBA;font-size: 13px;text-align:center">Details</a>          
                                        </td>
                                        <div id="<% out.print(OrderID);%>" class="w3-modal">
                                            <div class="w3-modal-content w3-animate-top w3-card-4">
                                                <header class="w3-container "> 
                                                    <center> <h2> <% out.print(SongName); %></h2></center>
                                                </header>
                                                <div class="w3-container">
                                                    <% out.print(OrderID);%>
                                                    <p>Some text..</p>
                                                </div>
                                                <footer class="w3-container">
                                                    <div style="text-align:right">
                                                        <span onclick="document.getElementById('<% out.print(OrderID);%>').style.display = 'none'">
                                                            <button type="button"   style="width: 60px; border: 1px solid; border-radius: .25rem;:">
                                                                Close
                                                            </button>
                                                        </span>                                                        
                                                    </div>
                                                </footer>
                                            </div>
                                        </div>
                                        <td><% out.print(CustomerName); %></td>
                                        <td><% out.print(DateOrder); %></td>
                                        <td><% out.print(PriceSong); %></td>
                                        <td>
                                            <%
                                                if (StatusOrder.equals("3")) {
                                            %>
                                            <img height="20px"  src="https://img.icons8.com/officexs/80/000000/cancel-subscription.png" title="Order has been cancelled"/>
                                            <%
                                            } else {
                                                if (!StatusPay.equals("null") && StatusPay.equals("1")) {

                                            %> 
                                            <img height="20px" src="https://img.icons8.com/color/48/000000/paid.png" title="Order has been successfully paid"/>
                                            <%} else { %>
                                            <img height="20px" src="https://img.icons8.com/cotton/64/000000/delete-sign--v2.png" title="Order unpaid"/>
                                            <%}
                                                }%>
                                        </td> 
                                    </tr>
                                    <%}
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="Paris" class="city" style="display:none">
                        <div class="w3-row">
                            <div class="w3-col container" style="width:35%">
                                <input style=" border-radius:2px;" class="w3-input w3-border w3-padding" type="text" placeholder="Search..." id="myInput2" onkeyup="myFunction()">
                            </div>
                        </div>
                        <br/>
                        <div id="table">
                            <table class="w3-table-all w3-hoverable"  style=" border-radius:2px;">            
                                <thead >
                                    <tr class="w3-light-grey">
                                        <th></th>
                                        <th>Song Name</th>
                                        <th>Customer Name</th>
                                        <th>Date Order</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th>Payment Time</th>
                                    </tr>
                                </thead >
                                <tbody id="myTable2">
                                    <%
                                        int b = 0;
                                        List l1 = new ArrayList();
                                        l1 = (ArrayList) request.getAttribute("informationOrderDate");
                                        for (int idx = 0; idx < l1.size(); idx++) {
                                            b++;
                                            String t = l.get(idx).toString();
                                            if (t.indexOf("null") == -1) {
                                                char[] ch = t.substring(1, t.indexOf("]")).toCharArray();
                                                String SongID, OrderID, SongName, CustomerName, DateOrder, PriceSong, StatusPay, StatusOrder, DatePay;
                                                String cat = t.substring(1, t.indexOf("]"));

                                                SongID = cat.substring(0, cat.indexOf("/"));
                                                String cat2 = cat.substring(cat.indexOf("/") + 1);

                                                OrderID = cat2.substring(0, cat2.indexOf("/"));
                                                String cat3 = cat2.substring(cat2.indexOf("/") + 1);

                                                SongName = cat3.substring(0, cat3.indexOf("/"));
                                                String cat4 = cat3.substring(cat3.indexOf("/") + 1);

                                                CustomerName = cat4.substring(0, cat4.indexOf("/"));
                                                String cat5 = cat4.substring(cat4.indexOf("/") + 1);

                                                DateOrder = cat5.substring(0, cat5.indexOf("/"));
                                                DateOrder = DateOrder.substring(0, DateOrder.indexOf("."));
                                                String cat6 = cat5.substring(cat5.indexOf("/") + 1);

                                                PriceSong = cat6.substring(0, cat6.indexOf("/"));
                                                String cat7 = cat6.substring(cat6.indexOf("/") + 1);

                                                StatusPay = cat7.substring(0, cat7.indexOf("/"));
                                                String cat8 = cat7.substring(cat7.indexOf("/") + 1);

                                                StatusOrder = cat8.substring(0, cat8.indexOf("/"));
                                                String cat9 = cat8.substring(cat8.indexOf("/") + 1);

                                                DatePay = cat9;


                                    %>
                                    <tr>
                                        <td><% out.print(b); %></td>
                                        <td>
                                            <% out.print(SongName); %><br/>
                                            <a  href="#<% out.print(SongID);%>"  onclick="document.getElementById('<%out.print(SongID);%>').style.display = 'block'" style="color: #008CBA;font-size: 13px;text-align:center">Details</a>          
                                        </td>
                                        <div id="<% out.print(SongID);%>" class="w3-modal">
                                            <div class="w3-modal-content w3-animate-top w3-card-4">
                                                <header class="w3-container "> 
                                                    <center> <h2> <% out.print(SongName); %></h2></center>
                                                </header>
                                                <div class="w3-container">
                                                    <% out.print(OrderID);%>
                                                    <p>Some text..</p>
                                                </div>
                                                <footer class="w3-container">
                                                    <div style="text-align:right">
                                                        <span onclick="document.getElementById('<% out.print(SongID);%>').style.display = 'none'">
                                                            <button type="button"   style="width: 60px; border: 1px solid; border-radius: .25rem;:">
                                                                Close
                                                            </button>
                                                        </span>                                                        
                                                    </div>
                                                </footer>
                                            </div>
                                        </div>
                                <td><% out.print(CustomerName); %></td>
                                <td><% out.print(DateOrder); %></td>
                                <td><% out.print(PriceSong); %></td>
                                <td>
                                    <%
                                        if (StatusOrder.equals("3")) {
                                    %>
                                    <img height="20px"  src="https://img.icons8.com/officexs/80/000000/cancel-subscription.png" title="Order has been cancelled"/>
                                    <%
                                    } else {
                                        if (!StatusPay.equals("null") && StatusPay.equals("1")) {

                                    %> 
                                    <img height="20px" src="https://img.icons8.com/color/48/000000/paid.png" title="Order has been successfully paid"/>
                                    <%} else { %>
                                    <img height="20px" src="https://img.icons8.com/cotton/64/000000/delete-sign--v2.png" title="Order unpaid"/>
                                    <%}
                                        }%>
                                </td> 
                                <td><% out.print(DateOrder); %></td>
                                </tr>
                                <%}
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="Chua" class=" city" style="display:none">
                        <div class="w3-row">
                            <div class="w3-col container" style="width:35%">
                                <input style=" border-radius:2px;" class="w3-input w3-border w3-padding" type="text" placeholder="Search..." id="myInput3" onkeyup="myFunction()">
                            </div>
                        </div>
                        <br/>
                        <div id="table">
                            <table class="w3-table-all w3-hoverable"  style=" border-radius:2px;">            
                                <thead >
                                    <tr class="w3-light-grey">
                                        <th></th>
                                        <th>Song Name</th>
                                        <th>Customer Name</th>
                                        <th>Date Order</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                    </tr>
                                </thead >
                                <tbody id="myTable3">
                                    <%
                                        int cd=0;
                                        List l2 = new ArrayList();
                                        l2 = (ArrayList) request.getAttribute("informationOrderDate");
                                        for (int idx = 0; idx < l2.size(); idx++) {
                                            cd ++;
                                            String t = l.get(idx).toString();
                                            if (t.indexOf("null") != -1 && t.indexOf("/3/") == -1) {
                                                char[] ch = t.substring(1, t.indexOf("]")).toCharArray();
                                                String SongID, OrderID, SongName, CustomerName, DateOrder, PriceSong, StatusPay, StatusOrder, DatePay;
                                                String cat = t.substring(1, t.indexOf("]"));

                                                SongID = cat.substring(0, cat.indexOf("/"));
                                                String cat2 = cat.substring(cat.indexOf("/") + 1);

                                                OrderID = cat2.substring(0, cat2.indexOf("/"));
                                                String cat3 = cat2.substring(cat2.indexOf("/") + 1);

                                                SongName = cat3.substring(0, cat3.indexOf("/"));
                                                String cat4 = cat3.substring(cat3.indexOf("/") + 1);

                                                CustomerName = cat4.substring(0, cat4.indexOf("/"));
                                                String cat5 = cat4.substring(cat4.indexOf("/") + 1);

                                                DateOrder = cat5.substring(0, cat5.indexOf("/"));
                                                DateOrder = DateOrder.substring(0, DateOrder.indexOf("."));
                                                String cat6 = cat5.substring(cat5.indexOf("/") + 1);

                                                PriceSong = cat6.substring(0, cat6.indexOf("/"));
                                                String cat7 = cat6.substring(cat6.indexOf("/") + 1);

                                                StatusPay = cat7.substring(0, cat7.indexOf("/"));
                                                String cat8 = cat7.substring(cat7.indexOf("/") + 1);

                                                StatusOrder = cat8.substring(0, cat8.indexOf("/"));
                                                String cat9 = cat8.substring(cat8.indexOf("/") + 1);

                                                DatePay = cat9;


                                    %>
                                    <tr>
                                        <td>
                                            <% out.print(cd); %>
                                        </td>
                                        <td>
                                            <% out.print(SongName); %><br/>
                                            <a  href="#<% out.print(SongID+OrderID);%>"  onclick="document.getElementById('<%out.print(SongID+OrderID);%>').style.display = 'block'" style="color: #008CBA;font-size: 13px;text-align:center">Details</a>          
                                        </td>
                                        <div id="<% out.print(SongID+OrderID);%>" class="w3-modal">
                                            <div class="w3-modal-content w3-animate-top w3-card-4">
                                                <header class="w3-container "> 
                                                    <center> <h2> <% out.print(SongName); %></h2></center>
                                                </header>
                                                <div class="w3-container">
                                                    <% out.print(OrderID);%>
                                                    <p>Some text..</p>
                                                </div>
                                                <footer class="w3-container">
                                                    <div style="text-align:right">
                                                        <span onclick="document.getElementById('<% out.print(SongID+OrderID);%>').style.display = 'none'">
                                                            <button type="button"   style="width: 60px; border: 1px solid; border-radius: .25rem;:">
                                                                Close
                                                            </button>
                                                        </span>                                                        
                                                    </div>
                                                </footer>
                                            </div>
                                        </div>
                                        <td><% out.print(CustomerName); %></td>
                                        <td><% out.print(DateOrder); %></td>
                                        <td><% out.print(PriceSong); %></td>
                                        <td>
                                            <%
                                                if (StatusOrder.equals("3")) {
                                            %>
                                            <img height="20px"  src="https://img.icons8.com/officexs/80/000000/cancel-subscription.png" title="Order has been cancelled"/>
                                            <%
                                            } else {
                                                if (!StatusPay.equals("null") && StatusPay.equals("1")) {

                                            %> 
                                            <img height="20px" src="https://img.icons8.com/color/48/000000/paid.png" title="Order has been successfully paid"/>
                                            <%} else { %>
                                            <img height="20px" src="https://img.icons8.com/cotton/64/000000/delete-sign--v2.png" title="Order unpaid"/>
                                            <%}
                                                }%>
                                        </td> 
                                    </tr>
                                    <%}
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="Huy" class=" city" style="display:none">
                        <div class="w3-row">
                            <div class="w3-col container" style="width:35%">
                                <input style=" border-radius:2px;" class="w3-input w3-border w3-padding" type="text" placeholder="Search..." id="myInput4" onkeyup="myFunction()">
                            </div>
                        </div>
                        <br/>
                        <div id="table">
                            <table class="w3-table-all w3-hoverable"  style=" border-radius:2px;">            
                                <thead >
                                    <tr class="w3-light-grey">
                                        <th></th>
                                        <th>Song Name</th>
                                        <th>Customer Name</th>
                                        <th>Date Order</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                    </tr>
                                </thead >
                                <tbody id="myTable4">
                                    <%
                                        int ads=0;
                                        List l3 = new ArrayList();
                                        l3 = (ArrayList) request.getAttribute("informationOrderDate");
                                        for (int idx = 0; idx < l3.size(); idx++) {
                                            ads++;
                                            String t = l.get(idx).toString();
                                            if (t.indexOf("/3/") != -1) {
                                                char[] ch = t.substring(1, t.indexOf("]")).toCharArray();
                                                String SongID, OrderID, SongName, CustomerName, DateOrder, PriceSong, StatusPay, StatusOrder, DatePay;
                                                String cat = t.substring(1, t.indexOf("]"));

                                                SongID = cat.substring(0, cat.indexOf("/"));
                                                String cat2 = cat.substring(cat.indexOf("/") + 1);

                                                OrderID = cat2.substring(0, cat2.indexOf("/"));
                                                String cat3 = cat2.substring(cat2.indexOf("/") + 1);

                                                SongName = cat3.substring(0, cat3.indexOf("/"));
                                                String cat4 = cat3.substring(cat3.indexOf("/") + 1);

                                                CustomerName = cat4.substring(0, cat4.indexOf("/"));
                                                String cat5 = cat4.substring(cat4.indexOf("/") + 1);

                                                DateOrder = cat5.substring(0, cat5.indexOf("/"));
                                                DateOrder = DateOrder.substring(0, DateOrder.indexOf("."));
                                                String cat6 = cat5.substring(cat5.indexOf("/") + 1);

                                                PriceSong = cat6.substring(0, cat6.indexOf("/"));
                                                String cat7 = cat6.substring(cat6.indexOf("/") + 1);

                                                StatusPay = cat7.substring(0, cat7.indexOf("/"));
                                                String cat8 = cat7.substring(cat7.indexOf("/") + 1);

                                                StatusOrder = cat8.substring(0, cat8.indexOf("/"));
                                                String cat9 = cat8.substring(cat8.indexOf("/") + 1);

                                                DatePay = cat9;

                                                if (StatusOrder.equals("3")) {
                                    %>
                                    <tr>
                                        <td><% out.print(ads); %> </td>
                                        <td>
                                            <% out.print(SongName); %><br/>
                                            <a  href="#<% out.print(OrderID+SongID);%>"  onclick="document.getElementById('<%out.print(OrderID+SongID);%>').style.display = 'block'" style="color: #008CBA;font-size: 13px;text-align:center">Details</a>          
                                        </td>
                                        <div id="<% out.print(OrderID+SongID);%>" class="w3-modal">
                                            <div class="w3-modal-content w3-animate-top w3-card-4">
                                                <header class="w3-container "> 
                                                    <center> <h2> <% out.print(SongName); %></h2></center>
                                                </header>
                                                <div class="w3-container">
                                                    <% out.print(OrderID);%>
                                                    <p>Some text..</p>
                                                </div>
                                                <footer class="w3-container">
                                                    <div style="text-align:right">
                                                        <span onclick="document.getElementById('<% out.print(OrderID+SongID);%>').style.display = 'none'">
                                                            <button type="button"   style="width: 60px; border: 1px solid; border-radius: .25rem;:">
                                                                Close
                                                            </button>
                                                        </span>                                                        
                                                    </div>
                                                </footer>
                                            </div>
                                        </div>
                                        <td><% out.print(CustomerName); %></td>
                                        <td><% out.print(DateOrder); %></td>
                                        <td><% out.print(PriceSong); %></td>
                                        <td>
                                            <%
                                                if (StatusOrder.equals("3")) {
                                            %>
                                            <img height="20px"  src="https://img.icons8.com/officexs/80/000000/cancel-subscription.png" title="Order has been cancelled"/>
                                            <%
                                                }%>
                                        </td> 
                                    </tr>
                                    <%}
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@include file="../../../admin/footer.jsp"%>