package fi.softala.koulutukset.dao;

	import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import fi.softala.koulutukset.bean.Koulutus;

public class TVKoulutusRowMapper implements RowMapper<Koulutus>{
	

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
			SimpleDateFormat formatoiTunnit = new SimpleDateFormat(
					"HH:mm");
			String aikaString = formatoiTunnit.format(aika);
			
			aika = rs.getTimestamp("lopetusaikapvm");
			
			String aikaTunnit = formatoiTunnit.format(aika);
			
			String haluttuAika = aikaString + " - " + aikaTunnit;
			
			k.setAloitusaikaPvm(haluttuAika);
			
			SimpleDateFormat aikaPelkkaPvm = new SimpleDateFormat(
					"dd.MM.yyyy");
			
			String pvm = aikaPelkkaPvm.format(aika);
			
			k.setLopetusaikaPvm(pvm);
			return k;
		}

	}

