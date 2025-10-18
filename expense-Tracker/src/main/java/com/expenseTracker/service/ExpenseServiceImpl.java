package com.expenseTracker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.expenseTracker.model.Expense;
import com.expenseTracker.repository.ExpenseRepository;

@Service
public class ExpenseServiceImpl implements ExpenseService{
	
	@Autowired
	ExpenseRepository repository;

	@Override
	public List<Expense> findAll() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}
	

	@Override
	public void save(Expense expense) {
		// TODO Auto-generated method stub
		expense.setCreatedAt(System.currentTimeMillis());
		repository.save(expense);
	}


	@Override
	public Expense findById(Long id) {
		// TODO Auto-generated method stub
		
		if(repository.findById(id).isPresent())
		{
			return repository.findById(id).get();
		}
		return null;
	}


	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
		Expense expense=findById(id);
		repository.delete(expense);
		
	}

}
