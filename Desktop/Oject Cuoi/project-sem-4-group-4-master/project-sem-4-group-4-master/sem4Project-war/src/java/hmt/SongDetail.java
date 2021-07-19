/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hmt;

import entities.Accounts;
import entities.Artists;
import entities.FavouriteAlbum;
import entities.Songs;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbean.AccountsFacadeLocal;
import sessionbean.ArtistsFacadeLocal;
import sessionbean.FavouriteAlbumFacadeLocal;
import sessionbean.SongsFacadeLocal;

/**
 *
 * @author hmtua
 */
@WebServlet("/SongDetail")
public class SongDetail extends HttpServlet {

    @EJB
    private FavouriteAlbumFacadeLocal favouriteAlbumFacade;

    @EJB
    private AccountsFacadeLocal accountsFacade;

    @EJB
    private ArtistsFacadeLocal artistsFacade1;

    @EJB
    private ArtistsFacadeLocal artistsFacade;

    @EJB
    private SongsFacadeLocal songsFacade;

    List<Songs> listSong;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idAcc = String.valueOf(session.getAttribute("userID"));
        String songListID = request.getParameter("songID");
        if (songListID != null) {
            //tra ve goi y nghe si
            request.setAttribute("artists", artistsFacade.findAll());

            request.setAttribute("listSongAll", songsFacade.listSongAll());

            Songs song = songsFacade.find(Integer.parseInt(songListID));
            request.setAttribute("songDetails", song);
            //
            listSong = songsFacade.findAll();
            request.setAttribute("listSong", listSong);
            //danh sachs bai hat 
            request.setAttribute("listSongArtistID", songsFacade.listSongAllIDArtistID(song.getArtistID().toString()));
            //
            if (session.getAttribute("userID") != null) {
                request.setAttribute("idSongOrder", songsFacade.listIDSongOrder(String.valueOf(session.getAttribute("userID"))));
            }
            //
            //  request.setAttribute("ngheSi", artistsFacade.find(listSong.get(0)));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("musics/detail_music.jsp");
            requestDispatcher.forward(request, response);
        }
        //add album
        if (request.getParameter("addAlbum") != null) {
            if (request.getParameter("addAlbum").equals("all")) {
                request.setAttribute("album", favouriteAlbumFacade.listSongAll());
                if (session.getAttribute("userID") != null) {
                    request.setAttribute("idSongOrder", songsFacade.listIDSongOrder(String.valueOf(session.getAttribute("userID"))));
                }
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("musics/album.jsp");
                requestDispatcher.forward(request, response);
            } else {
                String idSong = request.getParameter("addAlbum");
                Songs song = songsFacade.find(Integer.parseInt(idSong));
                Accounts acc = accountsFacade.find(Integer.parseInt(idAcc));
                FavouriteAlbum album = new FavouriteAlbum();
                album.setAccountID(acc);
                album.setAlbumName(acc.getFullname() + "- id:" + acc.getAccountID());
                album.setSongID(song);
                favouriteAlbumFacade.create(album);
                String idAlbumEnd = songsFacade.albumIdEnd();
                request.setAttribute("album", favouriteAlbumFacade.listSongAll());
                if (session.getAttribute("userID") != null) {
                    request.setAttribute("idSongOrder", songsFacade.listIDSongOrder(String.valueOf(session.getAttribute("userID"))));
                }
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("musics/album.jsp");
                requestDispatcher.forward(request, response);
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
