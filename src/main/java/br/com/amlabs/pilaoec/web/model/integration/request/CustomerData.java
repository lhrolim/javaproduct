package br.com.amlabs.pilaoec.web.model.integration.request;

public class CustomerData {

	private String customernum;

	public CustomerData(String customerId) {
		this.customernum = customerId;
	}

	public CustomerData() {
	}

	public String getCustomernum() {
		return customernum;
	}

	public void setCustomernum(String customerNum) {
		this.customernum = customerNum;
	}

}
