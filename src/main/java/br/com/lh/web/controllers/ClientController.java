package br.com.lh.web.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClientController {


	@RequestMapping(value = { "/client**" }, method = RequestMethod.GET)
	public ModelAndView getData() {
		SecurityContext ctx = SecurityContextHolder.getContext();
		Authentication auth = ctx.getAuthentication();
		Boolean isAdmin = auth.getAuthorities().contains(
				new SimpleGrantedAuthority("ROLE_ADMIN"));
		if (isAdmin) {
			return new ModelAndView("admin");
		}
		return new ModelAndView("home");
	}


}
