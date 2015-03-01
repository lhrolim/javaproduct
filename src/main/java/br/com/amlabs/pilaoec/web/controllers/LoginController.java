package br.com.amlabs.pilaoec.web.controllers;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {

			Boolean isAdmin = auth.getAuthorities().contains(
					new SimpleGrantedAuthority("ROLE_ADMIN"));
			if (isAdmin) {
				return new ModelAndView("forward:/admin");
			} else {
				return new ModelAndView("forward:/client");
			}
		}

		ModelAndView model = new ModelAndView("login");
		if (error != null) {
			model.addObject("error", "Usu�rio ou senha inv�lidos");
		}
		return model;
	}

}
