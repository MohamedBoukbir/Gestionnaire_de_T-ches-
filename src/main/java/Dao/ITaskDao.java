package Dao;



import entity.Project;
import entity.Tache;

import java.util.List;

public interface ITaskDao {
    public void save(Tache t, Project p);
    public List<Tache> findAll();
    public void deleteById(Long id);
}
