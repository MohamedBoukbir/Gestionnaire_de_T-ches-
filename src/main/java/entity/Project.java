package entity;

import jakarta.persistence.*;

@Entity
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id ;
    private String name;
    @ManyToOne(targetEntity = Equipe.class)
    @JoinColumn(name = "equipe_id")
    private Equipe equipep;

    public Project(String name) {
        this.name = name;
    }
    public Project() {

    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Equipe getEquipe() {
        return equipep;
    }

    public void setEquipe(Equipe equipe) {
        this.equipep = equipe;
    }
}
