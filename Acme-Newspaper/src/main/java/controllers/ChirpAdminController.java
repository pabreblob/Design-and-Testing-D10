
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ChirpService;
import domain.Chirp;

@Controller
@RequestMapping("/chirp/admin")
public class ChirpAdminController extends AbstractController {

	@Autowired
	private ChirpService	chirpService;


	@RequestMapping(value = "/list-marked")
	public ModelAndView listMarked() {
		ModelAndView res;
		final Collection<Chirp> marked = this.chirpService.findMarked();

		res = new ModelAndView("chirp/list-marked");
		res.addObject("marked", marked);

		return res;
	}

	@RequestMapping(value = "/delete")
	public ModelAndView delete(@RequestParam final int chirpId) {
		final Chirp c = this.chirpService.findOne(chirpId);
		ModelAndView res;

		try {
			this.chirpService.delete(c);
			res = new ModelAndView("chirp/list-marked");
		} catch (final Throwable oops) {
			res = new ModelAndView("chirp/list-marked");
			res.addObject("message", "chirp.error");
		}
		return res;
	}

}
