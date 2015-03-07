package br.com.amlabs.pilaoec.web.controllers;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import br.com.amlabs.pilaoec.web.model.integration.IntegrationData;
import br.com.amlabs.pilaoec.web.model.integration.request.AmlabsClientRequestData;
import br.com.amlabs.pilaoec.web.model.integration.response.GetCustomerOperationInterceptor;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class AmlabsRestManager {

	@Autowired
	private IntegrationData integrationData;

	@PostConstruct
	public void init() {
	}

	public String getAmlabsUserData(String customerId) throws JsonProcessingException {
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
