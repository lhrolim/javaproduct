package br.com.amlabs.pilaoec.web.controllers;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.amlabs.pilaoec.web.model.User;
import br.com.amlabs.pilaoec.web.model.UserDAO;
import br.com.amlabs.pilaoec.web.model.admin.UserSavedResponse;
import br.com.amlabs.pilaoec.web.model.integration.response.ReturnMessage;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminController {

	private static final String CRIADO = "Usuário criado com sucesso";
	private static final String EDITADO = "Usuário salvo com sucesso";

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private AmlabsRestManager restManager;

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

	@RequestMapping(value = "/admin/save", method = RequestMethod.POST)
	@ResponseBody
	public UserSavedResponse SaveUser(@RequestBody User user) throws JsonProcessingException, InterruptedException {
		String data = restManager.getAmlabsUserData(user.getAmlabs_id());
		if (data == null || data.contains("error")) {
			return new UserSavedResponse(user, ReturnMessage.error(String.format("AMLABSID %s não existente", user.getAmlabs_id())));
		}
		String msg = user.getId() == null ? CRIADO : EDITADO;
		user = userDAO.SaveClient(user, user.getNewpassword());
		return new UserSavedResponse(user, ReturnMessage.success(msg));

	}

}
