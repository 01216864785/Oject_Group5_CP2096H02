/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "Artists")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Artists.findAll", query = "SELECT a FROM Artists a")
    , @NamedQuery(name = "Artists.findByArtistID", query = "SELECT a FROM Artists a WHERE a.artistID = :artistID")
    , @NamedQuery(name = "Artists.findByFullname", query = "SELECT a FROM Artists a WHERE a.fullname = :fullname")
    , @NamedQuery(name = "Artists.findByBirthday", query = "SELECT a FROM Artists a WHERE a.birthday = :birthday")
    , @NamedQuery(name = "Artists.findByDescription", query = "SELECT a FROM Artists a WHERE a.description = :description")
    , @NamedQuery(name = "Artists.findByIsAlive", query = "SELECT a FROM Artists a WHERE a.isAlive = :isAlive")})
public class Artists implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ArtistID")
    private Integer artistID;
    @Size(max = 70)
    @Column(name = "Fullname")
    private String fullname;
    @Size(max = 40)
    @Column(name = "Birthday")
    private String birthday;
    @Size(max = 150)
    @Column(name = "Description")
    private String description;
    @Column(name = "isAlive")
    private Integer isAlive;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Achievement")
    private String achievement;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "artists")
    private Songs songs;

    public Artists() {
    }

    public Artists(Integer artistID) {
        this.artistID = artistID;
    }

    public Integer getArtistID() {
        return artistID;
    }

    public void setArtistID(Integer artistID) {
        this.artistID = artistID;
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

    public Integer getIsAlive() {
        return isAlive;
    }

    public void setIsAlive(Integer isAlive) {
        this.isAlive = isAlive;
    }

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }

    public Songs getSongs() {
        return songs;
    }

    public void setSongs(Songs songs) {
        this.songs = songs;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (artistID != null ? artistID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Artists)) {
            return false;
        }
        Artists other = (Artists) object;
        if ((this.artistID == null && other.artistID != null) || (this.artistID != null && !this.artistID.equals(other.artistID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Artists[ artistID=" + artistID + " ]";
    }
    
}
