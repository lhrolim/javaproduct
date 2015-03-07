package br.com.amlabs.pilaoec.web.model.integration.response;


public class ReturnMessage {

	private String[] success;
	private String[] error;
	private String successmessage;

	public ReturnMessage() {
		// TODO Auto-generated constructor stub
	}


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

	public static ReturnMessage success(String msg) {
		ReturnMessage returnMessage = new ReturnMessage();
		returnMessage.setSuccessmessage(msg);
		returnMessage.setSuccess(new String[] { "OK" });
		return returnMessage;
	}

	public static ReturnMessage error(String msg) {
		ReturnMessage returnMessage = new ReturnMessage();
		returnMessage.setError(new String[] { msg });
		return returnMessage;
	}



}
