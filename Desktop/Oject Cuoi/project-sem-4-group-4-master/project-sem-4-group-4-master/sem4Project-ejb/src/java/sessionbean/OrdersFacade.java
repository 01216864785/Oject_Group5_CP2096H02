/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entities.Orders;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author asus
 */
@Stateless
public class OrdersFacade extends AbstractFacade<Orders> implements OrdersFacadeLocal {

    @PersistenceContext(unitName = "sem4Test-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrdersFacade() {
        super(Orders.class);
    }

    @Override
    public String orderIdEnd() {
        String id = "";
        Query query = em.createNativeQuery("SELECT TOP 1 OrderID FROM Orders ORDER BY OrderID DESC");
        for (int i = 0; i < query.getResultList().size(); i++) {
            id = query.getResultList().get(i).toString();
        }
        return id;
    }

    @Override
    public String sumPriceOderAll(String start, String end) {
        String sum = "";
        String sql = "SELECT SUM(Price) FROM dbo.Orders where DayTrading  between  ? and ? ";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, start);
        query.setParameter(2, end);
        for (int i = 0; i < query.getResultList().size(); i++) {
            sum = query.getResultList().get(i).toString();
        }
        DecimalFormat formatter = new DecimalFormat("###,###,##0");
        return formatter.format(Double.parseDouble(sum));
    }

    @Override
    public String sumPriceOderAllNo(String start, String end) {
        String sum = "";
        String sql = "SELECT SUM(Price) FROM dbo.Orders where DayTrading  between  ? and ? ";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, start);
        query.setParameter(2, end);
        for (int i = 0; i < query.getResultList().size(); i++) {
            sum = query.getResultList().get(i).toString();
        }
        return sum;
    }

    @Override
    public List PriceAll(String start, String end) {
        List priceAll = new ArrayList();
        String str = end;
        String ym = str.substring(0, 8);
        String dEnd = str.substring(8);

        int coutDate = Integer.parseInt(dEnd);
        for (int i = 1; i <= coutDate; i++) {
            String tam = null;
            if (i < 10) {
                tam = ym + "0" + i;
            } else {
                tam = ym + i;
            }
            //du dung o day    
            String sumOnDate = sumOnDate(tam);
            if (!sumOnDate.equals("[null]")) {
                priceAll.add(locGiaTri(sumOnDate));

            } else {
                priceAll.add("0");
            }
        }
        System.out.println(priceAll);
        return priceAll;
    }

    public String sumOnDate(String date) {

        String sum = date;
        String sql = "SELECT sum(Price) FROM Orders where datediff(day, DayTrading, ?) = 0 ";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, sum);
        sum = null;
        sum = query.getResultList().toString();
        return sum;
    }

    public String locGiaTri(String loc) {
        int d, c;
        d = loc.indexOf("[");
        c = loc.indexOf("]");
        String trave = loc.substring(d + 1, c);
        loc = trave;
        return loc;
    }

    @Override
    public String countOrderNo(String start, String end) {
        String countOrder = null;
        countOrder = countOrder(start, end);
        return countOrder;
    }

    public String countOrder(String start, String end) {
        String sum = "";
        String sql = "SELECT COUNT(OrderID) FROM dbo.Orders where DayTrading  between  ? and ? ";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, start);
        query.setParameter(2, end);
        sum = query.getResultList().toString();
        sum = locGiaTri(sum);
        return sum;
    }

    @Override
    public String countOrderNotIs(String start, String end) {
        return countOrderNI(start, end);
    }

    public String countOrderNI(String start, String end) {
        String sum = "";
        String sql = "SELECT COUNT(OrderID) FROM dbo.Orders where DayTrading  between  ? and ?  and TransactionStatus IS NOT NULL";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, start);
        query.setParameter(2, end);
        sum = query.getResultList().toString();
        sum = locGiaTri(sum);
        return sum;
    }

    @Override
    public String sumPriceTop(String start, String end) {
        List<Object[]> authors = sumPriceTop10(start, end);
        List list = new ArrayList();
        for (Object[] a : authors) {
            String tam = "['" + a[0] + "'," + a[1] + "]";
            list.add(tam);
            tam = null;
        }
        String loc = list.toString();
        loc = loc.substring(1, loc.lastIndexOf("]"));
        System.out.println(loc);
        return loc;
    }

    public List sumPriceTop10(String start, String end) {
        String sql = "SELECT top 5 SongName,SUM(OrderDetails.Price) as 'd' from OrderDetails  "
                + "full  join Orders on OrderDetails.OrderID = Orders.OrderID "
                + "full  join Songs on OrderDetails.SongID = Songs.SongID where DayTrading between  ?  and  ?  group by SongName ORDER BY d DESC";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, start);
        query.setParameter(2, end);
        return query.getResultList();
    }

    @Override
    public List sumSongNameTop(String start, String end) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public List listSong(String start, String end) {
        String sql = "SELECT Songs.SongID,Orders.OrderID,[SongName],Fullname,DayTrading,OrderDetails.Price from OrderDetails  "
                + "full  join Orders on OrderDetails.OrderID = Orders.OrderID  "
                + "full  join Songs on OrderDetails.SongID = Songs.SongID  "
                + "full  join Accounts on Orders.AccountID =Accounts.AccountID "
                + "where DayTrading between  ?  and  ?  "
                + "and TransactionStatus is not null "
                + "order by DayTrading desc";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, start);
        query.setParameter(2, end);

        List<Object[]> authors = query.getResultList();

        List list = new ArrayList();
        for (Object[] a : authors) {
            String tam = "[" + a[0] + "/" + a[1] + "/" + a[2] + "/" + a[3] + "/" + a[4] + "/" + a[5] + "]";
            list.add(tam);
            tam = null;
        }
        return list;
    }

    //truy xuat order
    //duyb xuat order da thanh toan 
    public List orderPaid(String start, String end) {
        List priceAll = new ArrayList();
        String str = end;
        String ym = str.substring(0, 8);
        String dEnd = str.substring(8);

        int coutDate = Integer.parseInt(dEnd);
        for (int i = 1; i <= coutDate; i++) {
            String tam = null;
            if (i < 10) {
                tam = ym + "0" + i;
            } else {
                tam = ym + i;
            }
            //du dung o day    
            String sumOnDate = orderPaidChild(tam);
            if (!sumOnDate.equals("[null]")) {
                priceAll.add(locGiaTri(sumOnDate));

            } else {
                priceAll.add("0");
            }
        }
        return priceAll;
    }

    public String orderPaidChild(String end) {
        String sql = "select COUNT(OrderID) from Orders  "
                + "where  datediff(day,DayTrading, ?) = 0   and Status is not null";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, end);
        return query.getResultList().toString();
    }

    //truy xuat order chua thanh toan 
    public List orderPaidNull(String start, String end) {
        List priceAll = new ArrayList();
        String str = end;
        String ym = str.substring(0, 8);
        String dEnd = str.substring(8);

        int coutDate = Integer.parseInt(dEnd);
        for (int i = 1; i <= coutDate; i++) {
            String tam = null;
            if (i < 10) {
                tam = ym + "0" + i;
            } else {
                tam = ym + i;
            }
            //du dung o day    
            String sumOnDate = orderPaidChildNull(tam);
            if (!sumOnDate.equals("[null]")) {
                priceAll.add(locGiaTri(sumOnDate));

            } else {
                priceAll.add("0");
            }
        }
        return priceAll;
    }

    public String orderPaidChildNull(String end) {
        String sql = "select COUNT(OrderID) from Orders  "
                + "where  datediff(day,DayTrading, ?) = 0   and TransactionStatus is  not null ";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, end);
        return query.getResultList().toString();
    }

    @Override
    public List sumOrrder(String start, String end) {
        List listAll = new ArrayList();
        List listA = null, listB = null;
        listA = orderPaid(start, end);
        listB = orderPaidNull(start, end);

        String string = null;
        listAll.add("['','Paid', 'Unpaid']");
        for (int i = 1; i <= 31; i++) {
            if (i <= Integer.parseInt(end.substring(8, 10))) {
                string = "['" + i + "'," + listA.get(i - 1) + "," + listB.get(i - 1) + "]";

                listAll.add(string);
                string = null;
            } else {
                string = "['" + i + "'," + 0 + "," + 0 + "]";
                listAll.add(string);
                string = null;
            }

        }
        return listAll;
    }

    //truy xuar thong tin order 
    public List thongTinOrder(String start, String end) {
        String sql = "SELECT Songs.SongID,Orders.OrderID,SongName,Fullname,DayTrading,Orders.Price,TransactionStatus,Orders.Status ,OrderDate "
                + "from OrderDetails  "
                + "full  join Orders on OrderDetails.OrderID = Orders.OrderID  "
                + "full  join Songs on OrderDetails.SongID = Songs.SongID  "
                + "full  join Accounts on Orders.AccountID =Accounts.AccountID  "
                + "where DayTrading between  ?  and  ?  "
                + "order by DayTrading desc";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, start);
        query.setParameter(2, end);
        List<Object[]> authors = query.getResultList();
        String tam = null;
        List list = new ArrayList();
        for (Object[] a : authors) {
            tam="[" + a[0] + "/" + a[1] + "/" + a[2] + "/" + a[3] + "/" + a[4] + "/" + a[5] +"/" + a[6] +"/" + a[7] +"/" + a[8] + "]";
            list.add(tam);
            tam=null;
        }
        System.out.println("ssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        return list;
    }

    @Override
    public List nformationOrder(String start, String end) {
        System.out.println(thongTinOrder(start, end));
        return thongTinOrder(start, end);
    }

}
