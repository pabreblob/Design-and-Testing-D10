
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.FollowUpRepository;
import security.Authority;
import domain.Actor;
import domain.Article;
import domain.FollowUp;
import domain.TabooWord;
import domain.User;

@Service
@Transactional
public class FollowUpService {

	@Autowired
	private FollowUpRepository	followUpRepository;

	// Supporting services ----------------------------------------------------	
	@Autowired
	private UserService			userService;
	@Autowired
	private TabooWordService	tabooWordService;
	@Autowired
	private ArticleService		newspaperService;
	@Autowired
	private ActorService		actorService;


	// Constructors -----------------------------------------------------------
	public FollowUpService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public FollowUp createFollowUp(final Article a) {
		FollowUp res;
		res = new FollowUp();
		res.setMarked(false);
		res.setArticle(a);
		return res;
	}
	public FollowUp save(final FollowUp followUp) {
		assert followUp != null;
		FollowUp res;
		final User user = this.userService.findByPrincipal();
		Assert.isTrue(followUp.getArticle().getCreator().equals(user));
		Assert.isTrue(followUp.getArticle().isFinalMode());
		final Collection<TabooWord> tw = this.tabooWordService.findAll();
		boolean taboow = false;
		for (final TabooWord word : tw) {
			taboow = followUp.getTitle().toLowerCase().matches(".*\\b" + word.getWord() + "\\b.*");
			taboow |= followUp.getSummary().toLowerCase().matches(".*\\b" + word.getWord() + "\\b.*");
			taboow |= followUp.getBody().toLowerCase().matches(".*\\b" + word.getWord() + "\\b.*");
			if (taboow)
				break;
		}
		if (taboow)
			followUp.setMarked(true);
		res = this.followUpRepository.save(followUp);
		return res;
	}
	public void delete(final FollowUp followUp) {
		assert followUp != null;
		assert followUp.getId() != 0;
		Assert.isTrue(this.followUpRepository.findOne(followUp.getId()) != null);
		final Actor actor = this.actorService.findByPrincipal();
		Assert.isTrue(actor.getUserAccount().getAuthorities().contains(Authority.ADMIN));
		this.followUpRepository.delete(followUp.getId());

	}
	public Collection<FollowUp> findAll() {
		Collection<FollowUp> res;
		Assert.notNull(this.followUpRepository);
		res = this.followUpRepository.findAll();

		return res;
	}

	public FollowUp findOne(final int followUpId) {
		Assert.isTrue(followUpId != 0);
		FollowUp res;
		res = this.followUpRepository.findOne(followUpId);

		return res;
	}

	// Other business methods -------------------------------------------------
	public Collection<FollowUp> findFollowUpsByArticle(final int articleId) {
		final Collection<FollowUp> res = this.followUpRepository.findFollowUpsByArticle(articleId);
		return res;
	}
	public Collection<FollowUp> findFollowUpsByUser(final int userId) {
		final Collection<FollowUp> res = this.followUpRepository.findFollowUpsByUser(userId);
		return res;
	}
	public Collection<FollowUp> findMarkedFollowUpsByUser() {
		final Collection<FollowUp> res = this.followUpRepository.findMarkedFollowUps();
		return res;
	}
}
