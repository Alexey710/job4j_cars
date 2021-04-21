package ru.job4j.cars.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import ru.job4j.cars.repository.AdRepository;
import ru.job4j.cars.model.Post;

public class MarkServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
     
        String markForm = req.getParameter("select1");
      
        AdRepository rep = new AdRepository();
        List<Post> list = rep.showAdsOfMark(markForm);
      
        req.setAttribute("posts", list);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
        
    }
}