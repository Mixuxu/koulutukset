package fi.softala.koulutukset.servlet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fi.softala.koulutukset.bean.Koulutus;
import fi.softala.koulutukset.dao.KoulutusDAO;

//urli nyt */koulutukset/secure/
@Controller
@RequestMapping(value = "/secure")
public class SecureController {

	@Inject
	private KoulutusDAO dao;

	public KoulutusDAO getDao() {
		return dao;
	}

	public void setDao(KoulutusDAO dao) {
		this.dao = dao;
	}

	// urli nyt */koulutukset/secure/lomake jne
	@RequestMapping(value = "/lomake", method = RequestMethod.GET)
	public String paasivu(Model model) {

		Koulutus koulutus = new Koulutus();
		// haetaan nykyaika kun tullaan lomakesivulle
		Date nykyaika = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String stringNykyaika = sdf.format(nykyaika);
		// asetetaan lomakkeen formiin oletusarvoksi nykyaika
		koulutus.setAloitusaikaPvm(stringNykyaika);

		// lis‰t‰‰n attribuuttina edell‰ luotu koulutus arvoineen
		model.addAttribute(koulutus);

		return "WEB-INF/secure/lomake";
	}

	// lomakkeen tietojen k‰sittely
	@RequestMapping(value = "/lomake", method = RequestMethod.POST)
	// validoidaan saatu koulutus
	// @Valid @ModelAttribute validoi ja vertaa saadun Koulutus -olion
	// BindingResult on validoinnin tulos
	// Map<String, Object> voi poistaa ens sprintiss‰ ja varmistaa ettei vaikuta
	// mihink‰‰n
	public String teeKoulutus(
			@Valid @ModelAttribute("koulutus") Koulutus koulutus,
			BindingResult result, Model model) throws ParseException {

		// jos ei mene l‰pi
		if (result.hasErrors()) {
			return "WEB-INF/secure/lomake";

		} else {
			// lis‰t‰‰n olio tietokantaan jos validointi l‰pi
			dao.lisaa(koulutus);
			
			return "redirect:/secure/hallinta?lisatty=true";
		}

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
		boolean tv = false;
		ArrayList<Koulutus> koulutukset = dao.haeOikeastiKaikki(tv);
		ArrayList<Koulutus> koulutuksetM = dao.haeMenneet(tv);
		// l‰hetet‰‰n arraylist (huomaa model!)
		model.addAttribute("koulutukset", koulutukset);
		model.addAttribute("koulutuksetM", koulutuksetM);
		return "WEB-INF/secure/taulukko";
	}
	
	// TIETOJEN POISTAMINEN
		@RequestMapping(value = "poista", method = RequestMethod.POST)
		// pyydet‰‰n painetun napin parametrin‰ saatu id
		public String delete(@RequestParam("poistaid") int koulutus_id, Model model) {

			// poistetaan saadun id:n koulutus
			dao.poista(koulutus_id);

			// ohjataan haeHallinta()
			return "redirect:/secure/hallinta?poistettu=true";
		}

}