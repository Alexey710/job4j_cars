package ru.job4j.cars.servlets;

import ru.job4j.cars.model.User;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import ru.job4j.cars.model.AdRepository;

public class RegServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        AdRepository rep = new AdRepository();
        User user = rep.findByCredential(email, password);
        if (user == null) {
            rep.addUser(User.of(name, email, password));
            req.setAttribute("status", "Пользователь зарегистрирован.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            req.setAttribute("status", "E-mail уже существует. Введите новый e-mail.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
