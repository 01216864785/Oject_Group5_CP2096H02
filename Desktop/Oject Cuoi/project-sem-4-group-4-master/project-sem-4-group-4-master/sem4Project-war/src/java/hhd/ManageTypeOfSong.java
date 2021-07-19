/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hhd;

import entities.TypeOfSong;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionbean.TypeOfSongFacadeLocal;

/**
 *
 * @author asus
 */
@WebServlet("/admin-typesong")
public class ManageTypeOfSong extends HttpServlet {

    @EJB
    private TypeOfSongFacadeLocal typeOfSongFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String todo = request.getParameter("do");
        if(todo.equals("list")){
            List<TypeOfSong> list = typeOfSongFacade.findAll();
            request.setAttribute("list", list);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/typesong/list.jsp");
            requestDispatcher.forward(request, response);
        }
        else if(todo.equals("edit")){
            int typeID = Integer.parseInt(request.getParameter("id"));
            TypeOfSong obj = typeOfSongFacade.find(typeID);
            request.setAttribute("typeOfSong", obj);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/typesong/edit.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String applicationPath = request.getContextPath(); // get real path
        // get type of submit, create, edit, ...
        String submit = request.getParameter("submit");
        System.out.println("Type submit " + submit);
        // check type
        if(submit.equals("add")){
            String typeName = request.getParameter("typename");
            String des = request.getParameter("description");
            TypeOfSong song = new TypeOfSong();
            song.setTypeName(typeName);
            song.setDescription(des);
            typeOfSongFacade.create(song);
            response.sendRedirect(applicationPath+"/admin/typesong/create.jsp?msg=success");
        }
        else if(submit.equals("edit")){
            int typeID = Integer.parseInt(request.getParameter("typeID"));
            TypeOfSong obj = typeOfSongFacade.find(typeID);
            if(obj == null){
                response.sendRedirect(applicationPath+"/admin-typesong?do=list");
            }
            else{
                String typeName = request.getParameter("typename");
                String des = request.getParameter("description");
                obj.setTypeName(typeName);
                obj.setDescription(des);
                typeOfSongFacade.edit(obj);
                request.setAttribute("typeOfSong", obj);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/typesong/edit.jsp?msg=success");
                requestDispatcher.forward(request, response);
            }

        }
        else if(submit.equals("del")){
            int typeID = Integer.parseInt(request.getParameter("typeID"));
            TypeOfSong obj = typeOfSongFacade.find(typeID);
            typeOfSongFacade.remove(obj);
            response.sendRedirect(applicationPath+"/admin-typesong?do=list");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
