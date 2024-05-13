package entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Equipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id ;
    private String name;
    @OneToMany(mappedBy = "equipe")
    private List<User> userList = new ArrayList<>();
    @OneToMany(mappedBy = "equipep")
    private List<Project> projectList = new ArrayList<>();
    @OneToOne
    @JoinColumn(name = "chef_equipe_id")
    private User chefEquipe;
    public Equipe(String name, User chefEquipe) {

        this.name = name;
        this.chefEquipe = chefEquipe;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Equipe() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
    }
    public User getChefEquipe() {
        return chefEquipe;
    }

    public void setChefEquipe(User chefEquipe) {
        this.chefEquipe = chefEquipe;
    }

    public void ajouterUtilisateur(User utilisateur) {
        userList.add(utilisateur);
        utilisateur.setEquipe(this);
    }

}
