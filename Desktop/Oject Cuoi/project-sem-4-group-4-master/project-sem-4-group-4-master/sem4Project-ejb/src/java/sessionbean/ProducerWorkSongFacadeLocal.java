/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entities.ProducerWorkSong;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author asus
 */
@Local
public interface ProducerWorkSongFacadeLocal {

    void create(ProducerWorkSong producerWorkSong);

    void edit(ProducerWorkSong producerWorkSong);

    void remove(ProducerWorkSong producerWorkSong);

    ProducerWorkSong find(Object id);

    List<ProducerWorkSong> findAll();

    List<ProducerWorkSong> findRange(int[] range);

    int count();
    
}
