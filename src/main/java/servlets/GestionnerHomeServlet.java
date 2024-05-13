
 package servlets;
import Dao.UserDao;
import Exeptions.UserEmalExistsExeption;
import entity.Equipe;
import entity.Project;
import entity.Tache;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.EquipeDaoImpl;
import services.ProjectDaoImpl;
import services.TacheDaoImpl;
import services.UserDaoImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
@WebServlet(name = "GestionnerHomeServlet", value = "/GestionnerHomeServlet")
public class GestionnerHomeServlet extends HttpServlet {
    ProjectDaoImpl projectDao;
    EquipeDaoImpl equipeDao;
    UserDaoImpl userDao;
    TacheDaoImpl taskDao;

    @Override
    public void init() throws ServletException {
        projectDao = new ProjectDaoImpl();
        userDao = new UserDaoImpl();
        equipeDao=new EquipeDaoImpl();
        taskDao=new TacheDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("GestionnerHomeServlet");
        //request.getRequestDispatcher("Home.jsp").forward(request,response);

        String action = request.getServletPath();
        String at = request.getParameter("action") != null ? request.getParameter("action") : "none";
        System.out.println(action);
        System.out.println("art=" + at);

        switch (at) {
            case "addProject":
                try {
                    System.out.println("add project");
                    addProject(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
                    System.out.println("delete swich");
                    delete(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "listProjet":
                try {
                    listProjet(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "addMemberToTeam":
                try {
                    addMemberToTeam(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "addTask":
                try {
                    addTask(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "listTache":
                try {
                    listTache(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "listequipe":
                try {
                    listequipe(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "profileGestionner":
                try {
                    profileGestionner(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "profile":
                try {
                    System.out.println("profile swich");
                    profile(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;

            default:

                this.showDashboard(request, response);
                break;
        }

    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Project> listProject = projectDao.findAll();
        request.setAttribute("listProject", listProject);
        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listProjet.jsp");
        requestDispatcher.forward(request, response);
    }
    private void listequipe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("profile");
            if (user != null && user.getEquipeEnCharge() != null) {
                Equipe equipe = user.getEquipeEnCharge();
                List<User> membresEquipe = userDao.findMembresEquipe(equipe);
                request.setAttribute("membresEquipe", membresEquipe);
                List<User> allUsers = userDao.findUsersNotMembres();
                request.setAttribute("allUsers", allUsers);
        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listequipe.jsp");
        requestDispatcher.forward(request, response);
    }
        }
    }

    private void addProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        System.out.println("add project");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String inputDate = request.getParameter("datep");
        DateTimeFormatter parser = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate datep = LocalDate.parse(inputDate, parser);

        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("profile");
            if (user != null && user.getEquipeEnCharge() != null) {
                Equipe equipe = user.getEquipeEnCharge();

                try {
                    Project project = new Project(name, datep, description);
                    project.setEquipe(equipe); // Associer l'équipe du gestionnaire au projet
                    projectDao.save(project);
                    response.sendRedirect("GestionnerHomeServlet");
                } catch (UserEmalExistsExeption emalExistsExeption) {
                    request.setAttribute("error", emalExistsExeption.getMessage());
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("listProjet.jsp");
                    requestDispatcher.forward(request, response);
                }
            } else {
                System.out.println("L'utilisateur n'est pas associé à une équipe ou n'est pas un gestionnaire.");
                // Gérer le cas où l'utilisateur n'est pas associé à une équipe ou n'est pas un gestionnaire
            }
        } else {
            System.out.println("Session non trouvée.");
            // Gérer le cas où la session n'est pas trouvée
        }
    }


    private void listProjet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("list projects");
        List<Project> allprojects = projectDao.findAll();
        request.setAttribute("allprojects", allprojects);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listProjet.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("post");
        doGet(request, response); // Réutiliser la méthode doGet pour gérer les demandes POST
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        projectDao.deleteById(id);
        response.sendRedirect("GestionnerHomeServlet");
    }
    private void addMemberToTeam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("user");
        HttpSession session = request.getSession(false);
        System.out.println("userId=" + userId);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");

            // Vérifier si l'utilisateur existe dans la session et s'il appartient à une équipe
            if (user != null && user.getEquipeEnCharge() != null) {
                // Récupérer l'ID de l'équipe du gestionnaire connecté
                Long equipeId = user.getEquipeEnCharge().getId();
                System.out.println("equipeId=" + equipeId);

                try {
                    if (userId != null && !userId.isEmpty()) {
                        Long id = Long.parseLong(userId);
                        User selectedUser = userDao.findById(id);
                        Equipe equipe = equipeDao.findById(equipeId);
                        if (selectedUser != null && equipe != null) {
                            equipe.ajouterUtilisateur(selectedUser);
                            userDao.updateEquipe(equipe); // Mettre à jour l'équipe
                        }
                    } else {
                        System.out.println("userId vide");
                    }
                    response.sendRedirect("GestionnerHomeServlet?action=listequipe"); // Redirection vers la liste
                } catch (NumberFormatException e) {
                    System.out.println("Format de l'ID de l'utilisateur invalide : " + e.getMessage());
                    e.printStackTrace();
                } catch (Exception e) {
                    // Gérer les autres erreurs
                    e.printStackTrace();
                }
            } else {
                System.out.println("Utilisateur ou équipe non trouvés");
            }
        } else {
            System.out.println("Session non trouvée");
        }
    }




    public void ajouterUtilisateurALaEquipe(User gestionnaire, User utilisateur) {
        Equipe equipeDuGestionnaire = gestionnaire.getEquipeEnCharge();

        if (equipeDuGestionnaire != null) {
            equipeDuGestionnaire.ajouterUtilisateur(utilisateur);
            userDao.updateEquipe(equipeDuGestionnaire); // userDao est une instance de UserDaoImpl injectée ou initialisée
        } else {
            System.out.println("Le gestionnaire n'est associé à aucune équipe.");
        }
    }
    private void addTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdStr = request.getParameter("projectId");
        String titretache = request.getParameter("titretache");
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String dateaffectation = currentDate.format(formatter);
        request.setAttribute("dateaffectation", dateaffectation);

        String membreEquipeIdStr = request.getParameter("membreEquipeId"); // Obtenir l'ID du membre de l'équipe depuis la requête

        if (projectIdStr != null && !projectIdStr.isEmpty() && titretache != null && !titretache.isEmpty() && membreEquipeIdStr != null && !membreEquipeIdStr.isEmpty()) {
            try {
                Long projectId = Long.parseLong(projectIdStr);
                Long membreEquipeId = Long.parseLong(membreEquipeIdStr); // Convertir l'ID du membre de l'équipe en Long

                // Récupérer le projet et le membre de l'équipe à partir de leur ID
                Project project = projectDao.findById(projectId);
                User membreEquipe = userDao.findById(membreEquipeId);

                if (project != null && membreEquipe != null) {
                    Tache task = new Tache(titretache, dateaffectation);
                    task.setProject(project);
                    task.setMembreEquipe(membreEquipe);
                    taskDao.save(task);
                    response.sendRedirect("GestionnerHomeServlet?action=listTache"); // Redirection vers la liste
                }
            } catch (NumberFormatException e) {
                // Gérer les erreurs de conversion des ID en nombre
            } catch (Exception e) {
                // Gérer les autres exceptions
            }
        } else {
            // Gérer le cas où des paramètres sont manquants
        }
    }

    private void listTache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Project> projects = projectDao.findAll();
        // Passer la liste des projets comme un attribut de requête
        request.setAttribute("projects", projects);
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("profile");
        Equipe equipe = user.getEquipeEnCharge();
        List<User> membresEquipe = userDao.findMembresEquipe(equipe);

        // Stocker la liste des membres de l'équipe comme un attribut de la requête
        request.setAttribute("membresEquipe", membresEquipe);
        List<Tache> alltache = taskDao.findAll();
        request.setAttribute("alltache", alltache);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listTache.jsp");
        requestDispatcher.forward(request, response);

        }
    private void profileGestionner(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
        profile(request, response);
    }
    private void profile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            request.setAttribute("user", user);
            System.out.println(user.getFirstname());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/profileGestionner.jsp");
            requestDispatcher.forward(request,response);
        }else{
            response.sendRedirect("GestionnerHomeServlet");
        }

    }


}

