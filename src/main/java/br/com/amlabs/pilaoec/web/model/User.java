package br.com.amlabs.pilaoec.web.model;

import br.com.amlabs.pilaoec.util.jdbc.IBaseEntity;
import br.com.amlabs.pilaoec.util.jdbc.JDBCEntity;
import br.com.amlabs.pilaoec.web.model.integration.response.AmlabsCustomerData;

@JDBCEntity(table = "sec_user")
public class User implements IBaseEntity {

	private Integer Id;
	private String login;
	private Boolean admin;
	private String newpassword;

	private String amlabs_id;
	private String remarks;
	private Double normalPrice;
	private Double expressPrice;
	private Integer normalLeadTime;
	private Integer expressLeadTime;
	private Integer nature;
	private Integer minimumrequest;
	private AmlabsCustomerData amlabsData;

	public User() {
		// TODO Auto-generated method stub

	}

	public User(String login, Boolean admin, String amlabs_id, String remarks, Double normalPrice, Double expressPrice, Integer normalLeadTime, Integer expressLeadTime, Integer minimumrequest, Integer nature) {
		super();
		this.login = login;
		this.admin = admin;
		this.amlabs_id = amlabs_id;
		this.remarks = remarks;
		this.normalPrice = normalPrice;
		this.expressPrice = expressPrice;
		this.normalLeadTime = normalLeadTime;
		this.expressLeadTime = expressLeadTime;
		this.minimumrequest = minimumrequest;
		this.nature = nature;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getAmlabs_id() {
		return amlabs_id;
	}

	public void setAmlabs_id(String amlabs_id) {
		this.amlabs_id = amlabs_id;
	}

	public Integer getNature() {
		return nature;
	}

	public void setNature(Integer nature) {
		this.nature = nature;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Double getNormalPrice() {
		return normalPrice;
	}

	public void setNormalPrice(Double normalPrice) {
		this.normalPrice = normalPrice;
	}

	public Double getExpressPrice() {
		return expressPrice;
	}

	public void setExpressPrice(Double expressPrice) {
		this.expressPrice = expressPrice;
	}

	public Integer getNormalLeadTime() {
		return normalLeadTime;
	}

	public void setNormalLeadTime(Integer normalLeadTime) {
		this.normalLeadTime = normalLeadTime;
	}

	public Integer getExpressLeadTime() {
		return expressLeadTime;
	}

	public void setExpressLeadTime(Integer expressLeadTime) {
		this.expressLeadTime = expressLeadTime;
	}

	public Integer getMinimumrequest() {
		return minimumrequest;
	}

	public void setMinimumrequest(Integer minimumrequest) {
		this.minimumrequest = minimumrequest;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public void setAmlabsData(AmlabsCustomerData amlabsData) {
		this.amlabsData = amlabsData;
	}

	public AmlabsCustomerData getAmlabsData() {
		return amlabsData;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String password) {
		this.newpassword = password;
	}

	public static User createRandomMockClient() {
		User user = new User();
		user.admin = false;
		user.amlabs_id = "10";
		user.login = "client" + (Math.random() * 10000);
		user.setNormalPrice(10.0);
		user.setExpressPrice(10.0);
		user.setNormalLeadTime(5);
		user.setExpressLeadTime(5);
		user.setMinimumrequest(10);
		return user;
	}

}
