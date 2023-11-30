package com.kh.mbting.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.mbting.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("adminMain.ad")
	public String adminMain() {
		
		return "admin/adminMainPage";
	}
	
	
}
