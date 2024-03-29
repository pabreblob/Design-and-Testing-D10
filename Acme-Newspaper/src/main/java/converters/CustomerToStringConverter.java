
package converters;

import org.springframework.core.convert.converter.Converter;

import domain.Customer;

public class CustomerToStringConverter implements Converter<Customer, String> {

	@Override
	public String convert(final Customer customer) {
		String result;
		if (customer == null)
			result = null;
		else
			result = String.valueOf(customer.getId());
		return result;
	}

}
