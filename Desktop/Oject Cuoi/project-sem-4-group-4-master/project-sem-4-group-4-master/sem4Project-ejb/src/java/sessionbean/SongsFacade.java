/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entities.Songs;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author asus
 */
@Stateless
public class SongsFacade extends AbstractFacade<Songs> implements SongsFacadeLocal {

    @PersistenceContext(unitName = "sem4Test-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SongsFacade() {
        super(Songs.class);
    }

    @Override
    public Songs findID(String Id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public List listSong() {
        String sql = "select Songs.SongID,AccountID,SongName,Path,Songs.Price,Songs.ArtistID,Artists.Fullname,Songs.Thumbnail,TransactionStatus,Status "
                + "from Songs join Artists on Songs.ArtistID = Artists.ArtistID  "
                + "full  join Suppliers on Suppliers.SupplierID= Songs.SupplierID  "
                + "full join OrderDetails on OrderDetails.SongID = Songs.SongID   "
                + "full  join Orders on Orders.OrderID= OrderDetails.OrderID ";
        Query query = em.createNativeQuery(sql);
        List<Object[]> authors = query.getResultList();
        String tam = null;
        List list = new ArrayList();
        for (Object[] a : authors) {
            tam = "[" + a[0] + "/" + a[1] + "/" + a[2] + "/" + a[3] + "/" + a[4] + "/" + a[5] + "/" + a[6] + "/" + a[7] + "/" + a[8] + "/" + a[9] + "]";
            list.add(tam);
            tam = null;
        }
        return list;
    }

    @Override
    public List listSongAll() {
        return listSong();
    }

    public List listIDSongOrder1(String AccID) {
        String sql = " select Songs.SongID "
                + " from Songs "
                + " full join Artists on Songs.ArtistID = Artists.ArtistID "
                + " full join Suppliers on Suppliers.SupplierID= Songs.SupplierID  "
                + " full join OrderDetails on OrderDetails.SongID = Songs.SongID "
                + " full join Orders on Orders.OrderID= OrderDetails.OrderID "
                + " where Orders.TransactionStatus =1 and Orders.Status=1 and AccountID=?";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, AccID);
        return query.getResultList();
    }

    @Override
    public List listIDSongOrder(String AccID) {
        return listIDSongOrder1(AccID);
    }

    @Override
    public List listSongAllIDArtistID(String ArtistID) {
        String sql = "select Songs.SongID,AccountID,SongName,Path,Songs.Price,Songs.ArtistID,Artists.Fullname,Songs.Thumbnail,TransactionStatus,Status "
                + "from Songs join Artists on Songs.ArtistID = Artists.ArtistID  "
                + "full  join Suppliers on Suppliers.SupplierID= Songs.SupplierID  "
                + "full join OrderDetails on OrderDetails.SongID = Songs.SongID   "
                + "full  join Orders on Orders.OrderID= OrderDetails.OrderID where Songs.ArtistID=?";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, ArtistID);
        List<Object[]> authors = query.getResultList();
        String tam = null;
        List list = new ArrayList();
        for (Object[] a : authors) {
            tam = "[" + a[0] + "/" + a[1] + "/" + a[2] + "/" + a[3] + "/" + a[4] + "/" + a[5] + "/" + a[6] + "/" + a[7] + "/" + a[8] + "/" + a[9] + "]";
            list.add(tam);
            tam = null;
        }
        System.out.println(list);
        return list;
    }
    
    
    @Override
    public String albumIdEnd() {
        String id = "";
        Query query = em.createNativeQuery("SELECT TOP 1 FvID FROM FavouriteAlbum ORDER BY FvID DESC");
        for (int i = 0; i < query.getResultList().size(); i++) {
            id = query.getResultList().get(i).toString();
        }
        return id;
    }

}
