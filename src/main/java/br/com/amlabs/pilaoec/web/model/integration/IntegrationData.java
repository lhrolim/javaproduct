package br.com.amlabs.pilaoec.web.model.integration;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

@Component
public class IntegrationData {

	private String retrieveURL;
	private String saveURL;
	private String username;
	private String password;

	public String getRetrieveURL() {
		return retrieveURL;
	}

	public void setRetrieveURL(String retrieveURL) {
		this.retrieveURL = retrieveURL;
	}

	public String getSaveURL() {
		return saveURL;
	}

	public void setSaveURL(String saveURL) {
		this.saveURL = saveURL;
	}

	public Boolean IsSaveMocked() {
		return getSaveURL() == null;
	}

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

	@PostConstruct
	public void InitProperties() {

		try {
			InputStream st = this.getClass().getResourceAsStream("/amlabs-integration/amlabsintegration.properties");
			Properties props = new Properties();
			props.load(st);
			if (props.containsKey("retrieve.url")) {
				retrieveURL = props.getProperty("retrieve.url");
			}
			if (props.containsKey("save.url")) {
				saveURL = props.getProperty("save.url");
			}
			if (props.containsKey("credentials.username")) {
				username = props.getProperty("credentials.username");
			}
			if (props.containsKey("credentials.password")) {
				password = props.getProperty("credentials.password");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
