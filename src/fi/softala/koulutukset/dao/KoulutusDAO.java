package fi.softala.koulutukset.dao;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import fi.softala.koulutukset.bean.Koulutus;

public class KoulutusDAO {

	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// haetaan nykyinen aika
	Date nykyaika = new Date();

	// Haetaan tulevat koulutukset tietokannasta
	public ArrayList<Koulutus> haeKaikki() {

		// WHERE aloitusaikapvm > DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY
		// hakee kaikki t‰st‰ p‰iv‰st‰ eteenp‰in olevat
		// ja edellisen p‰iv‰n koulukset
		String sql = "SELECT koulutus_id, opettaja, aihe, aloitusaikapvm, lopetusaikapvm, paikka, kouluttaja, kuvaus"
				+ " FROM Koulutus"
				+ " WHERE aloitusaikapvm > DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)"
				+ " ORDER BY aloitusaikapvm ASC";

		// kutsutaan mapperia joka mappaa kaikki koulutukset
		RowMapper<Koulutus> mapper = new KoulutusRowMapper();
		ArrayList<Koulutus> koulutukset = (ArrayList<Koulutus>) jdbcTemplate
				.query(sql, mapper);

		return koulutukset;
	}

	// haetaan KAIKKI siis KAIKKI tv-versio
	public ArrayList<Koulutus> haeOikeastiKaikki(boolean tv) {

		String sql = "SELECT koulutus_id, opettaja, aihe, aloitusaikapvm, lopetusaikapvm, paikka, kouluttaja, kuvaus"
				+ " FROM Koulutus"
				+ " WHERE aloitusaikapvm > CURRENT_TIMESTAMP"
				+ " ORDER BY aloitusaikapvm DESC";
		if (tv == false) {

			// kutsutaan mapperia joka mappaa kaikki koulutukset
			RowMapper<Koulutus> mapper = new KoulutusRowMapper();
			ArrayList<Koulutus> koulutukset = (ArrayList<Koulutus>) jdbcTemplate
					.query(sql, mapper);

			return koulutukset;
		} else {

			RowMapper<Koulutus> mapper = new TVKoulutusRowMapper();
			ArrayList<Koulutus> koulutukset = (ArrayList<Koulutus>) jdbcTemplate
					.query(sql, mapper);

			return koulutukset;
		}
	}

	// Haetaan ainoastaan menneet koulutukset
	public ArrayList<Koulutus> haeMenneet(boolean tv) {
		// WHERE aloitusaikapvm > DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY
		// hakee kaikki t‰st‰ p‰iv‰st‰ eteenp‰in olevat
		// ja edellisen p‰iv‰n koulukset
		String sql = "SELECT koulutus_id, opettaja, aihe, aloitusaikapvm, lopetusaikapvm, paikka, kouluttaja, kuvaus"
				+ " FROM Koulutus"
				+ " WHERE aloitusaikapvm < CURRENT_TIMESTAMP"
				+ " ORDER BY aloitusaikapvm DESC";

		if (tv == false) {
			// kutsutaan mapperia joka mappaa kaikki koulutukset
			RowMapper<Koulutus> mapper = new KoulutusRowMapper();
			ArrayList<Koulutus> koulutuksetM = (ArrayList<Koulutus>) jdbcTemplate
					.query(sql, mapper);

			return koulutuksetM;
		} else {

			// kutsutaan mapperia joka mappaa kaikki koulutukset
			RowMapper<Koulutus> mapper = new TVKoulutusRowMapper();
			ArrayList<Koulutus> koulutuksetM = (ArrayList<Koulutus>) jdbcTemplate
					.query(sql, mapper);

			return koulutuksetM;
		}
	}

	public void poista(int id) {

		String sql = "DELETE FROM Koulutus WHERE koulutus_id = ?";
		Object[] parametri = new Object[] { id };

		// ajetaan update lause
		jdbcTemplate.update(sql, parametri);
	}

	public void lisaa(Koulutus k) throws ParseException {

		String sql = "INSERT INTO Koulutus(aloitusaikapvm, lopetusaikapvm, opettaja, aihe, kouluttaja, paikka, kuvaus) VALUES (?, ?, ?, ?, ?, ?, ?)";
		// muutetaan longiksi lopetusaika stringi
		String lopetuksenKestoString = k.getLopetusaikaPvm();
		Long lopetuksenKesto = Long.parseLong(lopetuksenKestoString);
		// Tehd‰‰n aloitusaika stringist‰ date
		String pvm = k.getAloitusaikaPvm();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date mihinLisataan = sdf.parse(pvm);

		// UUSI HALUTTU AIKA
		Date kesto = new Date(mihinLisataan.getTime() + lopetuksenKesto);
		// Kantaa formatoitu muoto
		String lopetusaikaStringFormatoitu = sdf.format(kesto);

		Object[] parametrit = new Object[] { k.getAloitusaikaPvm(),
				lopetusaikaStringFormatoitu, k.getOpettaja(), k.getAihe(),
				k.getKouluttaja(), k.getPaikka(), k.getKuvaus() };

		// ajetaan lause
		jdbcTemplate.update(sql, parametrit);

	}

}
