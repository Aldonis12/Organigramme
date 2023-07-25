package projet.organigramme.Model;

import projet.organigramme.Service.FonctionService;
import projet.organigramme.dao.HibernateDAO;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;


public class Main {
    private EntityManager entityManager;

    public List<Organigramme> V_orga(int idSociete, int idCategorie){
        List<Object[]> results = entityManager.createNativeQuery("select * from V_orga where idsociete="+idSociete+" and idcateg="+idCategorie).getResultList();
        List<Organigramme> organigrammes = null;
        Organigramme orga = null;
        Employe emp = null;
        Categorie cate = null;
        Societe societe = null;
        for (Object[] result : results) {

            orga = new Organigramme();
            emp = new Employe();
            emp.setNomEmp((String) result[0]);
            emp.setPrenom((String) result[1]);
            orga.setEmploye(emp);

            cate = new Categorie();
            cate.setNomCateg((String) result[2]);
            cate.setIdCateg((int) result[3]);
            orga.setCategorie(cate);

            societe = new Societe();
            societe.setIdSociete((int) result[4]);
            orga.setSociete(societe);

            organigrammes = new ArrayList<>();
            organigrammes.add(orga);
        }
        return organigrammes;
    }

    public static void main(String[] args) throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("Conf.xml");
        HibernateDAO db = context.getBean(HibernateDAO.class);
        db.GetMess(1);
    }
}
