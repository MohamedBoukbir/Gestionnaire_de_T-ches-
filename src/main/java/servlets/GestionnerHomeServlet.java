
 package servlets;
import Dao.UserDao;
import Exeptions.UserEmalExistsExeption;
import entity.Project;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.ProjectDaoImpl;
import services.UserDaoImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
@WebServlet(name = "GestionnerHomeServlet", value = "/GestionnerHomeServlet")
public class GestionnerHomeServlet extends HttpServlet  {
        ProjectDaoImpl projectDao;
        @Override
        public void init() throws ServletException {
            projectDao=new ProjectDaoImpl();
        }
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            System.out.println("GestionnerHomeServlet");
            //request.getRequestDispatcher("Home.jsp").forward(request,response);

            String action = request.getServletPath();
            String at = request.getParameter("action") != null ? request.getParameter("action") : "none";
            System.out.println(action);
            System.out.println("art=" +at);

            switch (at) {
           /* case "/AdminServlet":
                showDashboard(request, response);
                break;*/
                case "addProject":
                    try {
                        System.out.println("add project");
                        addProject(request, response);
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
                case "listProjet":
                    try {
                        listProjet(request,response);
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

            List<Project> listProject= projectDao.findAll();
            request.setAttribute("listProject", listProject);
            //RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listProjet.jsp");
            requestDispatcher.forward(request,response);
        }

        private void addProject(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException, SQLException {
            System.out.println("add project");
            String name = request.getParameter("name");
            String datep = request.getParameter("datep");
            String description = request.getParameter("description");
            System.out.println(name + " " + datep + " " + description);
            // Converting Text To LocalDate
//            String inputDate =request.getParameter("datep");
//            DateTimeFormatter parser = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//            LocalDate datep = LocalDate.parse(inputDate, parser);
            // End

            try {
                Project project=new Project(name,datep,description);
                projectDao.save(project);
                response.sendRedirect("GestionnerHomeServlet");
            }catch (UserEmalExistsExeption emalExistsExeption){
                request.setAttribute("error",emalExistsExeption.getMessage());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("listProjet.jsp");
                requestDispatcher.forward(request,response);

            }
        }

        private void listProjet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
            System.out.println("list projects");
            List<Project> allprojects = projectDao.findAll();
            for (Project project : allprojects) {
                System.out.println("P: " + project.getName());
                System.out.println("D: " + project.getDatep());
                System.out.println("D: " + project.getDescription());
            }
            request.setAttribute("allprojects", allprojects);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listProjet.jsp");
            requestDispatcher.forward(request, response);
        }
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            System.out.println("post");
            doGet(request, response); // Réutiliser la méthode doGet pour gérer les demandes POST
        }
        private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Long id = Long.parseLong(request.getParameter("id"));
            projectDao.deleteById(id);
            response.sendRedirect("GestionnerHomeServlet");
        }

    }

