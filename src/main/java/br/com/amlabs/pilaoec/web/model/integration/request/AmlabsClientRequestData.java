package br.com.amlabs.pilaoec.web.model.integration.request;

public class AmlabsClientRequestData {

	private CredentialsData credentials;
	private CustomerData customer;

	public CredentialsData getCredentials() {
		return credentials;
	}

	public void setCredentials(CredentialsData credentials) {
		this.credentials = credentials;
	}

	public CustomerData getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerData customer) {
		this.customer = customer;
	}

	public static AmlabsClientRequestData forId(String customerId) {
		AmlabsClientRequestData data = new AmlabsClientRequestData();
		data.setCredentials(new CredentialsData("e-commerce", "eC0mm!@#"));
		data.setCustomer(new CustomerData(customerId));
		return data;
	}

}
