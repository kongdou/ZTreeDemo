package fun.deepsky.service;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HelloController {

    @RequestMapping(value="/json",method=RequestMethod.GET)
	public String getJson(Map<String,Object> map){
    	 String json = "{result:[{id:1,pId:0,name:\"父节点\"},{id:11,pId:1,name:\"子节点1\"},{id:12,pId:1,name:\"子节点2\"},{id:13,pId:1,name:\"子节点3\"},{id:131,pId:13,name:\"子节点31\"}]}";
		 return json;
	}
    
}
