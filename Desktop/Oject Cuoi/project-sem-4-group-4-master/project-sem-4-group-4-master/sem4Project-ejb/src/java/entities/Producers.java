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
@Table(name = "Producers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Producers.findAll", query = "SELECT p FROM Producers p")
    , @NamedQuery(name = "Producers.findByProducerID", query = "SELECT p FROM Producers p WHERE p.producerID = :producerID")
    , @NamedQuery(name = "Producers.findByFullname", query = "SELECT p FROM Producers p WHERE p.fullname = :fullname")
    , @NamedQuery(name = "Producers.findByBirthday", query = "SELECT p FROM Producers p WHERE p.birthday = :birthday")
    , @NamedQuery(name = "Producers.findByDescription", query = "SELECT p FROM Producers p WHERE p.description = :description")})
public class Producers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ProducerID")
    private Integer producerID;
    @Size(max = 70)
    @Column(name = "Fullname")
    private String fullname;
    @Size(max = 40)
    @Column(name = "Birthday")
    private String birthday;
    @Size(max = 100)
    @Column(name = "Description")
    private String description;
    @OneToMany(mappedBy = "producerID")
    private Collection<ProducerWorkSong> producerWorkSongCollection;

    public Producers() {
    }

    public Producers(Integer producerID) {
        this.producerID = producerID;
    }

    public Integer getProducerID() {
        return producerID;
    }

    public void setProducerID(Integer producerID) {
        this.producerID = producerID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
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
        hash += (producerID != null ? producerID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Producers)) {
            return false;
        }
        Producers other = (Producers) object;
        if ((this.producerID == null && other.producerID != null) || (this.producerID != null && !this.producerID.equals(other.producerID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Producers[ producerID=" + producerID + " ]";
    }
    
}
