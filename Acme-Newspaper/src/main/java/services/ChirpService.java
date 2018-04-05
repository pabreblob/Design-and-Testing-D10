
package services;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ChirpRepository;
import domain.Chirp;
import domain.TabooWord;
import domain.User;

@Service
@Transactional
public class ChirpService {

	@Autowired
	private ChirpRepository		chirpRepository;
	@Autowired
	private UserService			userService;
	@Autowired
	private TabooWordService	tabooWordService;


	public ChirpService() {
		super();
	}

	public Chirp create() {
		final User c = this.userService.findByPrincipal();
		Assert.notNull(c);

		final Chirp res = new Chirp();

		final Date moment = new Date(System.currentTimeMillis() - 1000);

		res.setMarked(false);
		res.setCreator(c);
		res.setMoment(moment);

		return res;
	}

	public Chirp save(final Chirp c) {
		Assert.notNull(c);
		Assert.isTrue(c.getId() == 0);
		final User p = this.userService.findByPrincipal();
		Assert.isTrue(c.getCreator().equals(p));

		final Date moment = new Date(System.currentTimeMillis() - 1000);
		c.setMoment(moment);

		final Collection<TabooWord> tws = this.tabooWordService.findAll();
		for (final TabooWord t : tws)
			c.setMarked(c.getDescription().toLowerCase().matches(".*\\b" + t.getWord() + "\\b.*") || c.getTitle().toLowerCase().matches(".*\\b" + t.getWord() + "\\b.*"));

		final Chirp res = this.chirpRepository.save(c);

		return res;

	}

	public Chirp findOne(final int chirpId) {
		Assert.isTrue(chirpId > 0);
		return this.chirpRepository.findOne(chirpId);
	}

	public Collection<Chirp> findAll() {
		return this.chirpRepository.findAll();
	}

	//Other

	public Collection<Chirp> findByCreatorId(final int creatorId) {
		return this.chirpRepository.findByCreatorId(creatorId);
	}

	public Collection<Chirp> findMarked() {
		return this.chirpRepository.findMarked();
	}

}
