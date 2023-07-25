package projet.organigramme.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projet.organigramme.Model.*;
import projet.organigramme.dao.HibernateDAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class EmployeService {

    @Autowired
    HibernateDAO dao;

    @PersistenceContext
    private EntityManager entityManager;

    public void AjoutEmp(Employe employe) throws Exception{
        dao.create(employe);
    }

    public List<CategEmploye> V_employe(int id){
        List<Object[]> results = entityManager.createNativeQuery("SELECT * from V_employe where idsociete="+id+" order by idcategorie").getResultList();
        List<CategEmploye> Categemployes = new ArrayList<>();
        for (Object[] result : results) {
            CategEmploye ce = new CategEmploye();
            ce.setIdEmp((int) result[0]);
            ce.setNomEmp((String) result[1]);
            ce.setPrenom((String) result[2]);
            ce.setDtn((Date) result[3]);
            Genre g = new Genre();
            g.setIdGenre((int) result[4]);
            ce.setGenre(g);

            ce.setContact((String) result[5]);
            ce.setAdresse((String) result[6]);
            Categorie categorie = new Categorie();
            categorie.setIdCateg((int) result[8]);
            ce.setIdCategorie(categorie);
            Societe societe = new Societe();
            societe.setIdSociete((int) result[9]);
            ce.setIdSociete(societe);
            ce.setIdentifiant((String) result[10]);
            Categemployes.add(ce);
        }
        return Categemployes;
    }

    public int LastEmploye() throws Exception{
        int i = dao.GetLastEmploye();
        return i;
    }

    public void AddEmployeCateg(int idemploye, int idSociete, int idCateg) throws Exception{
        String nom = dao.GetNameEmploye(idemploye);
        String identifiant = FonctionService.CodeIdentifiant(nom,idSociete);
        dao.AddEmployeCateg(idemploye, idSociete, idCateg, identifiant);
    }

    public List<Organigramme> V_orga(int idSociete, int idCategorie){
        List<Object[]> results = entityManager.createNativeQuery("select * from V_orga where idsociete="+idSociete+" and idcateg="+idCategorie).getResultList();
        List<Organigramme> organigrammes = new ArrayList<>();
        for (Object[] result : results) {

            Organigramme orga = new Organigramme();
            Employe emp = new Employe();
            emp.setNomEmp((String) result[0]);
            emp.setPrenom((String) result[1]);
            emp.setIdEmp((int) result[5]);
            orga.setEmploye(emp);

            Categorie cate = new Categorie();
            cate.setNomCateg((String) result[2]);
            cate.setIdCateg((int) result[3]);
            orga.setCategorie(cate);

            Societe societe = new Societe();
            societe.setIdSociete((int) result[4]);
            orga.setSociete(societe);

            organigrammes.add(orga);
        }
        return organigrammes;
    }
}
