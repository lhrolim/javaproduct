package br.com.lh.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth)
			throws Exception {
		auth.inMemoryAuthentication().withUser("client").password("123456")
				.roles("CLIENT");
		auth.inMemoryAuthentication().withUser("admin").password("123456")
				.roles("ADMIN");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests().antMatchers("/admin/**")
				.access("hasRole('ROLE_ADMIN')").antMatchers("/home/**")
				.access("hasRole('ROLE_CLIENT') or hasRole('ROLE_ADMIN')")

				.and().formLogin()
				.loginPage("/login").failureUrl("/login?error")
				.usernameParameter("username").passwordParameter("password")
.defaultSuccessUrl("/home").and()
				.logout().logoutSuccessUrl("/login?logout").and().csrf();

	}
}