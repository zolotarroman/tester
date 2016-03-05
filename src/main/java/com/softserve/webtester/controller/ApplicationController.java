package com.softserve.webtester.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.softserve.webtester.model.Application;
import com.softserve.webtester.service.MetaDataService;

@Controller
@RequestMapping(value = "/application")
public class ApplicationController {

    @Autowired
    private MetaDataService metaDataService;
    
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getApplicationList() {
		ModelAndView modelAndView = new ModelAndView("application");

		List<Application> applications = metaDataService.applicationLoadAll();
		modelAndView.addObject("applications", applications);
		return modelAndView;
	}
    
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView getApplication(@PathVariable(value = "id") Integer applicationId) {
		ModelAndView modelAndView = new ModelAndView("application_modify");

		Application application = metaDataService.applicationLoad(applicationId);
		modelAndView.addObject("application", application);
		return modelAndView;
	}
}