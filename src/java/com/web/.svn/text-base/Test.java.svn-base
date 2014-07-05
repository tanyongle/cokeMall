package com.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.service.TestService;

@Controller  
@RequestMapping(value = "/Test") 
public class Test {
	@Autowired
	private TestService testService;
	
	@RequestMapping(value="/getAll")
	 public ModelAndView getAll() {
		System.out.println("data");
		List<Map<String, Object>> dataList = testService.findAll();
		Map<String, Object> modelMap = new HashMap<String, Object>(7);
		modelMap.put("data" ,dataList);
		ModelAndView view = new ModelAndView(new MappingJacksonJsonView(),modelMap);
		return view;
	 }
}
