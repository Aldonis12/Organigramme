package projet.organigramme.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import projet.organigramme.Service.EmployeService;
import projet.organigramme.Service.FonctionService;
import projet.organigramme.Service.SocieteService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    SocieteService societeService;

    @Autowired
    FonctionService fonctionService;

    @Autowired
    EmployeService employeService;

    @GetMapping("LoginPage")
    private String PageLogin(HttpSession session){
        session.invalidate();
        return "Redirect/Login";
    }

    @PostMapping("LoginSociete")
    private ModelAndView LoginSociete(@RequestParam("mail") String mail, @RequestParam("mdp") String mdp, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        try {
            String i = fonctionService.LoginSociete(mail, mdp);
            if (i.isEmpty()){
                modelAndView.setViewName("Redirect/Login");
                modelAndView.addObject("alerte", "Email ou Mot de passe invalide !");
            } else{
                modelAndView.setViewName("Details/DetailsSociete");
                modelAndView.addObject("societe", societeService.UniqueSociete(mail));
                modelAndView.addObject("idSociete", societeService.UniqueSociete(mail).get(0).getIdSociete());
                session.setAttribute("id", societeService.UniqueSociete(mail).get(0).getIdSociete());
            }
        }catch (Exception e){
            modelAndView.setViewName("Redirect/Login");
            modelAndView.addObject("alerte", "Email ou Mot de passe invalide !");
        }
        return modelAndView;
    }

    @GetMapping("LogoutSociete")
    public ModelAndView processLogout(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/LoginSociete");
        session.invalidate();
        return modelAndView;
    }


    @ModelAttribute
    public void setNoCacheHeaders(HttpServletResponse response) throws IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }
}
