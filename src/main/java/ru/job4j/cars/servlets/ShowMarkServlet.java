
package ru.job4j.cars.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ru.job4j.cars.repository.AdRepository;
import ru.job4j.cars.model.Trademark;


public class ShowMarkServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        AdRepository rep = new AdRepository();
        List<Trademark> list = rep.getAllMarks();
        System.out.println(list);
        ObjectMapper mapper = new ObjectMapper();
        String response = mapper.writeValueAsString(list);
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("json");
        resp.getWriter().write(response);
    }
}
