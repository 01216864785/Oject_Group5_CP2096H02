/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entities.Songs;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author asus
 */
@Local
public interface SongsFacadeLocal {

    void create(Songs songs);

    void edit(Songs songs);

    void remove(Songs songs);

    Songs find(Object id);

    List<Songs> findAll();

    Songs findID(String id);

    List<Songs> findRange(int[] range);

    List listSongAll();

    List listIDSongOrder(String AccID);

    List listSongAllIDArtistID(String ArtistID);

    public String albumIdEnd();

    int count();

}
