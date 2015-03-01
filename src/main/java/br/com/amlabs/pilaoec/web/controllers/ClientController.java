package br.com.amlabs.pilaoec.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.amlabs.pilaoec.web.model.User;
import br.com.amlabs.pilaoec.web.model.UserDAO;

@Controller
public class ClientController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(value = { "/client**" }, method = RequestMethod.GET)
	public ModelAndView getData() {
		SecurityContext ctx = SecurityContextHolder.getContext();
		Authentication auth = ctx.getAuthentication();
		User user = userDAO.Find(auth.getName());

		return new ModelAndView("client");
	}


}
