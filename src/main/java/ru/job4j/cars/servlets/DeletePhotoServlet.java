package ru.job4j.cars.servlets;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import ru.job4j.cars.model.AdRepository;
import ru.job4j.cars.model.User;

public class DeletePhotoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = req.getParameter("name");
        String path = String.format("c:\\images\\%s", name);
        try {
            Files.deleteIfExists(Paths.get(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        AdRepository rep = new AdRepository();
        User user = (User) req.getSession().getAttribute("user");
       
        req.setAttribute("posts", rep.findPostByUser(user));
     
        req.getRequestDispatcher("posts.jsp").forward(req, resp);
    }
}