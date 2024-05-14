package servlets;
import Dao.IEquipeDao;
import Dao.UserDao;
import entity.Tache;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.EquipeDaoImpl;
import services.TacheDaoImpl;
import services.UserDaoImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserHomeServlet", value = "/UserHomeServlet")
public class UserHomeServlet  extends HttpServlet  {
    public UserDao userDao ;
    public TacheDaoImpl taskDao;
    @Override
    public void init() throws ServletException {
        userDao=new UserDaoImpl();
        taskDao=new TacheDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("userhomeservlet");
        String action = request.getServletPath();
        String at = request.getParameter("action") != null ? request.getParameter("action") : "none";
        System.out.println("A:"+at);
        switch (at) {
            case "/":
                showHome(request, response);
                break;
            case "listTache":
                try {
                    listTache(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "profileUser":
                try {
                    System.out.println("profile swich");
                    profileUser(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "updateprofileUser":
                try {
                    System.out.println("updateprofile swich");
                    System.out.println(request.getParameter("phonenumber"));
                    updateprofileUser(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            default:

                this.showHome(request, response);
                break;
        }
    }


    private void showHome(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/User/listTache.jsp");
        requestDispatcher.forward(request,response);
    }
    private void listTache(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        System.out.println("list tache");
//        List<Tache> tacheList = taskDao.findAllTask();
        List<User> allusers = userDao.findAll();
        List<User> users = userDao.findUsers();
        int allUsersCount = allusers.size();
        request.setAttribute("allUsersCount", allUsersCount);
        request.setAttribute("allusers", allusers);


        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Admin/listeUsers.jsp");
        requestDispatcher.forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void profileUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            request.setAttribute("user", user);
            System.out.println(user.getFirstname());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/User/profileUser.jsp");
            requestDispatcher.forward(request,response);
        }else{
            response.sendRedirect("UserHomeServlet");
        }

    }

    private void updateprofileUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            String phonenumber = request.getParameter("phonenumber");
            String profession = request.getParameter("profession");
            String current_password = request.getParameter("current_password");
            String password_confirmation = request.getParameter("password_confirmation");
            String password = request.getParameter("password");

            if (phonenumber != null && profession != null && current_password != null && password_confirmation != null && password != null &&
                    !phonenumber.isEmpty() && !profession.isEmpty() && !current_password.isEmpty() && !password_confirmation.isEmpty() && !password.isEmpty()) {
                if (!user.getPassword().equals(current_password)) {
                    String erroremailcurrent = "Le mot de passe actuel est incorrect.";
                    request.setAttribute("erroremailcurrent", erroremailcurrent);
                } else if (!password.equals(password_confirmation)) {
                    String erroremailconfir = "Les mots de passe ne correspondent pas.";
                    request.setAttribute("erroremailconfir", erroremailconfir);
                } else {
                    user.setPassword(password);
                    user.setProfession(profession);
                    user.setPhoneNumber(phonenumber);
                    userDao.update(user);
                }
            } else {
                String error = "Veuillez remplir tous les champs.";
                request.setAttribute("error", error);
            }
        } else {
            String error = "Session introuvable.";
            request.setAttribute("error", error);
        }
        profileUser(request, response);
    }
}
