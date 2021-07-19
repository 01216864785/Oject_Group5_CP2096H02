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
@WebServlet("/ManageBillOrder")
public class ManageBillOrder extends HttpServlet {

    @EJB
    private OrdersFacadeLocal ordersFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String retun = request.getParameter("date");
        LocalDate start = YearMonth.now().atDay(1);
        LocalDate end = YearMonth.now().atEndOfMonth();
        LocalDate d1 = java.time.LocalDate.now();
        //nhaanh  gai tri reuy xuat
        String sqlSumPrice = request.getParameter("date");
        // lay de truy xuat ket qua chi tiet

        SuLy suLy = new SuLy();
        String ngayDau = suLy.dateTruocDo(start.toString());
        String nayCuoi = suLy.datePhiaSau(d1.toString());
        if (retun.equals("hientai")) {

            //tra ve thong tin order
            request.setAttribute("order", ordersFacade.sumOrrder(start.toString(), d1.toString()));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("musics/manage/billorder/index.jsp");
            requestDispatcher.forward(request, response);
        }
        if (retun.equals("details")) {
            request.setAttribute("informationOrderDate", ordersFacade.nformationOrder(ngayDau, nayCuoi));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("musics/manage/billorder/details.jsp");
            requestDispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
