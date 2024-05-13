package services;

import Dao.IProjectDao;
import entity.Project;
import entity.User;
import jakarta.persistence.*;

import java.util.List;

public class ProjectDaoImpl implements IProjectDao {
    private EntityManager entityManager;
    public ProjectDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
    }
    //        Query query1 =entityManager.createQuery("select u from User u where u.name like:x");
    //        query1.setParameter("x","%"+mc+"%");
    @Override
    public List<Project> findAll() {
        Query query = entityManager.createQuery("select p from Project p");
        List<Project> projects = query.getResultList();
//        for (Project project : projects) {
//            System.out.println("Project Name: " + project.getName());
//            System.out.println("Date Creation: " + project.getDatep());
//            System.out.println("Description: " + project.getDescription());
//        }
        return projects;
    }
    @Override
    public void save(Project p) {
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        try {
            entityManager.persist(p);
            entityTransaction.commit();
        }catch (Exception e){
            e.printStackTrace();
            entityTransaction.rollback();
        }
    }
    public void updateproject(Project project) {
        entityManager.getTransaction().begin();
        entityManager.merge(project);
        entityManager.getTransaction().commit();
    }
    @Override
    public void deleteById(Long id) {
        entityManager.getTransaction().begin();
        Project p =entityManager.find(Project.class,id);
        entityManager.remove(p);
        entityManager.getTransaction().commit();
    }
    @Override
    public Project findById(Long id) {
        Project p =entityManager.find(Project.class,id);
        return p;
    }
}
