package br.com.amlabs.pilaoec.web.model.integration.request;

public class CredentialsData {

	private String username;
	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public CredentialsData(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public CredentialsData() {

	}

}
