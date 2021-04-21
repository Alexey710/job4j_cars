package ru.job4j.cars.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import ru.job4j.cars.repository.AdRepository;
import ru.job4j.cars.model.Post;

public class ShowAllPostsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String radioForm = req.getParameter("radio");
     
        
        AdRepository rep = new AdRepository();
        List<Post> list;
        if ("all".equals(radioForm)) {
            list = rep.showAllAds();
            req.setAttribute("radio", "all");
        } else {
            list = rep.showLastDayAds();
            req.setAttribute("radio", "today");
        }
       
        req.setAttribute("posts", list);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}