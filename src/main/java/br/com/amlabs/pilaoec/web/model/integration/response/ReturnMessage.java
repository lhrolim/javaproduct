package br.com.amlabs.pilaoec.web.model.integration.response;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ReturnMessage {

	private String[] success;
	private String[] error;
	private String successmessage;

	public String[] getError() {
		return error;
	}

	public void setError(String[] error) {
		this.error = error;
	}

	public String[] getSuccess() {
		return success;
	}

	public void setSuccess(String[] success) {
		this.success = success;
	}

	public String getSuccessmessage() {
		return successmessage;
	}

	public void setSuccessmessage(String successmessage) {
		this.successmessage = successmessage;
	}

	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		ReturnMessage data = mapper.readValue(GetCustomerData.class.getResourceAsStream("/amlabs-integration/test.json"), ReturnMessage.class);
		System.out.println(data);
	}

}
