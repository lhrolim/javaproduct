package br.com.amlabs.pilaoec.web.model.integration.request;

public class SalesOrderData {

	private String customerid;
	private Double shippingvalue;
	private Integer supplyamount;
	private String comments;

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public Double getShippingvalue() {
		return shippingvalue;
	}

	public void setShippingvalue(Double shippingvalue) {
		this.shippingvalue = shippingvalue;
	}

	public Integer getSupplyamount() {
		return supplyamount;
	}

	public void setSupplyamount(Integer supplyamount) {
		this.supplyamount = supplyamount;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

}
