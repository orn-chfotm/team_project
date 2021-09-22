package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.service.LocationService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/Location")
@AllArgsConstructor
public class LocationController {
	
	private LocationService locationService;
	
	@GetMapping("/map")
	public void map() {}
	
	@GetMapping("/information")
	public void information(Model model,Criteria cri) {
		int cnt=locationService.getCountLocation(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,cnt));
	}
	
	@GetMapping("/description")
	public void description(@RequestParam int location_num, Model model,Criteria cri) {
		int cnt=locationService.getCountLocation(cri);
		model.addAttribute("getLocation",locationService.getLocation(location_num));
		model.addAttribute("pageMaker",new PageDTO(cri,cnt));
	}
}
