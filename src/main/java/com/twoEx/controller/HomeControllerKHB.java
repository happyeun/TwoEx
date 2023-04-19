package com.twoEx.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.twoEx.bean.BuyerBean;
import com.twoEx.bean.ClassroomBean;
import com.twoEx.service.ClassroomManagement;
import com.twoEx.service.Master;

@Controller
public class HomeControllerKHB {
	@Autowired
	private ClassroomManagement cm;
	@Autowired
	private Master ma;
	
	@PostMapping("/moveSellerMyClass")
	public ModelAndView moveAccountInfo (ModelAndView mav, @ModelAttribute ClassroomBean cb) {
		System.out.println("moveSellerMyClass");
		mav.addObject(cb);
		cm.backController("moveSellerMyClass", mav);
		return mav;
	}	
	/*
	@PostMapping("/moveManageCurriculum")
	public ModelAndView moveManageCurriculum (ModelAndView mav, @ModelAttribute ClassroomBean cb) {
		System.out.println("moveManageCurriculum");
		mav.addObject(cb);
		cm.backController("moveManageCurriculum", mav);
		return mav;
	}
	*/	
	@PostMapping("/moveManageStudent")
	public ModelAndView moveManageStudent (ModelAndView mav, @ModelAttribute ClassroomBean cb) {
		System.out.println("moveManageStudent");
		mav.addObject(cb);
		cm.backController("moveManageStudent", mav);
		return mav;
	}	
	@PostMapping("/moveManageAssignment")
	public ModelAndView moveManageAssignment (ModelAndView mav, @ModelAttribute ClassroomBean cb) {
		System.out.println("moveManageAssignment");
		mav.addObject(cb);
		cm.backController("moveManageAssignment", mav);
		return mav;
	}	
	@PostMapping("/moveManageGrade")
	public ModelAndView moveManageGrade (ModelAndView mav, @ModelAttribute ClassroomBean cb) {
		System.out.println("moveManageGrade");
		mav.addObject(cb);
		cm.backController("moveManageGrade", mav);
		return mav;
	}	
	@PostMapping("/moveManageNotice")
	public ModelAndView moveManageNotice (ModelAndView mav, @ModelAttribute ClassroomBean cb) {
		System.out.println("moveManageNotice");
		mav.addObject(cb);
		cm.backController("moveManageNotice", mav);
		return mav;
	}	
	@PostMapping("/moveManageMap")
	public ModelAndView moveManageMap (ModelAndView mav, @ModelAttribute ClassroomBean cb) {
		System.out.println("moveManageMap");
		mav.addObject(cb);
		cm.backController("moveManageMap", mav);
		return mav;
	}	
	@PostMapping("/moveAssignmentDetail")
	public ModelAndView moveAssignmentDetail (ModelAndView mav, @RequestParam Map<String, String> data, @ModelAttribute ClassroomBean cb) {
		System.out.println("moveAssignmentDetail");
		mav.addObject("data", data);
		mav.addObject(cb);
		cm.backController("moveAssignmentDetail", mav);
		return mav;
	}	
	
	@RequestMapping(value = "/master", method = RequestMethod.GET)
	public String master(Model model) {
		System.out.println("master");
		return "master";
	}
	
	@PostMapping("/masterInsert")
	public ModelAndView masterInsert (ModelAndView mav, @ModelAttribute BuyerBean bb) {
		System.out.println("masterInsert");
		mav.addObject(bb);
		ma.masterInsert(mav);
		return mav;
	}	
	
	@PostMapping("/masterLogIn")
	public ModelAndView masterLogIn (ModelAndView mav, @ModelAttribute BuyerBean bb) {
		System.out.println("masterLogIn");
		mav.addObject(bb);
		ma.masterLogIn(mav);
		return mav;
	}	
}