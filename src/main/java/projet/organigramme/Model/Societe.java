package projet.organigramme.Model;

import projet.organigramme.dao.HibernateDAO;

import javax.persistence.*;

@Entity
public class Societe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSociete", nullable = false)
    private int idSociete;

    @Column(name = "nomSociete")
    private String nomSociete = null;

    @Column(name = "lieu")
    private String lieu = null;

    @Column(name = "contact")
    private String contact = null;

    @Column(name = "mail")
    private String mail = null;

    @Column(name = "mdp")
    private String mdp = null;

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    @Column(name = "adresse")
    private String adresse = null;

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public int getIdSociete() {
        return idSociete;
    }

    public void setIdSociete(int idSociete) {
        this.idSociete = idSociete;
    }

    public String getNomSociete() {
        return nomSociete;
    }

    public void setNomSociete(String nomSociete) {
        this.nomSociete = nomSociete;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

}
