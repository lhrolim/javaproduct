package br.com.amlabs.pilaoec.web.model;

public class ClientRequestData {

	private String amlabsClientId;
	private String productId;

	private int quantity;
	private String leadtype;
	private double totalvalue;

	public String getAmlabsClientId() {
		return amlabsClientId;
	}

	public void setAmlabsClientId(String amlabsClientId) {
		this.amlabsClientId = amlabsClientId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getLeadtype() {
		return leadtype;
	}

	public void setLeadtype(String leadtype) {
		this.leadtype = leadtype;
	}

	public double getTotalvalue() {
		return totalvalue;
	}

	public void setTotalvalue(double totalvalue) {
		this.totalvalue = totalvalue;
	}

}
