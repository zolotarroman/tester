package com.softserve.webtester.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.softserve.webtester.model.Service;
import com.softserve.webtester.service.MetaDataService;
import com.softserve.webtester.service.UserService;

@Controller
//@RequestMapping(value = "/metadata")
public class MetaDataController {

    @Autowired
    private MetaDataService metaDataService;
    
    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "/metadata", method = RequestMethod.GET)
	public ModelAndView getMetadataPage() {
		ModelAndView modelAndView = new ModelAndView("metadata");
		return modelAndView;
    }

	@RequestMapping(value = "/service", method = RequestMethod.GET)
	public ModelAndView getServicePage() {
		ModelAndView modelAndView = new ModelAndView("service");

		String authenticationName = SecurityContextHolder.getContext().getAuthentication().getName();
		// User user = userService.load(authenticationName);
		List<Service> services = metaDataService.serviceLoadAll();

		modelAndView.addObject("services", services);
		return modelAndView;
	}
}