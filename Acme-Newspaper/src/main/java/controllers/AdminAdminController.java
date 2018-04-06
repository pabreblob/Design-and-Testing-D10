
package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AdminService;

@Controller
@RequestMapping("/admin/admin")
public class AdminAdminController extends AbstractController {

	@Autowired
	AdminService	adminService;


	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard() {
		final ModelAndView res = new ModelAndView("admin/dashboard");
		return res;
	}

}
