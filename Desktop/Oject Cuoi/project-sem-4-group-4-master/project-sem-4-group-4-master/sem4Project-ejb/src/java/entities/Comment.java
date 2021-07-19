/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "Comment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c")
    , @NamedQuery(name = "Comment.findByCommentID", query = "SELECT c FROM Comment c WHERE c.commentID = :commentID")
    , @NamedQuery(name = "Comment.findByMessage", query = "SELECT c FROM Comment c WHERE c.message = :message")
    , @NamedQuery(name = "Comment.findByNewID", query = "SELECT c FROM Comment c WHERE c.newID = :newID")
    , @NamedQuery(name = "Comment.findByAccountID", query = "SELECT c FROM Comment c WHERE c.accountID = :accountID")
    , @NamedQuery(name = "Comment.findByCreatedAt", query = "SELECT c FROM Comment c WHERE c.createdAt = :createdAt")})
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CommentID")
    private Integer commentID;
    @Size(max = 150)
    @Column(name = "Message")
    private String message;
    @Column(name = "NewID")
    private Integer newID;
    @Column(name = "AccountID")
    private Integer accountID;
    @Column(name = "CreatedAt")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    public Comment() {
    }

    public Comment(Integer commentID) {
        this.commentID = commentID;
    }

    public Integer getCommentID() {
        return commentID;
    }

    public void setCommentID(Integer commentID) {
        this.commentID = commentID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getNewID() {
        return newID;
    }

    public void setNewID(Integer newID) {
        this.newID = newID;
    }

    public Integer getAccountID() {
        return accountID;
    }

    public void setAccountID(Integer accountID) {
        this.accountID = accountID;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (commentID != null ? commentID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.commentID == null && other.commentID != null) || (this.commentID != null && !this.commentID.equals(other.commentID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Comment[ commentID=" + commentID + " ]";
    }
    
}
