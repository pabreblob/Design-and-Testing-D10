
package controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ArticleService;
import domain.Article;

@Controller
@RequestMapping("/article/admin")
public class ArticleAdminController extends AbstractController {

	@Autowired
	ArticleService	articleService;


	//	Displaying
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int articleId) {
		ModelAndView res;
		final Article article = this.articleService.findOne(articleId);
		final String requestURI = "article/admin/display.do";
		final List<String> pictures = new ArrayList<String>(article.getPictureUrls());
		final boolean hasPictures = !pictures.isEmpty();

		res = new ModelAndView("article/display");
		res.addObject("article", article);
		res.addObject("pictures", pictures);
		res.addObject("hasPictures", hasPictures);
		res.addObject("requestURI", requestURI);

		return res;
	}
	//	Listing
	@RequestMapping(value = "/list-marked", method = RequestMethod.GET)
	public ModelAndView listMarked() {
		ModelAndView res;
		final Collection<Article> articles = this.articleService.findMarkedArticlesByUser();
		final String requestURI = "article/admin/list-marked.do";
		res = new ModelAndView("article/list");
		res.addObject("articles", articles);
		res.addObject("requestURI", requestURI);

		return res;
	}
	//	Deleting
	@RequestMapping(value = "/delete")
	public ModelAndView delete(@RequestParam final int articleId) {
		ModelAndView res;
		final Article article = this.articleService.findOne(articleId);

		this.articleService.delete(article);
		res = new ModelAndView("redirect:list-marked.do");

		return res;
	}

}
