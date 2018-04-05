
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.CustomerRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import security.UserAccountService;
import domain.Customer;

@Service
@Transactional
public class CustomerService {

	@Autowired
	private CustomerRepository	customerRepository;

	@Autowired
	private UserAccountService	userAccountService;


	public CustomerService() {
		super();
	}

	public Customer create() {
		final Customer res = new Customer();

		final UserAccount ua = this.userAccountService.create();
		res.setUserAccount(ua);

		final List<Authority> authorities = new ArrayList<Authority>();
		final Authority auth = new Authority();
		auth.setAuthority(Authority.CUSTOMER);
		authorities.add(auth);
		res.getUserAccount().setAuthorities(authorities);

		return res;
	}

	public Customer save(final Customer customer) {
		Assert.notNull(customer);

		if (customer.getId() == 0) {
			final Md5PasswordEncoder encoder = new Md5PasswordEncoder();
			final String hash = encoder.encodePassword(customer.getUserAccount().getPassword(), null);
			customer.getUserAccount().setPassword(hash);
		}

		final List<Authority> authorities = new ArrayList<Authority>();
		final Authority auth = new Authority();
		auth.setAuthority(Authority.CUSTOMER);
		authorities.add(auth);
		customer.getUserAccount().setAuthorities(authorities);
		final UserAccount ua = this.userAccountService.save(customer.getUserAccount());
		customer.setUserAccount(ua);
		final Customer res = this.customerRepository.save(customer);
		return res;
	}

	public Customer findOne(final int idCustomer) {
		Assert.isTrue(idCustomer != 0);
		final Customer res = this.customerRepository.findOne(idCustomer);
		return res;
	}

	public Collection<Customer> findAll() {
		final Collection<Customer> res;
		res = this.customerRepository.findAll();
		return res;
	}

	public Customer findByUserAccountId(final int customerAccountId) {
		Assert.isTrue(customerAccountId != 0);
		Customer res;
		res = this.customerRepository.findCustomerByUserAccountId(customerAccountId);
		return res;
	}

	public Customer findByPrincipal() {
		final UserAccount u = LoginService.getPrincipal();
		final Customer res = this.customerRepository.findCustomerByUserAccountId(u.getId());
		return res;
	}
}
