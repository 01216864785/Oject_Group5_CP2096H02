<%-- 
    Document   : Order
    Created on : Jul 2, 2021, 3:17:03 AM
    Author     : hmtua
--%>

<%@page import="entities.Songs"%>
<%@page import="entities.Songs_"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
<style>
    .btn_print:hover{
        background-color: #ccc;
    }
    .btn_pay:hover{
        background-color: #ccc;
    }
</style>
<%
    Random rn = new Random();
    String merRef = "TEST_" + System.currentTimeMillis() + rn.nextInt();
    String ipClient = request.getRemoteAddr();
    String vpc_OrderInfo, vpc_Amount, vpc_Locale, vpc_TicketNo, vpc_SHIP_Street01, vpc_SHIP_Provice, vpc_SHIP_City,
            vpc_SHIP_Country, vpc_Customer_Phone, vpc_Customer_Email, vpc_Customer_Id, AVS_Street01, AVS_City, AVS_StateProv,
            AVS_PostCode, AVS_Country, MonnyVND, MonnyUSD;
    //tine thanh toan
    
    MonnyUSD = request.getAttribute("songPrice")!=null ?  request.getAttribute("songPrice").toString() :"12";
    String email = request.getAttribute("email")!=null? request.getAttribute("email").toString() :"hmtuana18122@cusc.ctu.edu.vn";
    double chuyenDoi = Integer.parseInt(MonnyUSD);
    chuyenDoi /= 0.000044;
    MonnyVND = String.valueOf(Math.round(chuyenDoi))+"00";
    //ma hoa don
    vpc_OrderInfo = "Code Bill: "+request.getAttribute("id")+"/"+email;
    //so tien can thanh toan (da nhan vs 100)
    vpc_Amount = MonnyVND;
    //Ngon ngu hien thi tren cong
    vpc_Locale = "en";
    //ip khách hàng
    vpc_TicketNo = ipClient;
    //Dia chi gui hang 
    vpc_SHIP_Street01 = " hdg dkdd d";
    //Quan huyen 
    vpc_SHIP_Provice = "ninh kieu";
    //tinh thanh pho 
    vpc_SHIP_City = "Cantho ";
    //quoc gia
    vpc_SHIP_Country = "Vn";
    //phone
    vpc_Customer_Phone = "0796864785";
    //emial
    vpc_Customer_Email = "hmdk@gmail.com";
    //id khach hang tren wed 
    vpc_Customer_Id = "sssa222";
    //dia chi ngan hang phat hanh    
%>
<script>
    $(".an").hide();
</script>
<style>
    .an{
        display:none;
    }
</style>
<div class="home">
    <div>
        <form action="musics/do.jsp" method="post">
            <div class="an">
                <div class="cauhinh">
                    <input type="text" name="virtualPaymentClientURL" size="63"value="https://mtf.onepay.vn/vpcpay/vpcpay.op" maxlength="250"> 
                    <input type="text" name="vpc_ReturnURL" size="50"value="http://localhost:43868/sem4Project-war/Retunr"maxlength="250"/>
                    <input type="text" name="vpc_Merchant" value="TESTONEPAY" size="30"maxlength="16"/>
                    <input type="text" name="vpc_AccessCode" value="6BEB2546"size="30" maxlength="8"/>
                    <input type="hidden" name="Title" value="PHP VPC 3-Party">    
                    <input type="text" name="vpc_Version" value="2" size="30"maxlength="8"/>
                    <input type="text" name="vpc_Command" value="pay" size="30"maxlength="16"/>
                    <input type="text" name="vpc_Locale" value="en" size="30"maxlength="5"/>
                    <input type="text" name="display" maxlength="5" value=""/>
                </div>   
                <input type="text" name="vpc_MerchTxnRef"value="<% out.println(merRef);%>" size="30" maxlength="40"/>
                <input type="text" name="vpc_OrderInfo" value="<% out.println(vpc_OrderInfo);%>"size="30" maxlength="34"/>
                <input type="text" name="vpc_Amount" value="<% out.println(vpc_Amount);%>" size="30"maxlength="30"/> 
                <input type="text" name="vpc_TicketNo" maxlength="15"value="<% out.println(vpc_TicketNo);%>"/>
                <input type="text" name="vpc_SHIP_Street01" value="<% out.println(vpc_SHIP_Street01);%>" size="30"maxlength="500"/>
                <input type="text" name="vpc_SHIP_Provice" value="<% out.println(vpc_SHIP_Provice);%>"size="30" maxlength="50"/>
                <input type="text" name="vpc_SHIP_City"value="<% out.println(vpc_SHIP_City);%>" size="30"maxlength="50"/>
                <input type="text" name="vpc_SHIP_Country" value="<% out.println(vpc_SHIP_Country);%>"size="30" maxlength="50"/>
                <input type="text" name="vpc_Customer_Phone" value="<% out.println(vpc_Customer_Phone);%>" size="30"maxlength="50"/>
                <input type="text" name="vpc_Customer_Email" size="30"value="<% out.println(vpc_Customer_Email);%>"maxlength="50"/>
            </div>
    </div>
    <div class="thongTinOrder">
        <div class="w3-container">
            <p>
            <div class="w3-col" style="width:50%">
                <span><h2>Invoice Information, Lnc.</h2></span> 
            </div>
            </p>
            <div class="w3-col" style="width:50%">
                <span style="margin-left:80%;padding-bottom:100px">
                    2/7/2021
                </span>
            </div>
        </div>

        <div class="w3-row">
            <div class="w3-col  w3-container" style="width:25%">
                <p>Customer information</p>
                <div class="thongTinKhachHang">
                    <p class="name"><b>${user.fullname}</b></p>
                    <p class="Addr">${user.address}</p>
                    <p class="phone">${user.phone}</p>
                    <p class="email">${user.email}</p>
                </div>
            </div>
            <div class="w3-col  w3-container" style="width:25%">
                <p>Order information</p>
                <div class="thongTinMuaHang">
                    <p class="Order"><b>Invoice #${id}</b></p>
                    <p class="idOrder"><b>Order: </b>${id}</p>
                    <p class="date"><b>Payment Due: </b>2/7/2021</p>
                    <p class="acc"><b>Account: </b>${user.accountID}</p>
                </div>
            </div>
            <div class="w3-col  w3-container" style="width:25%">

            </div>
            <div class="w3-col  w3-container" style="width:25%">

            </div>

        </div>
    </div>
    <br/>
    <div class="thongTinSanPham">
        <div class="sanPham">
            <div class="w3-container">
                <div class="music-container">
                    <div class="chart-music">
                        <center>
                            <table class="music-list-chart">
                                <tr>
                                    <td>
                                        <b>
                                            Qty 
                                        </b> 

                                    <td>
                                        <b>
                                            SongName  
                                        </b>


                                    <td>
                                        <b>
                                            Autdor 
                                        </b>


                                    <td>
                                        <b>
                                            Delivery date 
                                        </b>


                                    <td>
                                        <b>
                                            Price  
                                        </b>


                                </tr>
                                <tr>
                                    <td>
                                        1                    

                                    <td>                                     
                                        ${songID.songName}     

                                    <td>
                                        Olivia Rodrigo

                                    <td>
                                        ${songID.release}

                                    <td>
                                        ${songID.price}<span>$</span>
                                </tr>
                            </table>
                        </center>
                    </div>
                </div> 
            </div>
        </div>
    </div>
    <br/><br/>
    <div class="thanhToan">
        <div class="w3-container">
            <div class="w3-col  " style="width:50%">
                <p>
                    Payment Methods:
                </p>
                <br/>
                <p>
                    <label>
                        <input type="radio"/>
                        <img style="width:5%;border-radius:100%" src="https://web30s.vn/datafiles/3/2016-09-15/14739292305730_onepay.jpg" alt=""/>
                        <samp>
                            OnePay(International)
                        </samp>
                    </label>
                </p>
                <br/>
                <p style="font-size:10px;color: silver">
                    Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
                </p>
            </div>
            <div class="w3-col  w3-container" style="width:50%">
                <p>Amount Due 2/22/2014</p>
                <div class="music-container">
                    <div class="chart-music">
                        <center>
                            <table class="music-list-chart">
                                <tr>
                                    <td>
                                        <b>Subtotal: </b>                 

                                    <td>
                                        <b><% out.print(MonnyUSD);  %>$ </b>                 


                                </tr>
                                <tr>
                                    <td>                                     
                                        <b>Tax (0%)</b>    

                                    <td>                                     
                                        <b>0$</b>    


                                </tr>
                                <tr> 
                                    <td>                                     
                                        <b>Total:</b>    

                                    <td>                                     
                                        <b><% out.print(MonnyUSD);%>$</b> 
                                        <br

                                </tr>
                            </table>
                        </center>
                    </div>
                </div> 
            </div>
        </div>
    </div>

    <div class="congCu">
        <br>    
        <div class="w3-container">
            <div class="w3-col" style="width:50%">
                <button class="btn_print" type="button" style="border-radius:5px;width:100px;height:45px" > 
                    <img style="width:24px" src="https://img.icons8.com/ios/50/000000/print.png"/> 
                    Print
                </button>
            </div>
            <div class="w3-col  w3-container" style="width:50%">
                <button class="btn_pay" type="submit" style="border-radius:5px;margin-left:80%;width:130px;height:45px" >
                    <img src="https://img.icons8.com/pastel-glyph/24/000000/heck-for-payment--v2.png"/>
                    Payment
                </button>
            </div>  
        </div>
        </form>
    </div>
</div>
<%@include file="../includes/footer.jsp"%>

