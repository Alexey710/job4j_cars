package ru.job4j.cars.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import ru.job4j.cars.model.AdRepository;
import ru.job4j.cars.model.Post;
import ru.job4j.cars.model.Trademark;

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