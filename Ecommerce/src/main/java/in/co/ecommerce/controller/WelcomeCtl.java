package in.co.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/welcome")
public class WelcomeCtl {

	@GetMapping()
	public String getWelcome() {
		return "Welcome";
	}
	
}
