package br.com.amlabs.pilaoec.config.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private static final String USER_QUERY = "select login,password,1 from sec_user where login=?";
	private static final String USER_ROLE_QUERY = "select case admin when true then 'ROLE_ADMIN' when false then 'ROLE_CLIENT' end  from sec_user where login=?";
	@Autowired
	private DataSource dataSource;

	@Autowired
	private CustomAuthenticationSuccessHandler customHandler;

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth)
			throws Exception {

		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery(USER_QUERY)
				.passwordEncoder(new ShaPasswordEncoder(512))
				.authoritiesByUsernameQuery(USER_ROLE_QUERY);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/client/**").access("hasRole('ROLE_CLIENT') or hasRole('ROLE_ADMIN')")

				.and().formLogin().loginPage("/").failureUrl("/?error")
				.usernameParameter("username")
				.passwordParameter("password")
				.successHandler(customHandler)
				.and()
.logout()
				.logoutSuccessUrl("/?logout").and().csrf();

	}
}