package projet.organigramme.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projet.organigramme.Model.Employe;
import projet.organigramme.Model.Genre;
import projet.organigramme.Model.Societe;
import projet.organigramme.dao.HibernateDAO;

import java.util.List;

@Service
public class SocieteService {
    @Autowired
    HibernateDAO dao;

    public void AddSociete(String nom, String lieu, String contact,String adresse, String mail, String mdp) throws Exception{
        dao.AddSociete(nom, lieu, contact,adresse, mail, mdp);
    }

    public int LastSociete() throws Exception{
        int i = dao.GetLastSociete();
        return i;
    }

    public void AddPosteSociete(int idSociete, int idCateg) throws Exception{
        dao.AddPosteSociete(idSociete, idCateg);
    }

    public List<Societe> UniqueSociete(String mail){
        Societe societe = new Societe();
        societe.setMail(mail);
        List<Societe> Liste = dao.findWhere(societe);
        return Liste;
    }

    public List<Societe> AllSociete(){
        List<Societe> liste = dao.findAll(Societe.class);
        return liste;
    }
    public String GetNamecategorie(int idCateg){
        String nom = dao.GetNamecategorie(idCateg);
        return nom;
    }

    public String GetNameSociete(int idSociete){
        String nom = dao.GetNameSociete(idSociete);
        return nom;
    }

    public String GetMailSociete(int idSociete){
        String nom = dao.GetMailSociete(idSociete);
        return nom;
    }

}
