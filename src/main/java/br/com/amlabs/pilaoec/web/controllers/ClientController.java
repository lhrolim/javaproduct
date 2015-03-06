package br.com.amlabs.pilaoec.web.controllers;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.ClientHttpRequestInterceptor;
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

import br.com.amlabs.pilaoec.web.model.ClientData;
import br.com.amlabs.pilaoec.web.model.ClientRequestData;
import br.com.amlabs.pilaoec.web.model.User;
import br.com.amlabs.pilaoec.web.model.UserDAO;
import br.com.amlabs.pilaoec.web.model.integration.IntegrationData;
import br.com.amlabs.pilaoec.web.model.integration.OperationInterceptor;
import br.com.amlabs.pilaoec.web.model.integration.request.AmlabsClientRequestData;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ClientController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private IntegrationData integrationData;

	@RequestMapping(value = { "/client**" }, method = RequestMethod.GET)
	public ModelAndView getData() throws Exception {
		SecurityContext ctx = SecurityContextHolder.getContext();
		Authentication auth = ctx.getAuthentication();
		ModelAndView model = new ModelAndView();
		model.setViewName("client");

		User user = userDAO.Find(auth.getName());

		// Invoke AMLABS method to get other data
		String amlabsData = getAmlabsUserData(user.getAmlabs_id());
//		user.setAmlabsData(amlabsData);

		ClientData clientData = new ClientData();

		clientData.setUser(user);
		// clientData.setProductImg();

		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(clientData);
		model.addObject("clientdata", jsonData);
		model.addObject("amlabsdata", amlabsData);

		return model;
	}

	@RequestMapping(value = "/submitclient", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	@ResponseBody
	public String submit(@RequestBody ClientRequestData data) throws JsonProcessingException, InterruptedException {
		if (integrationData.IsSaveMocked()) {
			Thread.sleep(100);
		}
		return "";
	}

	private String getAmlabsUserData(String customerId) throws KeyManagementException, NoSuchAlgorithmException, IOException {
		RestTemplate restTemplate = new RestTemplate();
		List<ClientHttpRequestInterceptor> interceptors = new ArrayList<ClientHttpRequestInterceptor>();
		interceptors.add(new OperationInterceptor());
		restTemplate.setInterceptors(interceptors);
		String retrieveURL = integrationData.getRetrieveURL();
		if (retrieveURL != null) {
			ObjectMapper mapper = new ObjectMapper();
			String jsonData = mapper.writeValueAsString(AmlabsClientRequestData.forId(customerId));
			String amlabsDataJSON = restTemplate.postForObject(retrieveURL, jsonData, String.class);
//			GetCustomerData customerData = mapper.readValue(amlabsDataJSON, GetCustomerData.class);
//			return customerData.getCustomer();
			return amlabsDataJSON;
		}
		return null;

	}

}
