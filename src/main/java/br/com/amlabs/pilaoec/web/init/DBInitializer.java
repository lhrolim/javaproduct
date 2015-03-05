package br.com.amlabs.pilaoec.web.init;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.amlabs.pilaoec.web.model.UserDAO;

@Component
public class DBInitializer {

	@Autowired
	private UserDAO dao;

	@PostConstruct
	public void init() {
		dao.CreateAdminIfAbsent();
		// for (int i = 0; i < 100; i++) {
		// dao.SaveClient(User.createRandomMockClient(), "client");
		// }
	}

}
