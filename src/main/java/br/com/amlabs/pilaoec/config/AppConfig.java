package br.com.amlabs.pilaoec.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import br.com.amlabs.pilaoec.config.security.SecurityConfig;


@EnableWebMvc
@Configuration
@ComponentScan({ "br.com.amlabs*" })
@Import({ SecurityConfig.class })
@ImportResource({ "classpath:META-INF/spring-config.xml" })
public class AppConfig {

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/resources/pages/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
}