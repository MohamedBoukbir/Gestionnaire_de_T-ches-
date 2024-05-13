package services;

import Dao.ICommentaireDao;
import entity.Commentaire;
import entity.User;

import java.util.List;

public class CommentaireDaoImpl  implements ICommentaireDao {
    @Override
    public void save(Commentaire u) {

    }

    @Override
    public List<User> findAll() {
        return List.of();
    }

    @Override
    public Commentaire findById(Long id) {
        return null;
    }

    @Override
    public void update(Commentaire u) {

    }

    @Override
    public void deleteById(Long id) {

    }
}
