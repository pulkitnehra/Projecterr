package com.bookstore.service;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookDAO bookDAO;
	private CategoryDAO categoryDAO;
	private EntityManager entityManager;
	public BookServices(HttpServletRequest request, HttpServletResponse response, EntityManager entityManager) {
		super();
		this.request = request;
		this.response = response;
		this.entityManager = entityManager;
		bookDAO = new BookDAO(entityManager);
		categoryDAO = new CategoryDAO(entityManager);
	}
	
	
	public void listBooks() throws ServletException, IOException
	{
		List<Book>listBooks = bookDAO.listAll();
		request.setAttribute("listBooks", listBooks);
		
		String page = "book_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request, response);
	}
	
	
	public void showBookNewForm() throws ServletException, IOException
	{
		List<Category> listCategory  = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		
		String page = "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request, response);
		
	}


	public void createBook() throws ServletException {
		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = null;
		try {
			 publishDate = dateFormat.parse(request.getParameter("publishDate"));
			
		} catch (ParseException e) {
			e.printStackTrace();
			throw new ServletException("Error parsing publishing date(format is MM/dd/yyyy)");
		}
		
		System.out.println("Category Id: "+categoryId);
		System.out.println("Title: "+title);
		System.out.println("Author: "+author);
		System.out.println("Desccription: "+description);
		System.out.println("ISBN: "+isbn);
		System.out.println("Price: "+price);
		System.out.println("Publish Date "+publishDate);
	}
	

}
