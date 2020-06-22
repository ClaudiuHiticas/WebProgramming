package webapp.servlet;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import jdk.nashorn.internal.parser.JSONParser;
import webapp.model.Asset;
import webapp.model.AssetList;
import webapp.repository.AssetsRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "Assets", urlPatterns = {"/servlet/assets"})
public class Assets extends HttpServlet {
    private AssetsRepository assetsRepository;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String json = request.getParameter("data");
        List<Asset> assets = new ObjectMapper().readValue(json, new TypeReference<List<Asset>>() {});


//        JsonParser jsonParser = new JsonParser();
//        JsonElement element = jsonParser.parse(json);
//        JsonArray array = element.getAsJsonArray();
//        Gson g = new Gson();
//        ArrayList<Asset> assets = new ArrayList<>();
//        array.forEach(el -> {
//        });
        assetsRepository.addMany(assets);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id").split("\n")[0]);
        this.assetsRepository = new AssetsRepository(id);
        ArrayList<Asset> assets = assetsRepository.findAll();
        String json = new Gson().toJson(assets);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
