package projet.organigramme.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import projet.organigramme.Model.*;
import projet.organigramme.Service.EmployeService;
import projet.organigramme.Service.FonctionService;
import projet.organigramme.Service.SocieteService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@org.springframework.stereotype.Controller
public class Controller {
    @Autowired
    SocieteService societeService;

    @Autowired
    FonctionService fonctionService;

    @Autowired
    EmployeService employeService;

    @GetMapping("AddSociete")
    private ModelAndView PageSociete(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Add/Societe");
        ArrayList<String> liste = fonctionService.AllProvince();
        modelAndView.addObject("ListProvince",liste);
        return modelAndView;
    }

    @PostMapping("NouveauSociete")
    private Object NouveauSociete(@RequestParam("nom") String nom, @RequestParam("lieu") String lieu, @RequestParam("contact") String contact, @RequestParam("adresse") String adresse , @RequestParam("mail") String mail, @RequestParam("mdp") String mdp) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        try {
            if (nom!=null || lieu!=null || contact!=null || adresse != null || mail != null || mdp!= null) {
                societeService.AddSociete(nom, lieu, contact,adresse, mail, mdp);
                modelAndView.setViewName("redirect:/LastSociete");
                modelAndView.addObject("id", societeService.LastSociete());
            }else {
                modelAndView.setViewName("Add/Societe");
                modelAndView.addObject("erreur", "Completez tous les champs et inserez des valeurs exactes");
            }
            return modelAndView;

        } catch (Exception e){
            modelAndView.setViewName("Add/Societe");
            modelAndView.addObject("erreur","Erreur d'ajout");
        }
        return null;
    }

    @GetMapping("LastSociete")
    private ModelAndView LastSocietes(@RequestParam(value="id") int id){
        ModelAndView modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName("Add/SocieteCategorie");
            modelAndView.addObject("idSociete",id);
            modelAndView.addObject("categorie", fonctionService.AllCategorie());

        } catch (Exception e){
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message",e.getMessage());
        }
        return modelAndView;
    }

    @PostMapping("AddPosteSociete")
    private Object NouveauPosteSociete(@RequestParam("idSociete") String idSociete, @RequestParam("idCateg") String[] idCateg){
        ModelAndView modelAndView = new ModelAndView();
        try {
            if (idCateg!=null) {
                for (int i = 0; i < idCateg.length; i++) {
                    societeService.AddPosteSociete(Integer.parseInt(idSociete), Integer.parseInt(idCateg[i]));
                }
                modelAndView.setViewName("Redirect/Login");
                modelAndView.addObject("alerte", "Veuillez vous connecter avec votre Email et Mot de passe !");
            }else if (idCateg==null){
                modelAndView.setViewName("Add/SocieteCategorie");
                modelAndView.addObject("idSociete",societeService.LastSociete());
                modelAndView.addObject("categorie", fonctionService.AllCategorie());
                modelAndView.addObject("erreur", "Veuillez choisir au moins une catégorie!");
            }
            return modelAndView;

        } catch (Exception e){
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message","Erreur d'ajout");
        }
        return null;
    }

    @GetMapping("SocieteEmployes")
    private Object SocieteEmployes(@RequestParam(value="id") int id, Model model){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Details/EmployeSociete");
        modelAndView.addObject("idSociete", id);
        List<CategEmploye> myViewList =employeService.V_employe(id);
        modelAndView.addObject("employe", myViewList);
        return modelAndView;
    }

    @GetMapping("AddEmployes")
    private String PageAddEmploye(@RequestParam(value="id") int id, Model model){
        model.addAttribute("idSociete", id);
        model.addAttribute("genre", fonctionService.AllGenre());
        return "Add/Employe";
    }

    @PostMapping("AjoutEmploye")
    private ModelAndView NouveauEmploye(@ModelAttribute Employe employe,@RequestParam(value="id") int id, HttpServletRequest request) throws IOException{
        ModelAndView modelAndView = new ModelAndView();
        try {
            Genre g = new Genre();
            g.setIdGenre(Integer.parseInt(request.getParameter("idgenre")));
            employe.setGenre(g);
            employeService.AjoutEmp(employe);
            modelAndView.setViewName("Add/EmployeCategorie");
            modelAndView.addObject("idSociete", id);
            modelAndView.addObject("idemp", employeService.LastEmploye());
            modelAndView.addObject("categorie", fonctionService.V_societecateg(id));
        }catch (Exception e){
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message",e.getMessage());
        }
        return modelAndView;
    }

    @PostMapping("AjoutCategEmp")
    private ModelAndView NouveauCategEmp(@RequestParam("idsociete") int idsociete, @RequestParam("idemploye") int idemploye, @RequestParam("categorie") int categorie) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        try {
            employeService.AddEmployeCateg(idemploye, idsociete, categorie);
            fonctionService.AddActualite(idsociete,"a recrute un nouveau membre au poste de : "+societeService.GetNamecategorie(categorie),2);
            modelAndView.setViewName("redirect:/AddEmployes?id="+idsociete);
            return modelAndView;
        }catch (Exception e){
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message",e.getMessage());
        }
        return modelAndView;
    }

    @GetMapping("LoginPageEmp")
    private String PageLoginEmp(){
        return "Redirect/LoginEmp";
    }

    @PostMapping("LoginEmp")
    private ModelAndView LoginEmp(@RequestParam("identifiant") String identifiant){
        ModelAndView modelAndView = new ModelAndView();
        try {
            int i = fonctionService.LoginEmp(identifiant);
            int id = fonctionService.IdEmp(identifiant);
            if (i==0){
                modelAndView.setViewName("Redirect/LoginEmp");
                modelAndView.addObject("alerte", "Email ou Mot de passe invalide !");
            } if (i!=0){
                modelAndView.setViewName("Details/Discussion");
                modelAndView.addObject("idSociete",i);
                modelAndView.addObject("idEmp",id);
                List<Discussion> myDiscu =fonctionService.Discussion(i);
                modelAndView.addObject("discussion", myDiscu);
            }
        }catch (Exception e){
            modelAndView.setViewName("Redirect/LoginEmp");
            modelAndView.addObject("alerte", "Email ou Mot de passe invalide !");
        }
        return modelAndView;
    }

    @PostMapping("AddDiscussion")
    private ModelAndView Discussion(@RequestParam("idSociete") int idsociete, @RequestParam("idEmploye") int idemploye,@RequestParam("message") String message){
        ModelAndView modelAndView = new ModelAndView();
        try {
            fonctionService.AddDiscussion(idsociete, idemploye, message);
            modelAndView.setViewName("Details/Discussion");
            modelAndView.addObject("idSociete",idsociete);
            modelAndView.addObject("idEmp",idemploye);
            List<Discussion> myDiscu =fonctionService.Discussion(idsociete);
            modelAndView.addObject("discussion", myDiscu);
        }catch (Exception e){

        }
        return modelAndView;
    }

    @GetMapping("PageListSociete")
    private ModelAndView ListSociete(){
        ModelAndView modelAndView = new ModelAndView();
        try {
            List<Societe> liste = societeService.AllSociete();
            modelAndView.setViewName("List/SocieteList");
            modelAndView.addObject("listeSociete", liste);
        }catch (Exception e){
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message",e.getMessage());
        }
        return modelAndView;
    }

    @GetMapping("PageOrganigramme")
    private ModelAndView PageOrganigramme(@RequestParam(value="id") int id){
        ModelAndView modelAndView = new ModelAndView();
        try {
        modelAndView.setViewName("List/Organigramme");
        modelAndView.addObject("id", id);
        for (int i =1; i<16; i++)
        modelAndView.addObject("categ"+i, employeService.V_orga(id,i));
        }catch (Exception e){
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message","Liste vide");
        }
        return modelAndView;
    }

    @PostMapping("NewAnnonce")
    private ModelAndView NouvelleAnnonce(@RequestParam("idSociete") int idSociete, @RequestParam("annonce") String annonce){
        ModelAndView modelAndView = new ModelAndView();
        try {
            fonctionService.AddActualite(idSociete,annonce,1);
            modelAndView.setViewName("Details/Discussion");
        }catch (Exception e){

        }
        return modelAndView;
    }

    @GetMapping("ListActualite")
    private ModelAndView ListActualite(){
        ModelAndView modelAndView = new ModelAndView();
        try {
            List<Actualite> liste = fonctionService.ListActualite();
            modelAndView.setViewName("List/Actualite");
            modelAndView.addObject("ListActualite", liste);
        }catch (Exception e){
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message",e.getMessage());
        }
        return modelAndView;
    }
}
