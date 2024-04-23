package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "GestionnerHomeServlet", value = "/GestionnerHomeServlet")
public class GestionnerHomeServlet extends HttpServlet  {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("GestionnerHomeServlet");
        request.getRequestDispatcher("/Gestionner/listTache.jsp").forward(request,response);

        String action = request.getServletPath();
        System.out.println(action);
        switch (action) {
            case "/":
                showHome(request, response);
                break;
            case "/insert":
                try {
                    insertEtudiant(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
        }
    }

    private void insertEtudiant(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showHome(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listTache.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
