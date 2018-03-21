package fun.deepsky.service;

import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fun.deepsky.service.HelloApplication;

@SpringBootApplication
@Controller
public class HelloApplication {
	public static void main(String[] args) {
		new SpringApplication(HelloApplication.class).run(args);
	}
    @RequestMapping(value="/index",method=RequestMethod.GET)
	public String helloJsp(Map<String,Object> map){
		 return "index";
	}
}
