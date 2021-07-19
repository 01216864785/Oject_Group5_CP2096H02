
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<div><div name="dsMusic" class="music-container">
        <div class="music-container">
            <div class="chart-music">               
                <table class="music-list-chart">
                    <tbody id="myTable">
                        <%
                            //lay id khac hang 
                            String idSongOrdera = null;
                            if (session.getAttribute("userID") != null) {
                                idSongOrdera = String.valueOf(request.getAttribute("idSongOrder"));
                            } else {
                                idSongOrdera = null;
                            }
                            //String AccountIDSession = String.valueOf(session.getAttribute("userID"));
                            List lsu = new ArrayList();
                            lsu = (ArrayList) request.getAttribute("album");
                            for (int idx = 0; idx < lsu.size(); idx++) {
                                String t = lsu.get(idx).toString();
                                char[] ch = t.substring(1, t.indexOf("]")).toCharArray();
                                String AccountID, SongID, SongName, Path, PriceSong, ngheSiID, tenNgheSi, anhBiaHat, trangThaiThanhToan, TrangThaiOrder;
                                String cat = t.substring(1, t.indexOf("]")).trim();
                                if (!cat.substring(0, cat.indexOf("/")).equals("null")) {
                                    SongID = cat.substring(0, cat.indexOf("/"));
                                    String cat2 = cat.substring(cat.indexOf("/") + 1).trim();
                                    //
                                    AccountID = cat2.substring(0, cat2.indexOf("/"));
                                    String cat3 = cat2.substring(cat2.indexOf("/") + 1).trim();
                                    //
                                    SongName = cat3.substring(0, cat3.indexOf("/"));
                                    String cat4 = cat3.substring(cat3.indexOf("/") + 1).trim();
                                    //
                                    Path = cat4.substring(0, cat4.indexOf("/"));
                                    String cat5 = cat4.substring(cat4.indexOf("/") + 1).trim();
                                    //
                                    PriceSong = cat5.substring(0, cat5.indexOf("/"));
                                    String cat6 = cat5.substring(cat5.indexOf("/") + 1).trim();
                                    //
                                    ngheSiID = cat6.substring(0, cat6.indexOf("/"));
                                    String cat7 = cat6.substring(cat6.indexOf("/") + 1).trim();
                                    //
                                    tenNgheSi = cat7.substring(0, cat7.indexOf("/"));
                                    String cat8 = cat7.substring(cat7.indexOf("/") + 1).trim();
                                    //jjj
                                    anhBiaHat = cat8.substring(0, cat8.indexOf("/"));
                                    if (anhBiaHat.equals("null")) {
                                        anhBiaHat = "https://img.icons8.com/cute-clipart/64/000000/test-account.png";
                                    } else {
                                        anhBiaHat = anhBiaHat;
                                    }
                                    String cat9 = cat8.substring(cat8.indexOf("/") + 1).trim();
                                    //
                                    trangThaiThanhToan = cat9.substring(0, cat9.indexOf("/"));
                                    String cat10 = cat9.substring(cat9.indexOf("/") + 1).trim();
                                    //
                                    TrangThaiOrder = cat10;
                        %>
                        <tr class="itemsMusic">
                            <td style="width:50%;text-align: left;">
                                <div class="chart-info">
                                    <div class="chart-thumbnail">
                                        <img src="<% out.print(anhBiaHat); %>" alt="">
                                    </div>
                                    <div class="chart-name">
                                        <a href="${pageContext.request.contextPath}/SongDetail?songID=<% out.print(SongID); %>">
                                            <span class="chart-title"><% out.print(SongName); %></span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/?ID=<% out.print(ngheSiID); %>">
                                            <span class="chart-singer"><% out.print(tenNgheSi); %></span>
                                        </a>
                                    </div> 
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                            <td style="width:50%;text-align: right" class="chart-action">

                                <%
                                    if (idSongOrdera.indexOf(SongID)!= -1) {
                                        //dung de chua duong dan nhac
                                        //duong dan nap trong 
                                        //<% out.print(Path); 
                                %>
                                <a href="" data-src="music2.mp3" class="btn-link btn-play"><i class='bx bx-play'></i>Play</a>
                                <%
                                } else {
                                    if (PriceSong.equals("null") || PriceSong.equals("0")) {
                                %>
                                <a href="" data-src="music2.mp3" class="btn-link btn-play"><i class='bx bx-play'></i>Play</a>
                                <%
                                } else if (!PriceSong.equals("null") || !PriceSong.equals("0")) {
                                %>
                                <a href="${pageContext.request.contextPath}/Order?idSong=<% out.print(SongID); %>" class="btn-link btn-order"> Buy <% out.print(PriceSong); %>$</a>
                                <%
                                        }

                                    }
                                %>

                            </td>
                        </tr>
                        <%   }
                            }
                        %> 
                    </tbody>
                </table>
            </div>
        </div>
    </div></div>

