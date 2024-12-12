package com.ext.view.information;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ext.model.information.informationVO;

@Controller
public class InformationController {
	
	@RequestMapping("/useinformation")
	public String useinformation(informationVO vo) { return "information/useinformation"; }
	@RequestMapping("/fareinformation")
	public String fareinformation(informationVO vo) { return "information/fareinformation"; }
	@RequestMapping("/facilityinformation")
	public String facilityinformation(informationVO vo) { return "information/facilityinformation"; }
	@RequestMapping("/locationinformation")
	public String locationinformation(informationVO vo) { return "information/locationinformation"; }
	@RequestMapping("/cooperator")
	public String cooperator(informationVO vo) { return "information/cooperator"; }
}
