
package projet.organigramme.dao;

import org.hibernate.*;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import projet.organigramme.Model.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class HibernateDAO {

    private SessionFactory sessionFactory;
    public void AddActualite(int idSociete, String annonce, int types){
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            String sql = "insert into Actualite(idSociete,annonce,types) values (:idSociete, :annonce, :types)";
            Query query = session.createNativeQuery(sql);
            query.setParameter("idSociete", idSociete);
            query.setParameter("annonce", annonce);
            query.setParameter("types", types);
            query.executeUpdate();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
    }

    public List<Integer> V_societecateg(int id){
        Session session = sessionFactory.openSession();
        String sql = "select distinct idcateg from V_societecateg where idsociete="+id+" order by idcateg";
        List<Integer> ans = session.createSQLQuery(sql).list();
        return ans;
    }

    public List<Categorie> V_societecat(int id){
        List<Categorie> categ = new ArrayList<>();
        for(Integer i : this.V_societecateg(id)){
            categ.add(this.findById(Categorie.class, i));
        }
        return categ;
    }

    public void Discussion(int idSociete, int idSender, String message){
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            String sql = "insert into Msg"+idSociete+" values (:idSender, :message)";
            Query query = session.createNativeQuery(sql);
            query.setParameter("idSender", idSender);
            query.setParameter("message", message);
            query.executeUpdate();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
    }
    public int LoginEmp(String identifiant){
        Session session = sessionFactory.openSession();
        String sql = "select idsociete from categemploye where identifiant ='"+identifiant+"'";
        Query query = session.createSQLQuery(sql);
        int ans = (int) query.uniqueResult();
        return ans;
    }

    public int IdEmp(String identifiant){
        Session session = sessionFactory.openSession();
        String sql = "select idemploye from categemploye where identifiant ='"+identifiant+"'";
        Query query = session.createSQLQuery(sql);
        int ans = (int) query.uniqueResult();
        return ans;
    }

    public String GetNamecategorie(int id){
        Session session = sessionFactory.openSession();
        String sql = "select nomcateg from Categorie where idcateg="+id;
        Query query = session.createSQLQuery(sql);
        String ans = (String) query.uniqueResult();
        return ans;
    }
    public String GetNameSociete(int id){
        Session session = sessionFactory.openSession();
        String sql = "select nomsociete from Societe where idsociete="+id;
        Query query = session.createSQLQuery(sql);
        String ans = (String) query.uniqueResult();
        return ans;
    }

    public String GetMailSociete(int id){
        Session session = sessionFactory.openSession();
        String sql = "select mail from Societe where idsociete="+id;
        Query query = session.createSQLQuery(sql);
        String ans = (String) query.uniqueResult();
        return ans;
    }
    public String GetNameEmploye(int id){
        Session session = sessionFactory.openSession();
        String sql = "select nomemp from employe where idemp="+id;
        Query query = session.createSQLQuery(sql);
        String ans = (String) query.uniqueResult();
        return ans;
    }

    public void AddEmployeCateg(int idemploye, int idSociete, int idCateg, String identifiant){
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            String sql = "insert into categemploye values (:idemploye, :idCateg, :idSociete, :identifiant)";
            Query query = session.createNativeQuery(sql);
            query.setParameter("idemploye", idemploye);
            query.setParameter("idSociete", idSociete);
            query.setParameter("idCateg", idCateg);
            query.setParameter("identifiant", identifiant);
            query.executeUpdate();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
    }

    public int GetLastEmploye(){
        Session session = sessionFactory.openSession();
        String sql = "SELECT idemp FROM employe ORDER BY idemp DESC LIMIT 1 ";
        Query query = session.createSQLQuery(sql);
        int ans = (int) query.uniqueResult();
        return ans;
    }
    public String LoginSociete(String email, String mdp){
        Session session = sessionFactory.openSession();
        String sql = "SELECT mail FROM Societe where mail ='"+email+"' and mdp =  md5('"+mdp+"')";
        Query query = session.createSQLQuery(sql);
        String ans = (String) query.uniqueResult();
        return ans;
    }
    public int GetLastSociete(){
        Session session = sessionFactory.openSession();
        String sql = "SELECT idSociete FROM Societe ORDER BY idSociete DESC LIMIT 1 ";
        Query query = session.createSQLQuery(sql);
        int ans = (int) query.uniqueResult();
        return ans;
    }

    public void GetMess(int idSociete){
        Session session = sessionFactory.openSession();
        String sql = "create table Msg"+idSociete+" (idSender integer , message text,temps timestamp default CURRENT_TIMESTAMP) ";
        Query query = session.createSQLQuery(sql);
        query.uniqueResult();
    }

    public void AddSociete(String nom, String lieu, String contact, String adresse, String mail, String mdp){
        Session session = null;
        Transaction transaction = null;
        Societe societe = new Societe();
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            String sql = "insert into Societe (nomsociete, lieu, contact, adresse, mail, mdp) values (:nom, :lieu, :contact, :adresse, :mail, md5(:mdp))";
            Query query = session.createNativeQuery(sql);
            query.setParameter("nom", nom);
            query.setParameter("lieu", lieu);
            query.setParameter("contact", contact);
            query.setParameter("adresse", adresse);
            query.setParameter("mail",mail);
            query.setParameter("mdp",mdp);
            query.executeUpdate();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
    }

    public ArrayList<String> Province(){
        Session session = sessionFactory.openSession();
        String sql = " select province from Province";
        ArrayList<String> ans = (ArrayList<String>) session.createSQLQuery(sql).list();
        return ans;
    }

    public void AddPosteSociete(int idSociete, int idCateg){
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            String sql = "insert into PosteSociete (idSociete, idCateg) values (:idSociete, :idCateg); Create table IF NOT EXISTS  Msg"+idSociete+" (idSender integer , message text,temps timestamp default CURRENT_TIMESTAMP) ";
            Query query = session.createNativeQuery(sql);
            query.setParameter("idSociete", idSociete);
            query.setParameter("idCateg", idCateg);
            query.executeUpdate();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
    }

    public <T> T create(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(entity);
        transaction.commit();
        session.close();
        return entity;
    }
    public<T> List<T> findQuery(Class<T> tClass,String query){
        Session session = sessionFactory.openSession();
        List<T> results = session.createNativeQuery(query,tClass).list();
        session.close();
        return results;
    }

    public <T> T findById(Class<T> clazz, Serializable id) {
        Session session = sessionFactory.openSession();
        T entity = (T) session.get(clazz, id);
        session.close();
        return entity;
    }

    public <T> List<T> findAll(Class<T> tClass) {
        Session session = sessionFactory.openSession();
        List<T> results = session.createCriteria(tClass).list();
        session.close();
        return results;
    }

    public <T> List<T> findWhere(T entity) {
        Session session = sessionFactory.openSession();
        Example example = Example.create(entity).ignoreCase();
        List<T> results = session.createCriteria(entity.getClass()).add(example).list();
        session.close();
        return results;
    }

    public <T> List<T> recherche(T entity,String mot){
        Session session= null;
        List<T> list = null;
        try{
            session = this.sessionFactory.openSession();
            list = session.createCriteria(entity.getClass())
                    .add(
                            Restrictions.or(
                                    Restrictions.ilike("titre",mot, MatchMode.ANYWHERE),
                                    Restrictions.ilike("body",mot,MatchMode.ANYWHERE)
                            )
                    ).list();
        }catch (Exception e){e.printStackTrace();}
        return list;
    }

    public <T> List<T> findField(Class<T> tClass, String field, String value) {
        Session session = sessionFactory.openSession();
        Criteria crit = session.createCriteria(tClass);
        crit.add(Restrictions.eq(field, value));
        List<T> results = crit.list();
        return results;
    }

    public <T> List<T> findField(Class<T> tClass, String field, Integer value) {
        Session session = sessionFactory.openSession();
        Criteria crit = session.createCriteria(tClass);
        crit.add(Restrictions.eq(field, value));
        List<T> results = crit.list();
        return results;
    }

    public <T> List<T> paginateWhere(T entity, int offset, int size) {
        Session session = sessionFactory.openSession();
        Example example = Example.create(entity).ignoreCase();
        List<T> results = session.createCriteria(entity.getClass())
            .add(example)
            .setFirstResult(offset)
            .setMaxResults(offset + size).list();
        session.close();
        return results;
    }

    public <T> List<T> paginate(Class<T> clazz, int offset, int size) {
        Session session = sessionFactory.openSession();
        List<T> results = session.createCriteria(clazz)
            .setFirstResult(offset)
            .setMaxResults(offset + size).list();
        session.close();
        return results;
    }

    public <T> List<T> paginate(Class<T> clazz, int offset, int size, String orderBy, boolean orderAsc) {
        Session session = sessionFactory.openSession();
        Order order = (orderAsc) ? Order.asc(orderBy) : Order.desc(orderBy);
        List<T> results = session.createCriteria(clazz)
            .addOrder(order)
            .setFirstResult(offset)
            .setMaxResults(offset + size).list();
        session.close();
        return results;
    }

    public void deleteById(Class tClass, Serializable id) {
        delete(findById(tClass, id));
    }

    public void delete(Object entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(entity);
        transaction.commit();
        session.close();
    }

    public <T> T update(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(entity);
        transaction.commit();
        session.close();
        return entity;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
