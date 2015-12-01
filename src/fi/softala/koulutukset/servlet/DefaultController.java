package fi.softala.koulutukset.servlet;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fi.softala.koulutukset.bean.Koulutus;
import fi.softala.koulutukset.dao.KoulutusDAO;

@Controller
// mapataan k‰ytt‰m‰‰n koulutukset/alla_oleva_value esim koulutukset/kaikki
// ennen oli value="hallinta" jolloin meni muotoon koulukset/hallinta/kaikki
@RequestMapping(value = "/")
public class DefaultController {

	// injektoidaan ja asetetaan dao jotta sit‰ voidaan kutsua
	@Inject
	private KoulutusDAO dao;

	public KoulutusDAO getDao() {
		return dao;
	}

	public void setDao(KoulutusDAO dao) {
		this.dao = dao;
	}

	boolean tv = false;

	public void koulutustenHaku(Model model) {
		// haetaan tulevat koulutukset arraylistiin

		ArrayList<Koulutus> koulutukset = dao.haeKaikki();

		// l‰hetet‰‰n arraylist (huomaa model!)
		model.addAttribute("koulutukset", koulutukset);

	}

	// taulukko sivu
	@RequestMapping(value = "kaikki", method = RequestMethod.GET)
	public String haeKaikkiKoulutukset(Model model) {

		// kutsutaan hakumetodia
		koulutustenHaku(model);

		// kun on haettu ja asettu palautetaan viel‰ "taulukko_ilman_poista.jsp"
		// johon tiedot koulutuksista lis‰tty
		return "taulukko_ilman_poista";
	}

	// koulutussivu, jossa poistanappi
	@RequestMapping(value = "hallinta", method = RequestMethod.GET)
	public String haeHallinta(Model model, boolean lisatty, boolean poistettu) {

		if (lisatty == true) {
			model.addAttribute("lisays", "true");
		} else if (lisatty == false) {
			model.addAttribute("lisays", "false");
		}
		if (poistettu == true) {
			model.addAttribute("poistettu", "true");
		} else if (poistettu == true) {
			model.addAttribute("poistettu", "false");
		}
		tv = false;
		ArrayList<Koulutus> koulutukset = dao.haeOikeastiKaikki(tv);
		ArrayList<Koulutus> koulutuksetM = dao.haeMenneet(tv);
		// l‰hetet‰‰n arraylist (huomaa model!)
		model.addAttribute("koulutukset", koulutukset);
		model.addAttribute("koulutuksetM", koulutuksetM);
		return "taulukko";
	}

	// info TV:n ihkaoma sivu
	@RequestMapping(value = "tv", method = RequestMethod.GET)
	public String haeTV(Model model) {

		tv = true;
		// haetaan menneet koulutukset arraylistiin
		ArrayList<Koulutus> koulutuksetM = dao.haeMenneet(tv);

		// l‰hetet‰‰n arraylist (huomaa model!)
		model.addAttribute("koulutuksetM", koulutuksetM);

		ArrayList<Koulutus> koulutukset = dao.haeOikeastiKaikki(tv);

		// l‰hetet‰‰n arraylist (huomaa model!)
		model.addAttribute("koulutukset", koulutukset);

		return "tv";
	}

	// aloitussivu
	// huomaa value eli url on vain koulukset
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String haeIndex(Model model) {
		return "index";
	}

	// TIETOJEN POISTAMINEN
	@RequestMapping(value = "poista", method = RequestMethod.POST)
	// pyydet‰‰n painetun napin parametrin‰ saatu id
	public String delete(@RequestParam("poistaid") int koulutus_id, Model model) {

		// poistetaan saadun id:n koulutus
		dao.poista(koulutus_id);

		// ohjataan haeHallinta()
		return "redirect:/hallinta?poistettu=true";
	}

	// loginsivu
	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public String login(Model model) {

		return "login";

	}

	// jos sis‰‰nkirjautuminen ei mene l‰pi
	@RequestMapping(value = "/loginfail", method = RequestMethod.GET)
	public String loginerror(Model model) {

		model.addAttribute("loginerror", "true");
		return "login";

	}

	// kirjaudutaan ulos
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {

		// asetaan attribuutti sivulle katso index.jsp <c:if test>
		model.addAttribute("loggedout", "true");
		return "index";

	}

}
