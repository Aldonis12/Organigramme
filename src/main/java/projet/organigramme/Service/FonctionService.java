package projet.organigramme.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projet.organigramme.Model.*;
import projet.organigramme.dao.HibernateDAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;


@Service
public class FonctionService {
    @Autowired
    HibernateDAO dao;

    @Autowired
    SocieteService societeService;

    @PersistenceContext
    private EntityManager entityManager;

    public List<Genre> AllGenre(){
        List<Genre> Liste = dao.findAll(Genre.class);
        return Liste;
    }

    public List<Categorie> AllCategorie(){
        List<Categorie> Liste = dao.findAll(Categorie.class);
        return Liste;
    }

    public ArrayList<String> AllProvince(){
        ArrayList<String> Liste = dao.Province();
        return Liste;
    }

    public String LoginSociete(String mail, String mdp) throws Exception{
        String i = dao.LoginSociete(mail, mdp);
        return i;
    }

    public int LoginEmp(String id) throws Exception{
        int i = dao.LoginEmp(id);
        return i;
    }

    public int IdEmp(String id) throws Exception{
        int i = dao.IdEmp(id);
        return i;
    }

    public void AddDiscussion(int idSociete, int idSender,String message) throws Exception{
        dao.Discussion(idSociete, idSender, message);
    }

    public static String CodeIdentifiant(String nom, int idSociete){
        String VraiNom = nom.replaceAll(" ", "");
        String identifiant = "SCT_"+idSociete+"_"+VraiNom;
        return identifiant;
    }

    public List<Categorie> V_societecateg(int id){
        List<Categorie> ans = dao.V_societecat(id);
        return ans;
    }


    public List<Discussion> Discussion(int idSociete){
        List<Object[]> results = entityManager.createNativeQuery("SELECT * from Msg"+idSociete).getResultList();
        List<Discussion> listDiscu = new ArrayList<>();
        for (Object[] result : results) {
            Discussion ce = new Discussion();
            Employe emp = new Employe();
            emp.setNomEmp(dao.GetNameEmploye((int) result[0]));
            ce.setEmploye(emp);
            ce.setMessage((String) result[1]);
            Timestamp timestamp = ((Timestamp) result[2]);
            ce.setTemps(timestamp);
            listDiscu.add(ce);
        }
        return listDiscu;
    }

    public void AddActualite(int idSociete, String annonce, int types) throws Exception{
        dao.AddActualite(idSociete, annonce, types);
    }

    public List<Actualite> ListActualite(){
        List<Object[]> results = entityManager.createNativeQuery("SELECT * from Actualite order by temps desc").getResultList();
        List<Actualite> actualites = new ArrayList<>();
        for (Object[] result : results) {
            Actualite ce = new Actualite();
            Societe so = new Societe();
            so.setIdSociete((int) result[0]);
            so.setNomSociete(societeService.GetNameSociete((int) result[0]));
            so.setMail(societeService.GetMailSociete((int) result[0]));
            ce.setSociete(so);
            ce.setAnnonce((String) result[1]);
            ce.setTypes((int) result[2]);
            Timestamp temps = (Timestamp) result[3];
            ce.setTemps(GetTempsApres(temps.toLocalDateTime()).toString());
            actualites.add(ce);
        }
        return actualites;
    }

    public static String GetTempsApres(LocalDateTime date) {
        LocalDateTime now = LocalDateTime.now();
        Duration duration = Duration.between(date, now);
        long seconds = duration.getSeconds();
        if (seconds < 60) {
            return "Il y a " + seconds + " secondes";
        } else if (seconds < 3600) {
            long minutes = duration.toMinutes();
            return "Il y a " + minutes + " minutes";
        } else if (seconds < 86400) {
            long hours = duration.toHours();
            return "Il y a " + hours + " heures";
        } else if (seconds < 604800) {
            long days = duration.toDays();
            return "Il y a " + days + " jours";
        } else if (seconds < 2592000) {
            long weeks = duration.toDays() / 7;
            return "Il y a " + weeks + " semaines";
        } else {
            long months = ChronoUnit.MONTHS.between(date, now);
            return "Il y a " + months + " mois";
        }
    }
}
