package br.com.amlabs.pilaoec.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import br.com.amlabs.pilaoec.web.model.AmlabsUserData;
import br.com.amlabs.pilaoec.web.model.ClientData;
import br.com.amlabs.pilaoec.web.model.ClientRequestData;
import br.com.amlabs.pilaoec.web.model.User;
import br.com.amlabs.pilaoec.web.model.UserDAO;
import br.com.amlabs.pilaoec.web.model.integration.IntegrationData;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ClientController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private IntegrationData integrationData;

	@RequestMapping(value = { "/client**" }, method = RequestMethod.GET)
	public ModelAndView getData() throws JsonProcessingException {
		SecurityContext ctx = SecurityContextHolder.getContext();
		Authentication auth = ctx.getAuthentication();
		ModelAndView model = new ModelAndView();
		model.setViewName("client");

		User user = userDAO.Find(auth.getName());

		// Invoke AMLABS method to get other data
		AmlabsUserData amlabsData = getAmlabsUserData();
		user.setAmlabsData(amlabsData);

		ClientData clientData = new ClientData();

		clientData.setUser(user);
		// clientData.setProductImg();

		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(clientData);
		model.addObject("clientdata", jsonData);

		return model;
	}

	@RequestMapping(value = { "/client2**" }, method = RequestMethod.GET)
	public ModelAndView getData2() throws JsonProcessingException {
		SecurityContext ctx = SecurityContextHolder.getContext();
		Authentication auth = ctx.getAuthentication();
		ModelAndView model = new ModelAndView();
		model.setViewName("client2");

		User user = userDAO.Find(auth.getName());

		// Invoke AMLABS method to get other data
		AmlabsUserData amlabsData = getAmlabsUserData();
		user.setAmlabsData(amlabsData);

		ClientData clientData = new ClientData();

		clientData.setUser(user);
		// clientData.setProductImg();

		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(clientData);
		model.addObject("clientdata", jsonData);

		return model;
	}

	@RequestMapping(value = "/submitclient", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	@ResponseBody
	public String submit(@RequestBody ClientRequestData data) throws JsonProcessingException, InterruptedException {
		if (integrationData.IsSaveMocked()) {
			Thread.sleep(1000);
		}
		return "";
	}

	private AmlabsUserData getAmlabsUserData() {
		RestTemplate restTemplate = new RestTemplate();
		String retrieveURL = integrationData.getRetrieveURL();
		if (retrieveURL != null) {
			AmlabsUserData amlabsData = restTemplate.getForObject(retrieveURL, AmlabsUserData.class);
			return amlabsData;
		}
		return AmlabsUserData.MockInstance();

	}

}
