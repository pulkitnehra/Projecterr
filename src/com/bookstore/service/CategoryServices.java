package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.admin.user.ListUserServlet;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Category;

public class CategoryServices {
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private EntityManager entityManager;
	public CategoryServices(HttpServletRequest request,EntityManager entityManager, HttpServletResponse response) {
		super();
		this.request = request;
		this.entityManager = entityManager;
		this.response = response;
		
		categoryDAO = new CategoryDAO(entityManager);
		
	}


	public void listCategory(String message) throws ServletException, IOException {
		
		List<Category> listcategory = categoryDAO.listAll();
		request.setAttribute("listcategory", listcategory);
		if(message != null) {
		request.setAttribute("message",	 message);
		}
		String path = "category_list.jsp";
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);
		requestDispatcher.forward(request, response);
	}

	public void listCategory() throws ServletException, IOException {
		
		listCategory(null);
	}

	public void createcategory() throws IOException, ServletException {
		
		String categoryName = request.getParameter("name");
		Category existingcategoryname = categoryDAO.findByName(categoryName);
		
		if(existingcategoryname != null)
		{
			
			String msg = "Cannot create Category. A Category with name "+ categoryName +" already exists";
			request.setAttribute("message", msg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
			
		}else {
			
			Category category = new Category(categoryName);
			categoryDAO.create(category);
			String message = "New Category created successfully!!";
			listCategory(message);
			
			
		}
		
	}


	public void editCategory() throws ServletException, IOException {
		Integer categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);
		request.setAttribute("category", category);
		
		String editPath = "category_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editPath);
		dispatcher.forward(request, response);	
	}


	public void updateCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("name");
		
		Category existingCategoryId = categoryDAO.get(categoryId);
		Category existingCategoryName = categoryDAO.findByName(categoryName);
		if(existingCategoryName != null && existingCategoryId.getCategoryId() != existingCategoryName.getCategoryId())
		{
			String message = "Could not Update Category. A Category with name "+categoryName+" already exists";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		}else { 
			
			existingCategoryId.setName(categoryName);
			categoryDAO.update(existingCategoryId);
			String message1 = "Category Updated successfully!!";
			listCategory(message1);
			
		}
		
	}


	public void deleteUser() throws ServletException, IOException {
		
		int categoryId = Integer.parseInt(request.getParameter("id"));
		categoryDAO.delete(categoryId);
		
		String message = "The categorey with CategoryID "+categoryId+" removed successfully!";
		listCategory(message);
	}
	
	
	
	
	
}
