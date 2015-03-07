package br.com.amlabs.pilaoec.web.controllers;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.converter.StringHttpMessageConverter;
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
import br.com.amlabs.pilaoec.web.model.User;
import br.com.amlabs.pilaoec.web.model.UserDAO;
import br.com.amlabs.pilaoec.web.model.integration.CreateSalesOrderOperationInterceptor;
import br.com.amlabs.pilaoec.web.model.integration.IntegrationData;
import br.com.amlabs.pilaoec.web.model.integration.request.AmlabsClientRequestData;
import br.com.amlabs.pilaoec.web.model.integration.request.CredentialsData;
import br.com.amlabs.pilaoec.web.model.integration.request.OrderRequestData;
import br.com.amlabs.pilaoec.web.model.integration.request.SalesOrderData;
import br.com.amlabs.pilaoec.web.model.integration.response.GetCustomerOperationInterceptor;
import br.com.amlabs.pilaoec.web.model.integration.response.ReturnMessage;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ClientController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private IntegrationData integrationData;

	private CredentialsData credentialsData;

	public ClientController() {
		super();

	}

	@PostConstruct
	public void init() {
		credentialsData = new CredentialsData(integrationData.getUsername(), integrationData.getPassword());
	}

	@RequestMapping(value = { "/client**" }, method = RequestMethod.GET)
	public ModelAndView getData() throws Exception {
		SecurityContext ctx = SecurityContextHolder.getContext();
		Authentication auth = ctx.getAuthentication();
		ModelAndView model = new ModelAndView();
		model.setViewName("client");

		User user = userDAO.Find(auth.getName());

		// Invoke AMLABS method to get other data
		String amlabsData = getAmlabsUserData(user.getAmlabs_id());
		// user.setAmlabsData(amlabsData);

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
	public ReturnMessage submit(@RequestBody SalesOrderData data) throws InterruptedException, IOException {
		if (integrationData.IsSaveMocked()) {
			Thread.sleep(100);
			return new ReturnMessage();
		}

		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		List<ClientHttpRequestInterceptor> interceptors = new ArrayList<ClientHttpRequestInterceptor>();
		interceptors.add(new CreateSalesOrderOperationInterceptor());
		restTemplate.setInterceptors(interceptors);
		String saveURL = integrationData.getSaveURL();

		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(new OrderRequestData(credentialsData, data));
		String result = restTemplate.postForObject(saveURL, jsonData, String.class);
		ReturnMessage resultMessage = mapper.readValue(result, ReturnMessage.class);
		return resultMessage;
	}

	private String getAmlabsUserData(String customerId) throws KeyManagementException, NoSuchAlgorithmException, IOException {
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		List<ClientHttpRequestInterceptor> interceptors = new ArrayList<ClientHttpRequestInterceptor>();
		interceptors.add(new GetCustomerOperationInterceptor());
		restTemplate.setInterceptors(interceptors);
		String retrieveURL = integrationData.getRetrieveURL();
		if (retrieveURL != null) {
			ObjectMapper mapper = new ObjectMapper();
			String jsonData = mapper.writeValueAsString(AmlabsClientRequestData.forId(customerId));
			String amlabsDataJSON = restTemplate.postForObject(retrieveURL, jsonData, String.class);
			// GetCustomerData customerData = mapper.readValue(amlabsDataJSON,
			// GetCustomerData.class);
			// return customerData.getCustomer();
			return amlabsDataJSON;
		}
		return null;

	}

}
