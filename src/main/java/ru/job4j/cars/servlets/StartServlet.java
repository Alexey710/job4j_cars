
package ru.job4j.cars.servlets;

import ru.job4j.cars.repository.AdRepository;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class StartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        AdRepository rep = new AdRepository();
        req.setAttribute("posts", rep.showAllAds());
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

}