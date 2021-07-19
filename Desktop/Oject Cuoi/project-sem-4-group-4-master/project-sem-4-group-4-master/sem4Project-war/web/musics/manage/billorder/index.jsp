<%-- 
    Document   : index
    Created on : Jul 11, 2021, 12:46:49 AM
    Author     : hmtua
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../../admin/header.jsp"%>
<html>
    <head>
        <script>
            function openCity(cityName) {
                var i;
                var x = document.getElementsByClassName("city");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                document.getElementById(cityName).style.display = "block";

            }
        </script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['bar']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable(${order});

                var options = {
//                    chart: {
//                        title: 'Order Performance',
//                        subtitle: 'Sales of orders in the month',
//                    }
                };

                var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
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
        </style>
    </head>
    <body >
        <br/>
        <div class="w3-container">
            <div class="w3-row">
                <div class="w3-col container" style="width:50%">
                    <h2 class="">
                        <img height="40px" src="https://img.icons8.com/fluent/48/000000/purchase-order.png"/>
                        <b>Manage Order</b>
                        &nbsp;
                        <a style="font-size: 15px;color: #008CBA" href="${pageContext.request.contextPath}/ManageBillOrder?date=details">See Details</a>
                    </h2>
                </div>
                <div class="w3-col container" style="width:50%">
                    <div style="text-align: right">
                        <% LocalDate d1 = java.time.LocalDate.now();%>
                        <input value="<% out.print(d1);%>" id="date" type="date" required="required">
                    </div>
                </div>
            </div>
        </div>

        <div class="w3-container">
            <div class="w3-row">
                <div class="w3-col container" style="width:100%">
                    <div class="card form-group">
                        <div class="card-header">
                            <img height="25px" src="https://img.icons8.com/cotton/64/000000/statistics--v1.png"/>
                            <b>ORDER OVERVIEW</b>
                        </div>
                        <div class="card-body">
                            <div class="w3-container" id="columnchart_material" style="width: 100%; height:500px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@include file="../../../admin/footer.jsp"%>
