//package servlets;
//
//import Dao.IProjectDao;
//import Dao.UserDao;
//import Exeptions.UserEmalExistsExeption;
//import entity.Project;
//import entity.User;
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import services.ProjectDaoImpl;
//import services.UserDaoImpl;
//
//import java.io.IOException;
//import java.time.LocalDate;
//import java.time.format.DateTimeFormatter;
//@WebServlet(name = "ProjectServlet", value = "/ProjectServlet")
//public class ProjectServlet extends HttpServlet {
//
//        ProjectDaoImpl projectDao;
//        @Override
//        public void init() throws ServletException {
//             projectDao =new ProjectDaoImpl();
//        }
//        @Override
//        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            response.sendRedirect("listProjet.jsp");
//
//        }
//
//        @Override
//        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            String name = request.getParameter("name");
//            String datep = request.getParameter("datep");
//            String description = request.getParameter("description");
//            // Converting Text To LocalDate
////            String inputDate =request.getParameter("datep");
////            DateTimeFormatter parser = DateTimeFormatter.ofPattern("dd/MM/yyyy");
////            String datep = LocalDate.parse(inputDate, parser);
//            // End
//
//            try {
//                Project project=new Project(name,datep,description);
//                projectDao.save(project);
//                response.sendRedirect("ProjectServlet");
//            }catch (UserEmalExistsExeption emalExistsExeption){
//                request.setAttribute("error",emalExistsExeption.getMessage());
//                RequestDispatcher requestDispatcher = request.getRequestDispatcher("listProjet.jsp");
//                requestDispatcher.forward(request,response);
//
//            }
//        }
//    }
//
//
