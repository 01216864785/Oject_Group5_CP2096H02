/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entities.FavouriteAlbum;
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
public class FavouriteAlbumFacade extends AbstractFacade<FavouriteAlbum> implements FavouriteAlbumFacadeLocal {

    @PersistenceContext(unitName = "sem4Test-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FavouriteAlbumFacade() {
        super(FavouriteAlbum.class);
    }

    @Override
    public List listIDAlbum() {
        String sql = "SELECT SongID FROM FavouriteAlbum group by SongID";
        Query query = em.createNativeQuery(sql);
        List ListId = new ArrayList();
        ListId = query.getResultList();
        return ListId;
    }

    public String listSong(String idSong) {
        String sql = "select Songs.SongID,AccountID,SongName,Path,Songs.Price,Songs.ArtistID,Artists.Fullname,Songs.Thumbnail,TransactionStatus,Status "
                + "from Songs join Artists on Songs.ArtistID = Artists.ArtistID  "
                + "full  join Suppliers on Suppliers.SupplierID= Songs.SupplierID  "
                + "full join OrderDetails on OrderDetails.SongID = Songs.SongID   "
                + "full  join Orders on Orders.OrderID= OrderDetails.OrderID  where  Songs.SongID =?";
        
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, idSong);
        List<Object[]> authors = query.getResultList();
        String tam = null;
        for (Object[] a : authors) {
            tam = "[" + a[0] + "/" + a[1] + "/" + a[2] + "/" + a[3] + "/" + a[4] + "/" + a[5] + "/" + a[6] + "/" + a[7] + "/" + a[8] + "/" + a[9] + "]";
        }
        return tam;
    }

    @Override
    public List listSongAll() {
        List list = new ArrayList();
        list=listIDAlbum();
        List DS = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            DS.add(listSong(String.valueOf(list.get(i))));          
        }
        return DS;
    }

}
