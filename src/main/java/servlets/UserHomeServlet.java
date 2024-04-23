package servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserHomeServlet", value = "/UserHomeServlet")
public class UserHomeServlet  extends HttpServlet  {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("userhomeservlet");
        request.getRequestDispatcher("/User/listTache.jsp").forward(request,response);

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
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/User/listTache.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
