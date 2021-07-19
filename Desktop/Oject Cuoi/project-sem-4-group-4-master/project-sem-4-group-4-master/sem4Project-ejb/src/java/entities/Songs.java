/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "Songs")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Songs.findAll", query = "SELECT s FROM Songs s")
    , @NamedQuery(name = "Songs.findBySongID", query = "SELECT s FROM Songs s WHERE s.songID = :songID")
    , @NamedQuery(name = "Songs.findBySongName", query = "SELECT s FROM Songs s WHERE s.songName = :songName")
    , @NamedQuery(name = "Songs.findByDescription", query = "SELECT s FROM Songs s WHERE s.description = :description")
    , @NamedQuery(name = "Songs.findByPath", query = "SELECT s FROM Songs s WHERE s.path = :path")
    , @NamedQuery(name = "Songs.findByPrice", query = "SELECT s FROM Songs s WHERE s.price = :price")
    , @NamedQuery(name = "Songs.findByRelease", query = "SELECT s FROM Songs s WHERE s.release = :release")
    , @NamedQuery(name = "Songs.findByArtistID", query = "SELECT s FROM Songs s WHERE s.artistID = :artistID")})
public class Songs implements Serializable {

    @Size(max = 150)
    @Column(name = "Thumbnail")
    private String thumbnail;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "SongID")
    private Integer songID;
    @Size(max = 70)
    @Column(name = "SongName")
    private String songName;
    @Size(max = 250)
    @Column(name = "Description")
    private String description;
    @Size(max = 100)
    @Column(name = "Path")
    private String path;
    @Column(name = "Price")
    private Integer price;
    @Column(name = "Release")
    @Temporal(TemporalType.DATE)
    private Date release;
    @Column(name = "ArtistID")
    private Integer artistID;
    @OneToMany(mappedBy = "songID")
    private Collection<OrderDetails> orderDetailsCollection;
    @OneToMany(mappedBy = "songID")
    private Collection<FavouriteAlbum> favouriteAlbumCollection;
    @JoinColumn(name = "SongID", referencedColumnName = "ArtistID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Artists artists;
    @JoinColumn(name = "SupplierID", referencedColumnName = "SupplierID")
    @ManyToOne
    private Suppliers supplierID;
    @JoinColumn(name = "TypeID", referencedColumnName = "TypeID")
    @ManyToOne
    private TypeOfSong typeID;
    @OneToMany(mappedBy = "songID")
    private Collection<ProducerWorkSong> producerWorkSongCollection;

    public Songs() {
    }

    public Songs(Integer songID) {
        this.songID = songID;
    }

    public Integer getSongID() {
        return songID;
    }

    public void setSongID(Integer songID) {
        this.songID = songID;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getRelease() {
        return release;
    }

    public void setRelease(Date release) {
        this.release = release;
    }

    public Integer getArtistID() {
        return artistID;
    }

    public void setArtistID(Integer artistID) {
        this.artistID = artistID;
    }

    @XmlTransient
    public Collection<OrderDetails> getOrderDetailsCollection() {
        return orderDetailsCollection;
    }

    public void setOrderDetailsCollection(Collection<OrderDetails> orderDetailsCollection) {
        this.orderDetailsCollection = orderDetailsCollection;
    }

    @XmlTransient
    public Collection<FavouriteAlbum> getFavouriteAlbumCollection() {
        return favouriteAlbumCollection;
    }

    public void setFavouriteAlbumCollection(Collection<FavouriteAlbum> favouriteAlbumCollection) {
        this.favouriteAlbumCollection = favouriteAlbumCollection;
    }

    public Artists getArtists() {
        return artists;
    }

    public void setArtists(Artists artists) {
        this.artists = artists;
    }

    public Suppliers getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(Suppliers supplierID) {
        this.supplierID = supplierID;
    }

    public TypeOfSong getTypeID() {
        return typeID;
    }

    public void setTypeID(TypeOfSong typeID) {
        this.typeID = typeID;
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
        hash += (songID != null ? songID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Songs)) {
            return false;
        }
        Songs other = (Songs) object;
        if ((this.songID == null && other.songID != null) || (this.songID != null && !this.songID.equals(other.songID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Songs[ songID=" + songID + " ]";
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    
}
