package entity;

import Util.UserStatus;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.*;
import java.time.LocalDate;
@Entity
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id ;
    private String firstname;
    private String lastname;
    private String phoneNumber;
    @Temporal(TemporalType.DATE)
    private LocalDate datebirth;
    private String profession;
    private String email ;
    private String password;
    private String role;
    @Column(columnDefinition = "ENUM('ENABLED','DISABLED')")
    @Enumerated(EnumType.STRING)
    private UserStatus userStatus ;
    @ManyToOne(targetEntity = Equipe.class)
    @JoinColumn(name = "equipe_id")
    private Equipe equipe;

    @ManyToOne(targetEntity = Equipe.class)
    @JoinColumn(name = "equipe_en_charge_id")
    private Equipe equipeEnCharge;

    public User(String firstname, String lastname,LocalDate datebirth,String phoneNumber , String profession, String email, String password, String role) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.datebirth = datebirth;
        this.phoneNumber = phoneNumber;
        this.profession =profession;
        this.email = email;
        this.password = password;
        this.role = role;
        this.userStatus = UserStatus.ENABLED;
    }
    public Long getId() {
        return id;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public LocalDate getDatebirth() {
        return datebirth;
    }

    public void setDatebirth(LocalDate datebirth) {
        this.datebirth = datebirth;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public User() {
    }

    public UserStatus getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(UserStatus userStatus) {
        this.userStatus = userStatus;
    }

    public String getinitial(String firstname , String lastname){
        return String.valueOf(firstname.toUpperCase().charAt(0)) + lastname.toUpperCase().charAt(0);
    }
    public Equipe getEquipeEnCharge() {
        return equipeEnCharge;
    }

    public void setEquipeEnCharge(Equipe equipeEnCharge) {
        this.equipeEnCharge = equipeEnCharge;
    }

}
