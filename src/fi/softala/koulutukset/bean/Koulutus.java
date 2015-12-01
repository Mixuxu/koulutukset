package fi.softala.koulutukset.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

//kommentti teemulle

public class Koulutus {
	@NotNull(message = "T‰yt‰ kentt‰, kiitos")
	@Size(min = 3, max = 50, message = "3-50 merkki‰, kiitos")
	private String opettaja;
	@NotNull(message = "T‰yt‰ kentt‰, kiitos")
	@Size(min = 2, max = 50, message = "2-50 merkki‰, kiitos")
	private String aihe;
	@NotNull(message = "T‰yt‰ kentt‰, kiitos")
	@Size(min = 2, max = 50, message = "2-50 merkki‰, kiitos")
	private String kouluttaja;
	@NotNull(message = "T‰yt‰ kentt‰, kiitos")
	@Size(min = 2, max = 50, message = "2-50 merkki‰, kiitos")
	private String paikka;

	@Size(max = 250, message = "Enint‰‰n 250 merkki‰, kiitos")
	private String kuvaus;

	private int koulutus_id;

	@NotNull(message = "T‰yt‰ kentt‰, kiitos")
	private String aloitusaikaPvm;

	@NotNull(message = "T‰yt‰ kentt‰, kiitos")
	private String lopetusaikaPvm;

	public Koulutus() {
		super();

	}

	public String getOpettaja() {
		return opettaja;
	}

	public void setOpettaja(String opettaja) {
		this.opettaja = opettaja;
	}

	public String getAihe() {
		return aihe;
	}

	public void setAihe(String aihe) {
		this.aihe = aihe;
	}

	public String getKouluttaja() {
		return kouluttaja;
	}

	public void setKouluttaja(String kouluttaja) {
		this.kouluttaja = kouluttaja;
	}

	public String getPaikka() {
		return paikka;
	}

	public void setPaikka(String paikka) {
		this.paikka = paikka;
	}

	public String getKuvaus() {
		return kuvaus;
	}

	public void setKuvaus(String kuvaus) {
		this.kuvaus = kuvaus;
	}

	public int getKoulutus_id() {
		return koulutus_id;
	}

	public void setKoulutus_id(int koulutus_id) {
		this.koulutus_id = koulutus_id;
	}

	public String getAloitusaikaPvm() {
		return aloitusaikaPvm;
	}

	public void setAloitusaikaPvm(String aloitusaikaPvm) {
		this.aloitusaikaPvm = aloitusaikaPvm;
	}

	public String getLopetusaikaPvm() {
		return lopetusaikaPvm;
	}

	public void setLopetusaikaPvm(String lopetusaikaPvm) {
		this.lopetusaikaPvm = lopetusaikaPvm;
	}

	public Koulutus(String opettaja, String aihe, String kouluttaja,
			String paikka, String kuvaus, int koulutus_id,
			String aloitusaikaPvm, String lopetusaikaPvm) {
		super();
		this.opettaja = opettaja;
		this.aihe = aihe;
		this.kouluttaja = kouluttaja;
		this.paikka = paikka;
		this.kuvaus = kuvaus;
		this.koulutus_id = koulutus_id;
		this.aloitusaikaPvm = aloitusaikaPvm;
		this.lopetusaikaPvm = lopetusaikaPvm;
	}

	@Override
	public String toString() {
		return "Koulutus [opettaja=" + opettaja + ", aihe=" + aihe
				+ ", kouluttaja=" + kouluttaja + ", paikka=" + paikka
				+ ", kuvaus=" + kuvaus + ", koulutus_id=" + koulutus_id
				+ ", aloitusaikaPvm=" + aloitusaikaPvm + ", lopetusaikaPvm="
				+ lopetusaikaPvm + "]";
	}

}
