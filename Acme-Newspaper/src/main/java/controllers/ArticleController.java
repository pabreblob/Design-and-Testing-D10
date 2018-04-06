
package controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ArticleService;
import domain.Article;

@Controller
@RequestMapping("/article")
public class ArticleController extends AbstractController {

	@Autowired
	ArticleService	articleService;


	//	Displaying
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int articleId) {
		ModelAndView res;
		final Article article = this.articleService.findOne(articleId);
		Assert.isTrue(article.getNewspaper().isFree());
		final String requestURI = "article/display.do";
		final List<String> pictures = new ArrayList<String>(article.getPictureUrls());
		final boolean hasPictures = !pictures.isEmpty();

		res = new ModelAndView("article/display");
		res.addObject("article", article);
		res.addObject("pictures", pictures);
		res.addObject("hasPictures", hasPictures);
		res.addObject("requestURI", requestURI);

		return res;
	}

}