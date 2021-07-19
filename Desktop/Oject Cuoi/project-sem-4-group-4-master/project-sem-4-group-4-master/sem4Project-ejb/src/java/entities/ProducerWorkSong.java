/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "ProducerWorkSong")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProducerWorkSong.findAll", query = "SELECT p FROM ProducerWorkSong p")
    , @NamedQuery(name = "ProducerWorkSong.findByWorkID", query = "SELECT p FROM ProducerWorkSong p WHERE p.workID = :workID")})
public class ProducerWorkSong implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "WorkID")
    private Integer workID;
    @JoinColumn(name = "ProducerID", referencedColumnName = "ProducerID")
    @ManyToOne
    private Producers producerID;
    @JoinColumn(name = "SongID", referencedColumnName = "SongID")
    @ManyToOne
    private Songs songID;
    @JoinColumn(name = "WRoleID", referencedColumnName = "WRoleID")
    @ManyToOne
    private WorkRole wRoleID;

    public ProducerWorkSong() {
    }

    public ProducerWorkSong(Integer workID) {
        this.workID = workID;
    }

    public Integer getWorkID() {
        return workID;
    }

    public void setWorkID(Integer workID) {
        this.workID = workID;
    }

    public Producers getProducerID() {
        return producerID;
    }

    public void setProducerID(Producers producerID) {
        this.producerID = producerID;
    }

    public Songs getSongID() {
        return songID;
    }

    public void setSongID(Songs songID) {
        this.songID = songID;
    }

    public WorkRole getWRoleID() {
        return wRoleID;
    }

    public void setWRoleID(WorkRole wRoleID) {
        this.wRoleID = wRoleID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (workID != null ? workID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProducerWorkSong)) {
            return false;
        }
        ProducerWorkSong other = (ProducerWorkSong) object;
        if ((this.workID == null && other.workID != null) || (this.workID != null && !this.workID.equals(other.workID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ProducerWorkSong[ workID=" + workID + " ]";
    }
    
}
