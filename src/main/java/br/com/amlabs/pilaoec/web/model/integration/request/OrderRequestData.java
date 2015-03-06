package br.com.amlabs.pilaoec.web.model.integration.request;

public class OrderRequestData {

	private CredentialsData credentials;
	private SalesOrderData salesorder;

	public CredentialsData getCredentials() {
		return credentials;
	}

	public void setCredentials(CredentialsData credentials) {
		this.credentials = credentials;
	}

	public SalesOrderData getSalesorder() {
		return salesorder;
	}

	public void setSalesorder(SalesOrderData salesorder) {
		this.salesorder = salesorder;
	}

	public OrderRequestData(CredentialsData credentials, SalesOrderData salesorder) {
		super();
		this.credentials = credentials;
		this.salesorder = salesorder;
	}

}
