package entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Tache {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String titretache;
    private String dateaffectation;
    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "projet_id")
    private Project project;
    @ManyToOne
    @JoinColumn(name = "membre_equipe_id")
    private User membreEquipe;
    @OneToMany(mappedBy = "commentaires")
    private List<Commentaire> commentaires = new ArrayList<>();



    public User getMembreEquipe() {
        return membreEquipe;
    }

    public void setMembreEquipe(User membreEquipe) {
        this.membreEquipe = membreEquipe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Tache() {
    }

    public Tache(String titretache, String dateaffectation) {
        this.titretache = titretache;
        this.dateaffectation = dateaffectation;
    }

    public String getTitretache() {
        return titretache;
    }

    public void setTitretache(String titretache) {
        this.titretache = titretache;
    }

    public String getDateaffectation() {
        return dateaffectation;
    }

    public void setDateaffectation(String dateaffectation) {
        this.dateaffectation = dateaffectation;
    }
}
