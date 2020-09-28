package com.bookstore.controller.book;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.BookServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/create_book")
public class CreateBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
    public CreateBookServlet() {
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	BookServices bookServices = new BookServices(request, response, entityManager);
    	bookServices.createBook();
	}

}
