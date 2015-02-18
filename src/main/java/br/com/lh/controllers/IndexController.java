package br.com.lh.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getData() {
		ModelAndView model = new ModelAndView("index");
		
		return model;
	}
	
	

}
