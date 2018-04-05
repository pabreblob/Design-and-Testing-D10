
package services;

import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.NewspaperRepository;
import security.LoginService;
import domain.Article;
import domain.Newspaper;
import domain.Subscription;

@Service
@Transactional
public class NewspaperService {

	@Autowired
	private NewspaperRepository	newspaperRepository;

	@Autowired
	private UserService			userService;

	@Autowired
	private ArticleService		articleService;

	@Autowired
	SubscriptionService			subscriptionService;


	public Newspaper create() {
		final Newspaper res = new Newspaper();
		res.setCreator(this.userService.findByPrincipal());
		return res;
	}
	public Collection<Newspaper> findAll() {
		return this.newspaperRepository.findAll();
	}

	public Newspaper findOne(final int newspaperId) {
		final Newspaper res = this.newspaperRepository.findOne(newspaperId);
		return res;
	}

	public Newspaper save(final Newspaper newspaper) {
		if (newspaper.getId() != 0)
			Assert.isTrue(this.findOne(newspaper.getId()).getCreator().equals(this.userService.findByPrincipal()));
		Assert.isNull(newspaper.getPublicationDate());

		//Comprobar si tiene palabras de spam y ponerlo a sospechoso
		final Newspaper saved = this.newspaperRepository.save(newspaper);
		return saved;
	}

	public void publish(final int newspaperId) {
		assert newspaperId != 0;
		final Date publicationDate = new Date(System.currentTimeMillis() - 10000);
		final Newspaper newspaper = this.findOne(newspaperId);
		Assert.notNull(newspaper);
		Assert.isTrue(this.userService.findByPrincipal().equals(newspaper.getCreator()));
		Assert.isNull(newspaper.getPublicationDate());
		for (final Article a : this.articleService.findArticlesByNewspaper(newspaperId)) {
			Assert.isTrue(a.isFinalMode());
			a.setMoment(publicationDate);
		}

		newspaper.setPublicationDate(publicationDate);
	}
	public void delete(final int newspaperId) {
		assert newspaperId != 0;
		final Newspaper newspaper = this.findOne(newspaperId);
		Assert.notNull(newspaper);
		for (final Article a : this.articleService.findArticlesByNewspaper(newspaperId))
			this.articleService.delete(a);
		System.out.println(newspaperId);
		System.out.println(this.subscriptionService.getSubscriptionByNewspaper(newspaperId));
		for (final Subscription s : this.subscriptionService.getSubscriptionByNewspaper(newspaperId))
			this.subscriptionService.delete(s.getId());
		this.newspaperRepository.delete(newspaperId);
	}

	public Collection<Newspaper> findMarkedNewspaper() {
		return this.newspaperRepository.findMarkedNewspaper();
	}

	public Collection<Newspaper> findPublicatedNewspaper() {
		return this.newspaperRepository.findPublicatedNewspaper();
	}

	public Collection<Newspaper> findNotPublicatedNewspaper() {
		return this.newspaperRepository.findNotPublicatedNewspaper();
	}

	public Collection<Newspaper> findNewspaperCreatedByPrincipal() {
		return this.newspaperRepository.findNewspaperCreatedByUserAccountId(LoginService.getPrincipal().getId());
	}

	public Collection<Newspaper> findTripsByKeyword(final String keyword) {
		return this.newspaperRepository.findTripsByKeyword(keyword);
	}
}
