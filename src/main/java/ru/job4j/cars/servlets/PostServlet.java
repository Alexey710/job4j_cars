
package ru.job4j.cars.servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ru.job4j.cars.model.*;

public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        AdRepository rep = new AdRepository();
        User user = (User) req.getSession().getAttribute("user");
       
        req.setAttribute("posts", rep.findPostByUser(user));
        req.getRequestDispatcher("posts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String markForm = req.getParameter("mark");
        String model = req.getParameter("modelCar");
        String body = req.getParameter("body");
        String yearForm = req.getParameter("year");
        String priceForm = req.getParameter("price");
        String mileageForm = req.getParameter("mileage");
    
        
        int price = Integer.parseInt(priceForm);
        int year = Integer.parseInt(yearForm);
        int mileage = Integer.parseInt(mileageForm);
        Car car = Car.of(markForm, body, year, price, mileage);
     
        User user = (User) req.getSession().getAttribute("user");
        
        String description = String.format(
                "Продаю машину %s %s, кузов - %s,"
                        + " %s г.в., пробег %s км, цена %s руб.. Контакты: %s, %s.",
                markForm, model, body, 
                yearForm, mileageForm, priceForm, user.getName(), user.getEmail());
        
        Post post = Post.of(description, car, user);
        AdRepository rep = new AdRepository();
        rep.add(post);
        resp.sendRedirect(req.getContextPath() + "/post.do");

    }
}