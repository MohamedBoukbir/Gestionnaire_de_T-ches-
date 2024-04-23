package servlets;
import Dao.UserDao;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.UserDaoImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    public UserDao userDao ;
    @Override
    public void init() throws ServletException {
        userDao=new UserDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("AdminServlet");
        //request.getRequestDispatcher("Home.jsp").forward(request,response);

        String action = request.getServletPath();
        String at = request.getParameter("action") != null ? request.getParameter("action") : "none";
        System.out.println(action);
        System.out.println(at);
        switch (at) {
           /* case "/AdminServlet":
                showDashboard(request, response);
                break;*/
            case "edit":
                try {
//                    showEditForm(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
//                    deleteUser(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "update":
                try {
//                    updateEtudiant(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "projects":
                try {
//                    showProjects(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            default:

                this.showDashboard(request,response);
                break;
        }

    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<User> listUser = userDao.findAll();
        request.setAttribute("listUser", listUser);
        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Admin/listequipe.jsp");
        requestDispatcher.forward(request,response);
    }
}
