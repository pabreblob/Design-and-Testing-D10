
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ArticleRepository;
import security.Authority;
import domain.Actor;
import domain.Article;
import domain.FollowUp;
import domain.TabooWord;
import domain.User;

@Service
@Transactional
public class ArticleService {

	@Autowired
	private ArticleRepository	articleRepository;

	// Supporting services ----------------------------------------------------	
	@Autowired
	private UserService			userService;
	@Autowired
	private TabooWordService	tabooWordService;
	@Autowired
	private NewspaperService	newspaperService;
	@Autowired
	private ActorService		actorService;
	@Autowired
	private FollowUpService		followUpService;


	// Constructors -----------------------------------------------------------
	public ArticleService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public Article createArticle() {
		final User creator = this.userService.findByPrincipal();
		final Article res = this.createArticle();
		res.setCreator(creator);
		res.setMarked(false);
		return res;
	}
	public Article save(final Article article) {
		assert article != null;
		Article res;
		final User user = this.userService.findByPrincipal();
		Assert.isTrue(article.getCreator().equals(user));
		Assert.isTrue(!article.isFinalMode());
		final Collection<TabooWord> tw = this.tabooWordService.findAll();
		boolean taboow = false;
		for (final TabooWord word : tw) {
			taboow = article.getTitle().toLowerCase().matches(".*\\b" + word.getWord() + "\\b.*");
			taboow |= article.getSummary().toLowerCase().matches(".*\\b" + word.getWord() + "\\b.*");
			taboow |= article.getBody().toLowerCase().matches(".*\\b" + word.getWord() + "\\b.*");
			if (taboow)
				break;
		}
		if (taboow)
			article.setMarked(true);
		res = this.articleRepository.save(article);
		return res;
	}
	public void delete(final Article article) {
		assert article != null;
		assert article.getId() != 0;
		Assert.isTrue(this.articleRepository.findOne(article.getId()) != null);
		final Actor actor = this.actorService.findByPrincipal();
		Assert.isTrue(actor.getUserAccount().getAuthorities().contains(Authority.ADMIN));
		final Collection<FollowUp> followups = this.followUpService.findFollowupsByArticle(article.getId());
		for (final FollowUp f : followups)
			this.followUpService.delete(f);
		this.articleRepository.delete(article.getId());

	}
	public Collection<Article> findAll() {
		Collection<Article> res;
		Assert.notNull(this.articleRepository);
		res = this.articleRepository.findAll();

		return res;
	}

	public Article findOne(final int articleId) {
		Assert.isTrue(articleId != 0);
		Article res;
		res = this.articleRepository.findOne(articleId);

		return res;
	}

	// Other business methods -------------------------------------------------
	public Collection<Article> findArticlesByNewspaper(final int newspaperId) {
		final Collection<Article> res = this.articleRepository.findArticlesByNewspaper(newspaperId);
		return res;
	}
	public Collection<Article> findPublishedArticlesByUser(final int userId) {
		final Collection<Article> res = this.articleRepository.findPublishedArticlesByUser(userId);
		return res;
	}
}
