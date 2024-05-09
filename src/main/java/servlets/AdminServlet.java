package servlets;
import Dao.UserDao;
import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.UserDaoImpl;

import java.io.IOException;
import java.sql.SQLException;
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
        System.out.println("art=" +at);

        System.out.println(request.getParameter("user_id"));
        switch (at) {
           /* case "/AdminServlet":
                showDashboard(request, response);
                break;*/
            case "addGestionner":
                try {
                    System.out.println("switch addGestionner");
                    System.out.println(request.getParameter("user_id"));
                   addGestionner(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
                    System.out.println("delete swich");
                    deleteUser(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "enable":
                try {
                    System.out.println("enable swich");
                    enableUser(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "profile":
                try {
                    System.out.println("profile swich");
                    profileAdmin(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "listUsers":
                try {
                    listUsers(request,response);
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
    private void profileAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            request.setAttribute("user", user);
            System.out.println(user.getFirstname());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Admin/profileAdmin.jsp");
            requestDispatcher.forward(request,response);
        }else{
            response.sendRedirect("AdminServlet");
        }

    }


    private void addGestionner(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException, SQLException {
        System.out.println("add controller");
        System.out.println(request.getParameter("user_id"));
        System.out.println(request.getParameter("user_id"));
        Long id = Long.parseLong(request.getParameter("user_id"));
        System.out.println(id);
//        User user =userDao.findById(id);
//        user.setRole("Gestionner");
//        System.out.println(user);
//        userDao.update(user);
        // Passez le contrôle au JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/listeUsers.jsp");
        dispatcher.forward(request, response);

    }
    private void listUsers(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        System.out.println("list gestionner");
        List<User> listgestionners = userDao.findGestionners();
        List<User> allusers = userDao.findAll();
        List<User> users = userDao.findUsers();

        request.setAttribute("allusers", allusers);
        request.setAttribute("users", users);
        request.setAttribute("listgestionners", listgestionners);

//        for (User user : listgestionners) { // "User" est le type d'élément, "user" est le nom de la variable de boucle
//            System.out.println("Prénom : " + user.getFirstname());
//            System.out.println("Nom : " + user.getLastname());
//        }
        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Admin/listeUsers.jsp");
        requestDispatcher.forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       System.out.println("post");
        System.out.println(request.getParameter("user_id"));
        doGet(request, response); // Réutiliser la méthode doGet pour gérer les demandes POST
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        userDao.deleteById(id);
        response.sendRedirect("AdminServlet");
    }
    private void enableUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        System.out.println("enable function");
        userDao.enableUser(id);
        response.sendRedirect("AdminServlet?action=listUsers");
    }
}
