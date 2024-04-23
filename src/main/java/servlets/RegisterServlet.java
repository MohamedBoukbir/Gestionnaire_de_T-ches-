package servlets;
import Dao.UserDao;
import Exeptions.UserEmalExistsExeption;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.UserDaoImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet  extends HttpServlet {
    UserDao userDao;
    @Override
    public void init() throws ServletException {
        userDao=new UserDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fisrtname = request.getParameter("fisrtname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        // Converting Text To LocalDate
        String inputDate =request.getParameter("datebirth");
        DateTimeFormatter parser = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate datebirth = LocalDate.parse(inputDate, parser);
        // End

        String phonenumber = request.getParameter("phonenumber");
        String proffesion =  request.getParameter("proffesion");
        try {
            User user = new User(fisrtname,lastname,datebirth,phonenumber,proffesion,email,password,"User");
            userDao.save(user);
            response.sendRedirect("LoginServlet");
        }catch (UserEmalExistsExeption emalExistsExeption){
            request.setAttribute("error",emalExistsExeption.getMessage());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
            requestDispatcher.forward(request,response);

        }
    }
}
