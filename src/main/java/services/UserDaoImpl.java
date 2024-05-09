package services;

import Dao.UserDao;
import Util.UserStatus;
import entity.User;
import jakarta.persistence.*;

import java.util.List;

public class UserDaoImpl implements UserDao {
    private EntityManager entityManager;

    public UserDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
         entityManager=entityManagerFactory.createEntityManager();
    }

    @Override
    public void save(User user) {
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        try {
           entityManager.persist(user);
           entityTransaction.commit();
        }catch (Exception e){
          e.printStackTrace();
          entityTransaction.rollback();
        }
    }

    @Override
    public List<User> findAll() {
//        Query query1 =entityManager.createQuery("select u from User u where u.name like:x");
//        query1.setParameter("x","%"+mc+"%");
        Query query =entityManager.createQuery("select u from User u where u.role != :x");
        query.setParameter("x","Admin");
        return query.getResultList();
    }
    public List<User> findGestionners(){
        Query query =entityManager.createQuery("select u from User u where u.role = :x");
        query.setParameter("x","Gestionner");
        return query.getResultList();
    }
    public List<User> findUsers(){
        Query query =entityManager.createQuery("select u from User u where u.role = :x");
        query.setParameter("x","User");
        return query.getResultList();
    }
    @Override
    public User findById(Long id) {
          User u =entityManager.find(User.class,id);
        return u;
    }

    @Override
    public void update(User u) {
        entityManager.merge(u);

    }

    @Override
    public void deleteById(Long id) {
        entityManager.getTransaction().begin();
       User u =entityManager.find(User.class,id);
       entityManager.remove(u);
        entityManager.getTransaction().commit();
    }
    @Override
    public void enableUser(Long id) {
        entityManager.getTransaction().begin();
        User u =entityManager.find(User.class,id);
        if (u.getUserStatus()== UserStatus.ENABLED){
            u.setUserStatus(UserStatus.DISABLED);
        }else{
            u.setUserStatus(UserStatus.ENABLED);
        }
        entityManager.getTransaction().commit();
    }
}
