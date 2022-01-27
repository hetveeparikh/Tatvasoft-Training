package helperlanduser.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import helperlanduser.model.Customer;

@Component
public class CustomerDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	//create customer
	@Transactional
	public void createCustomer(Customer customer) {
		this.hibernateTemplate.save(customer);
	}
	
	//get all customers
	public List<Customer> getCustomers(){
		List<Customer> customers = this.hibernateTemplate.loadAll(Customer.class);
		return customers;
	}
	
	//delete customer
	@Transactional
	public void deleteCustomer(int id) {
		Customer c = this.hibernateTemplate.load(Customer.class,id);
		this.hibernateTemplate.delete(c);
	}
	
	//get single product
	public Customer getCustomer(int id) {
		return this.hibernateTemplate.get(Customer.class,id);
	}
}
