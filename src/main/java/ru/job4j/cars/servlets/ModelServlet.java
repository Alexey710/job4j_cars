package ru.job4j.cars.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import ru.job4j.cars.model.AdRepository;
import ru.job4j.cars.model.Model;
import ru.job4j.cars.model.Trademark;

public class ModelServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
     
        
        String stringTrimmed = null;
        try (BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream()))) {
            String encodedJson = br.readLine();
            System.out.println(encodedJson);
            String decodedJson = null;
            decodedJson = URLDecoder.decode(encodedJson, StandardCharsets.UTF_8.name());
           
            stringTrimmed = encodedJson.substring(1, encodedJson.length() - 1);
           
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }
        
        
        
        AdRepository rep = new AdRepository();
        List<Trademark> list = rep.getAllMarks();
        System.out.println(list);
        List<Model> listModels = null;
        for(Trademark elem : list) {
            if (elem.getName().equals(stringTrimmed)) {
                listModels = elem.getModels();
               
          
            }
        }
        ObjectMapper mapper = new ObjectMapper();
        String response = mapper.writeValueAsString(listModels);
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("json");
        resp.getWriter().write(response);
    }
}