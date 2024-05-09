package services;

import Dao.IProjectDao;
import entity.Project;
import jakarta.persistence.*;

public class ProjectDaoImpl implements IProjectDao {
    private EntityManager entityManager;
    public ProjectDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
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
}
