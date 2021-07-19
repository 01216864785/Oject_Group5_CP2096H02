<%-- 
    Document   : index
    Created on : Jun 18, 2021, 2:09:08 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<div class="main-header">
    <div class="mobile-toggle" id="mobile-toggle">
        <i class='bx bx-menu-alt-right'></i>
    </div>
    <div class="main-title">
        thống kê
    </div>
</div>
<div class="main-content">
    <div class="row">
        <div class="col-3 col-md-6 col-sm-12">
            <a href="/app/?m=phongtro&a=list" style="display:block;">
                <div class="box box-hover bg-purple">
                    <!-- COUNTER -->
                    <div class="counter">
                        <div class="counter-title">
                            Order
                        </div>
                        <div class="counter-info">
                            <div class="counter-count">
                                0
                            </div>
                            <i class='bx bxs-home'></i>
                        </div>
                    </div>
                    <!-- END COUNTER -->
                </div>
            </a>
        </div>
        <div class="col-3 col-md-6 col-sm-12">
            <a href="app/?m=phongtro&a=list&type=1" style="display:block;">
                <div class="box box-hover bg-red">
                    <!-- COUNTER -->
                    <div class="counter">
                        <div class="counter-title">
                            Song
                        </div>
                        <div class="counter-info">
                            <div class="counter-count">
                                0
                            </div>
                            <i class='bx bx-directions'></i>
                        </div>
                    </div>
                    <!-- END COUNTER -->
                </div>
            </a>
        </div>
        <div class="col-3 col-md-6 col-sm-12">
            <a href="app/?m=hoadon&a=all" style="display:block;">
                <div class="box box-hover bg-yellow">
                    <!-- COUNTER -->
                    <div class="counter">
                        <div class="counter-title">
                            News
                        </div>
                        <div class="counter-info">
                            <div class="counter-count">
                                0
                            </div>
                            <i class='bx bxs-detail'></i>
                        </div>
                    </div>
                    <!-- END COUNTER -->
                </div>
            </a>
        </div>
        <div class="col-3 col-md-6 col-sm-12">
            <div class="box box-hover bg-brown">
                <!-- COUNTER -->
                <div class="counter">
                    <div class="counter-title">
                        Category
                    </div>
                    <div class="counter-info">
                        <div class="counter-count">
                            0
                        </div>
                        <i class='bx bx-line-chart'></i>
                    </div>
                </div>
                <!-- END COUNTER -->
            </div>
        </div>
        <div class="col-3 col-md-6 col-sm-12">
            <div class="box box-hover bg-blue">
                <!-- COUNTER -->
                <div class="counter">
                    <div class="counter-title">
                        Account
                    </div>
                    <div class="counter-info">
                        <div class="counter-count">
                            0
                        </div>
                        <i class='bx bx-user'></i>
                    </div>
                </div>
                <!-- END COUNTER -->
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
