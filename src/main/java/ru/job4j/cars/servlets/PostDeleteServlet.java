package ru.job4j.cars.servlets;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import ru.job4j.cars.repository.AdRepository;
import ru.job4j.cars.model.User;

public class PostDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        AdRepository rep = new AdRepository();
        rep.deletePost(id);
        String path = String.format("c:\\images\\%s.jpg", id);
        try {
            Files.deleteIfExists(Paths.get(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
      
        User user = (User) req.getSession().getAttribute("user");
       
        req.setAttribute("posts", rep.findPostByUser(user));
        req.getRequestDispatcher("posts.jsp").forward(req, resp);
    }
}