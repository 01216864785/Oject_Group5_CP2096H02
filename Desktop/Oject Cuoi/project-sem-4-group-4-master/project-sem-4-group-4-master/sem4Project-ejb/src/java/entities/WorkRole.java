/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "WorkRole")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "WorkRole.findAll", query = "SELECT w FROM WorkRole w")
    , @NamedQuery(name = "WorkRole.findByWRoleID", query = "SELECT w FROM WorkRole w WHERE w.wRoleID = :wRoleID")
    , @NamedQuery(name = "WorkRole.findByName", query = "SELECT w FROM WorkRole w WHERE w.name = :name")
    , @NamedQuery(name = "WorkRole.findByDescription", query = "SELECT w FROM WorkRole w WHERE w.description = :description")})
public class WorkRole implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "WRoleID")
    private Integer wRoleID;
    @Size(max = 100)
    @Column(name = "Name")
    private String name;
    @Size(max = 250)
    @Column(name = "Description")
    private String description;
    @OneToMany(mappedBy = "wRoleID")
    private Collection<ProducerWorkSong> producerWorkSongCollection;

    public WorkRole() {
    }

    public WorkRole(Integer wRoleID) {
        this.wRoleID = wRoleID;
    }

    public Integer getWRoleID() {
        return wRoleID;
    }

    public void setWRoleID(Integer wRoleID) {
        this.wRoleID = wRoleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<ProducerWorkSong> getProducerWorkSongCollection() {
        return producerWorkSongCollection;
    }

    public void setProducerWorkSongCollection(Collection<ProducerWorkSong> producerWorkSongCollection) {
        this.producerWorkSongCollection = producerWorkSongCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (wRoleID != null ? wRoleID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WorkRole)) {
            return false;
        }
        WorkRole other = (WorkRole) object;
        if ((this.wRoleID == null && other.wRoleID != null) || (this.wRoleID != null && !this.wRoleID.equals(other.wRoleID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.WorkRole[ wRoleID=" + wRoleID + " ]";
    }
    
}
