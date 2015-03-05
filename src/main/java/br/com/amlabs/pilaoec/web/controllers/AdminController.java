package br.com.amlabs.pilaoec.web.controllers;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.amlabs.pilaoec.web.model.User;
import br.com.amlabs.pilaoec.web.model.UserDAO;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminController {

	@Autowired
	private UserDAO userDAO;

	private static final Logger Log = LogManager.getLogger(AdminController.class);

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() throws JsonProcessingException {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is protected page - Admin Page!");
		model.setViewName("admin");

		List<User> users = userDAO.FindAllClients(1, 100);

		ObjectMapper mapper = new ObjectMapper();
		model.addObject("users", mapper.writeValueAsString(users));

		return model;

	}

	@RequestMapping(value = "/admin/delete", method = RequestMethod.POST)
	@ResponseBody
	public String submit(@RequestParam Integer userid) throws JsonProcessingException, InterruptedException {
		Log.info("deleting user " + userid);
		userDAO.deleteClient(userid);
		return "";
	}

}
