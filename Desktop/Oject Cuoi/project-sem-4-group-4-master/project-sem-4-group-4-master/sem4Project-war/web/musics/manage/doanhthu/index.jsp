
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="../../../admin/header.jsp"%>
<html>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <body>
        <div class="w3-container">
            <div class="w3-row">
                <div class="w3-col container" style="width:50%">
                    <h2 class="">
                        <img height="40px" src="https://img.icons8.com/fluent/48/000000/money-bag-lira.png"/> 
                        <b>Manage Revenue</b>
                       &nbsp;
                        <a style="font-size: 15px;color: #008CBA" href="${pageContext.request.contextPath}/ManageRevenue?date=listAll">See Details</a>
                    </h2>
                </div>
                <div class="w3-col container" style="width:50%">
                    <div style="text-align: right">
                         <% LocalDate d1 = java.time.LocalDate.now();%>
                        <input value="<% out.print(d1); %>" id="date" type="date" required="required">
                    </div>
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-col" name="Dashboard" style="width:33%">
                    <div class="w3-container">
                        <div class="w3-col" style="width:40%">
                            <img height="48px" src="https://img.icons8.com/fluent/48/000000/total-sales-1.png"/>
                        </div>
                        <div class="w3-col" style="width:60%">
                            <div class="dashboardNoiDung">
                                <p>Total revenue</p>
                                <b>${sumPriceAllInDate} $</b>
                            </div>
                        </div>  
                    </div>
                </div>

                <div class="w3-col"  style="width:0.5%"></div>
                <div class="w3-col" name="Dashboard" style="width:33%">
                    <div class="w3-container">
                        <div class="w3-col" style="width:40%">
                            <img  height="48px" src="https://img.icons8.com/cotton/64/000000/bill--v2.png"/>
                        </div>
                        <div class="w3-col" style="width:60%">
                            <div class="dashboardNoiDung">
                                <p>Total orders</p>
                                <b>${countOrder}</b>
                            </div>
                        </div>  
                    </div>
                </div>

                <div class="w3-col"  style="width:0.5%"></div>
                <div class="w3-col" name="Dashboard" style="width:33%">
                    <div class="w3-container">
                        <div class="w3-col" style="width:40%">
                            <img src="https://img.icons8.com/fluent/48/000000/paid-bill.png"/>
                        </div>
                        <div class="w3-col" style="width:60%">
                            <div class="dashboardNoiDung">
                                <p>Paid</p>
                                <b>${countOrderIS}</b>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="w3-row">
                <div class="w3-col" style="width:66.5%">
                    <div class="card form-group">
                        <div class="card-header">
                            <img height="25px" src="https://img.icons8.com/cotton/64/000000/statistics--v3.png"/>
                            <b>REVENUE STATISTICS</b>
                        </div>
                        <div class="card-body">
                            <canvas id="myChart" style="width:98%"></canvas>
                            <script >
                                var xValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                                    11, 12, 13, 14, 15, 16, 17, 18, 19, 11,
                                    21, 22, 23, 24, 25, 26, 27, 28, 29, 30
                                ];

                                new Chart("myChart", {
                                    type: "line",
                                    data: {
                                        labels: xValues,
                                        datasets: [{
                                                data: ${listPriceAll},
                                                borderColor: "red",
                                                fill: false
                                            }]
                                    },
                                    options: {
                                        legend: {display: false}
                                    }
                                });
                            </script> 
                        </div>
                    </div>
                </div>
                <div class="w3-col" style="width:0.5%"></div>
                <div class="w3-col" style="width:33%">
                    <div class="card form-group">
                        <div class="card-header">
                            <img height="25px" src="https://img.icons8.com/cotton/64/000000/statistics--v1.png"/>
                            <b>TOP 5 PRODUCTS</b>
                        </div>
                        <div class="card-body">
                            <div
                                id="myChart1" style="width:100%; height:428px;">
                            </div>
                            <script>
                                google.charts.load('current', {'packages': ['corechart']});
                                google.charts.setOnLoadCallback(drawChart);

                                function drawChart() {
                                    var data = google.visualization.arrayToDataTable([
                                        ['Contry', 'Mhl'],
                                ${sumTop10}
                                    ]);

                                    var options = {
                                        title: 'Top 5 Grossing Songs'
                                    };

                                    var chart = new google.visualization.PieChart(document.getElementById('myChart1'));
                                    chart.draw(data, options);
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>   
    </body>
</html>
<%@include file="../../../admin/footer.jsp"%>
