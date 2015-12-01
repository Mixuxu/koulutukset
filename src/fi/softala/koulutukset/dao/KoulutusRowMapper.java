package fi.softala.koulutukset.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import fi.softala.koulutukset.bean.Koulutus;

//RowMapper mappaa tietokannasta tuloksena tulleen rivin olioon yksi kerrallaan
public class KoulutusRowMapper implements RowMapper<Koulutus> {
	
	@Override
	public Koulutus mapRow(ResultSet rs, int rowNum) throws SQLException {
		Koulutus k = new Koulutus();
		
		k.setOpettaja(rs.getString("opettaja"));
		k.setAihe(rs.getString("aihe"));
		k.setKouluttaja(rs.getString("kouluttaja"));
		k.setPaikka(rs.getString("paikka"));
		k.setKuvaus(rs.getString("kuvaus"));
		k.setKoulutus_id(rs.getInt("koulutus_id"));

		// haetaan timestamp aikana
		Date aika = new Date();
		aika = rs.getTimestamp("aloitusaikapvm");
		// formatoidaan stringiksi
		SimpleDateFormat ilmansadasosia = new SimpleDateFormat(
				"dd.MM.yyyy HH:mm");
		String aikaString = ilmansadasosia.format(aika);
		// asetetaan oikeassa muodossa koulutukseen
		k.setAloitusaikaPvm(aikaString);

		// sama lopetusajalle
		aika = rs.getTimestamp("lopetusaikapvm");
		aikaString = ilmansadasosia.format(aika);
		k.setLopetusaikaPvm(aikaString);
		return k;
	}

}
