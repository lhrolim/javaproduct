package br.com.amlabs.pilaoec.web.model.integration.response;

public class AmlabsCustomerData {

	private String state;
	private String name;
	private String address;
	private String customernum;
	private String status;
	private String neighborhood;
	private int customerid;
	private String complement;
	private String zipcode;
	private Double cofeebagprice;
	private String nro;
	private String tradingname;
	private String email;
	private String city;
	private String cnpj;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCustomernum() {
		return customernum;
	}

	public void setCustomernum(String customernum) {
		this.customernum = customernum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getNeighborhood() {
		return neighborhood;
	}

	public void setNeighborhood(String neighborhood) {
		this.neighborhood = neighborhood;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public String getComplement() {
		return complement;
	}

	public void setComplement(String complement) {
		this.complement = complement;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public Double getCofeebagprice() {
		return cofeebagprice;
	}

	public void setCofeebagprice(Double cofeebagprice) {
		this.cofeebagprice = cofeebagprice;
	}

	public String getNro() {
		return nro;
	}

	public void setNro(String nro) {
		this.nro = nro;
	}

	public String getTradingname() {
		return tradingname;
	}

	public void setTradingname(String tradingname) {
		this.tradingname = tradingname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public static AmlabsCustomerData MockInstance() {
		AmlabsCustomerData data = new AmlabsCustomerData();
		// data.setStatus("mocked");
		// data.setEndereco("Rua Soares da Costa 135 apto 309, Tijuca Rio de Janeiro RJ");
		// data.setPreco(10.5);
		return data;
	}

}
