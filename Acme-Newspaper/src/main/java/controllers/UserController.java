
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.UserService;
import domain.User;
import forms.UserForm;

@Controller
@RequestMapping("/user")
public class UserController extends AbstractController {

	@Autowired
	private UserService	userService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<User> users;

		users = this.userService.findAll();

		result = new ModelAndView("user/list");
		result.addObject("users", users);

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		final UserForm userForm = new UserForm();

		result = new ModelAndView("user/edit");
		result.addObject("userForm", userForm);

		return result;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST, params = "save")
	public ModelAndView save(final UserForm userForm, final BindingResult binding) {
		ModelAndView result;
		final User user = this.userService.reconstruct(userForm, binding);
		if (binding.hasErrors()) {
			result = this.createEditModelAndView(userForm);
			System.out.println("Error general");
			System.out.println(binding.getAllErrors());
		} else if (userForm.isAcceptTerms() == false) {
			result = this.createEditModelAndView(userForm, "user.notAccepted.error");
			System.out.println("No aceptado los términos");
		} else if (!(userForm.getConfirmPass().equals(userForm.getUserAccount().getPassword()))) {
			result = this.createEditModelAndView(userForm, "user.differentPass.error");
			System.out.println("Contraseñas distintas");
		} else
			try {
				this.userService.save(user);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(userForm, "user.commit.error");
				System.out.println("Error grave");
				System.out.println(oops.getMessage());
			}
		return result;

	}

	protected ModelAndView createEditModelAndView(final UserForm userForm) {
		final ModelAndView result;
		result = this.createEditModelAndView(userForm, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final UserForm userForm, final String messageCode) {
		final ModelAndView result;
		result = new ModelAndView("user/edit");
		result.addObject("userForm", userForm);
		result.addObject("message", messageCode);
		return result;
	}
}
