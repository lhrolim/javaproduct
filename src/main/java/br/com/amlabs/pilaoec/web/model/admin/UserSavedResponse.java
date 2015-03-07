package br.com.amlabs.pilaoec.web.model.admin;

import br.com.amlabs.pilaoec.web.model.User;
import br.com.amlabs.pilaoec.web.model.integration.response.ReturnMessage;

public class UserSavedResponse {

	private User user;
	private ReturnMessage message;

	public UserSavedResponse() {
		// TODO Auto-generated constructor stub
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ReturnMessage getMessage() {
		return message;
	}

	public void setMessage(ReturnMessage message) {
		this.message = message;
	}

	public UserSavedResponse(User user, ReturnMessage message) {
		super();
		this.user = user;
		this.message = message;
	}

}
