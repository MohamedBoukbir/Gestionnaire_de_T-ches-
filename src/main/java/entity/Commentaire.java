package entity;

import jakarta.persistence.*;
@Entity
public class Commentaire {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private  String contenu_cm;
    private String  date_cm;
    @ManyToOne(targetEntity = Tache.class)
    @JoinColumn(name = "tache_id")
    private Tache tache;
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id")
    private User user;

    public Commentaire() {
    }
    public Commentaire(String contenu_cm, String date_cm) {
        this.contenu_cm = contenu_cm;
        this.date_cm = date_cm;
    }
}
