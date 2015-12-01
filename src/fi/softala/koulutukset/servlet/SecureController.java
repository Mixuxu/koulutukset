package fi.softala.koulutukset.servlet;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		koulutus.setLopetusaikaPvm(stringNykyaika);

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
			BindingResult result, Model model) {

		// jos ei mene l‰pi
		if (result.hasErrors()) {
			return "WEB-INF/secure/lomake";

		} else {
			// lis‰t‰‰n olio tietokantaan jos validointi l‰pi
			dao.lisaa(koulutus);
			
			return "redirect:/hallinta?lisatty=true";
		}

	}

}