/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entities.Accounts;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author asus
 */
@Local
public interface AccountsFacadeLocal {

    void create(Accounts accounts);

    void edit(Accounts accounts);

    void remove(Accounts accounts);

    Accounts find(Object id);

    List<Accounts> findAll();

    List<Accounts> findRange(int[] range);

    int count();
    
}
