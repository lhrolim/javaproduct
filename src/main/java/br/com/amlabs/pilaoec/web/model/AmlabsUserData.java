package br.com.amlabs.pilaoec.web.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AmlabsUserData {

	private String status;
	private Double preco;
	private String endereco;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public static AmlabsUserData MockInstance() {
		AmlabsUserData data = new AmlabsUserData();
		data.setStatus("mocked");
		data.setEndereco("Rua Soares da Costa 135 apto 309, Tijuca Rio de Janeiro RJ");
		data.setPreco(10.5);
		return data;
	}

}
