/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entities.WorkRole;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author asus
 */
@Local
public interface WorkRoleFacadeLocal {

    void create(WorkRole workRole);

    void edit(WorkRole workRole);

    void remove(WorkRole workRole);

    WorkRole find(Object id);

    List<WorkRole> findAll();

    List<WorkRole> findRange(int[] range);

    int count();
    
}
