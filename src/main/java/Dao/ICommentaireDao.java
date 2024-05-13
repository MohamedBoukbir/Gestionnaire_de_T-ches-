package Dao;

import entity.Commentaire;
import entity.User;

import java.util.List;

public interface ICommentaireDao {
    public void save(Commentaire u);
    public List<User> findAll();
    public Commentaire findById(Long id);
    public void update(Commentaire u) ;
    public void deleteById(Long id);
}
