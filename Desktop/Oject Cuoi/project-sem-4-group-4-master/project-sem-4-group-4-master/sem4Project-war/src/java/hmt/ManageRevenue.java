/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hmt;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionbean.OrdersFacadeLocal;

/**
 *
 * @author hmtua
 */
@WebServlet("/ManageRevenue")
public class ManageRevenue extends HttpServlet {

    @EJB
    private OrdersFacadeLocal ordersFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //day ngay dau va cuoi thanh 
        LocalDate start = YearMonth.now().atDay(1);
        LocalDate end = YearMonth.now().atEndOfMonth();
        LocalDate d1 = java.time.LocalDate.now();
        //nhaanh  gai tri reuy xuat
        String sqlSumPrice = request.getParameter("date");
        // lay de truy xuat ket qua chi tiet

        SuLy suLy = new SuLy();

        //lay gia tri truy xuat truoc do  trong mot thang 
        String ngayDau = suLy.dateTruocDo(start.toString());
        String nayCuoi = suLy.datePhiaSau(d1.toString());

        //lay  price date 
        if (!sqlSumPrice.equals(null)) {
            //lay lít san sam doan thu 
            if (sqlSumPrice.equals("listAll")) {
                List list = ordersFacade.listSong(ngayDau, nayCuoi);
                request.setAttribute("listSong", list);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("musics/manage/doanhthu/listAll.jsp");
                requestDispatcher.forward(request, response);
            }
            //lay doan thu trong thang hien tai
            if (sqlSumPrice.equals("hientai")) {
                String priceDateIn = ordersFacade.sumPriceOderAll(ngayDau, nayCuoi);
                //lay gia trị Price khon co .
                String priceNo = ordersFacade.sumPriceOderAllNo(ngayDau, nayCuoi);
                //gia trij price da lam tron
                request.setAttribute("sumPriceAllInDateNo", priceNo);
                //gia tri price chinh xac da themdau .
                request.setAttribute("sumPriceAllInDate", priceDateIn);

                //lay danh sach gia trong thang 
                List listPriceAll = ordersFacade.PriceAll(ngayDau, nayCuoi);
                request.setAttribute("listPriceAll", listPriceAll);

                //dem so sluot order trong thang
                String countOrder = ordersFacade.countOrderNo(ngayDau, nayCuoi);
                request.setAttribute("countOrder", countOrder);
                //dem so sluot order da thanh toan trong  trong thang
                String countOrderIndate = ordersFacade.countOrderNotIs(ngayDau, nayCuoi);
                request.setAttribute("countOrderIS", countOrderIndate);
                // lay thong tin sum top 10
                request.setAttribute("sumTop10", ordersFacade.sumPriceTop(ngayDau, nayCuoi));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("musics/manage/doanhthu/index.jsp");
                requestDispatcher.forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public String lamTton(String soLe) {
        String sum = soLe;
        char[] t = sum.toCharArray();
        sum = "";
        int inedx1 = Integer.parseInt(String.valueOf(t[0]));
        int inedx2 = Integer.parseInt(String.valueOf(t[1]));
        if (inedx2 < 9) {
            inedx2 += 1;
            for (int i = 0; i < t.length; i++) {
                if (i == 0) {
                    sum += String.valueOf(t[i]);

                } else if (i == 1) {
                    sum += String.valueOf(inedx2);
                } else {
                    sum += "0";
                }

            }
        }
        return sum;
    }

}
