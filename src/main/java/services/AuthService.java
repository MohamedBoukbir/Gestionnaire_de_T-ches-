package services;

import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.*;
import Util.UserStatus;

public class AuthService {
    EntityManager entityManager;
    public AuthService() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
    }

    public String auhenticate(String email , String password){
        try {
            Query query =entityManager.createQuery("select u from User u where u.email = :x and u.password = :y");
            query.setParameter("x",email);
            query.setParameter("y",password);
            User user = (User) query.getSingleResult();
            System.out.println(user.getFirstname());

            if ((user!=null) && (user.getUserStatus()== UserStatus.ENABLED)){
                if(user.getRole().equals("Admin")) {
                    return "Admin";
                } else if (user.getRole().equals("User")) {
                    return "User";
                }else if (user.getRole().equals("Gestionner")) {
                    return "Gestionner";
                }

            }else {
                return "Your account has been Blocked";

            }

        }catch (NoResultException resultException){
            return "Invalid user credentials";
        }
        return email;
    }
}
