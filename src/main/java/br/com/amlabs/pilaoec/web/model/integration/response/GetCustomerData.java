package br.com.amlabs.pilaoec.web.model.integration.response;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class GetCustomerData {

	private AmlabsCustomerData customer;

	public AmlabsCustomerData getCustomer() {
		return customer;
	}

	public void setCustomer(AmlabsCustomerData customer) {
		this.customer = customer;
	}

	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		GetCustomerData data = mapper.readValue(GetCustomerData.class.getResourceAsStream("/amlabs-integration/test.json"), GetCustomerData.class);
		System.out.println(data);
	}

}
