
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.UserService;
import domain.User;

@Controller
@RequestMapping("/user/user")
public class UserUserController extends AbstractController {

	@Autowired
	private UserService	userService;


	@RequestMapping(value = "followers", method = RequestMethod.GET)
	public ModelAndView listFollowers() {
		ModelAndView result;
		final Collection<User> followers = this.userService.findByPrincipal().getFollowers();
		result = new ModelAndView("user/followers");
		result.addObject("users", followers);
		return result;
	}

	@RequestMapping(value = "following", method = RequestMethod.GET)
	public ModelAndView listFollowing() {
		ModelAndView result;
		final Collection<User> following = this.userService.findByPrincipal().getFollowing();
		result = new ModelAndView("user/following");
		result.addObject("users", following);
		result.addObject("unfollow", true);
		return result;
	}
}
