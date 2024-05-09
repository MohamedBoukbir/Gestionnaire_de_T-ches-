package services;

import Dao.IEquipeDao;
import entity.Equipe;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class EquipeDaoImpl implements IEquipeDao {
    private EntityManager entityManager;

    public EquipeDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
    }


    @Override
    public void save(Equipe equipe) {
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        try {
            entityManager.persist(equipe);
            entityTransaction.commit();
        }catch (Exception e){
            e.printStackTrace();
            entityTransaction.rollback();
        }
    }
}
