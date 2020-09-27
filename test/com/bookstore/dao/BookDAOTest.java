package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;


public class BookDAOTest extends BaseDAOTest {
	
	private static BookDAO bookDAO;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	
		BaseDAOTest.setUpBeforeClass();
		bookDAO = new BookDAO(entityManager);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("Advanced Java");
		category.setCategoryId(2);
		newBook.setCategory(category );
		newBook.setTitle("Effective Java (2nd Edition)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing, the for-each loop, varargs, concurrency utilities, and much more");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");
		
		DateFormat DateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = DateFormat.parse("05/28/2008");
		newBook.setPublishDate(publishDate );
		
		
		String imagePath = "C:\\Users\\nehra\\Downloads\\dummy-data-books\\books\\Effective Java.JPG";
		byte[] imagebytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imagebytes);
		
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	
	}
	
	@Test
	public void testCreate2ndBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("Java Core");
		category.setCategoryId(3);
		newBook.setCategory(category );
		newBook.setTitle("Java 8 in Action");
		newBook.setAuthor("Alan Mycroft");
		newBook.setDescription("The book covers lambdas, streams, and functional-style programming. With Java 8's functional features you can now write more concise code in less time, and also automatically benefit from multicore architectures. It's time to dig in!");
		newBook.setPrice(36.72f);
		newBook.setIsbn("1617291994");
		
		DateFormat DateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = DateFormat.parse("08/28/2014");
		newBook.setPublishDate(publishDate );
		
		
		String imagePath = "C:\\Users\\nehra\\Downloads\\dummy-data-books\\books\\Java 8 in Action.JPG";
		byte[] imagebytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imagebytes);
		
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	
	}
	
	@Test
	public void testUpdateBook() throws ParseException, IOException {
		Book existBook = new Book();
		existBook.setBookId(1);
		Category category = new Category("Java Core");
		category.setCategoryId(3);
		existBook.setCategory(category );
		existBook.setTitle("Effective Java (3rd Edition)");
		existBook.setAuthor("Joshua Bloch");
		existBook.setDescription("New coverage of generics, enums, annotations, autoboxing, the for-each loop, varargs, concurrency utilities, and much more");
		existBook.setPrice(45.50f);
		existBook.setIsbn("0321356683");
		
		DateFormat DateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = DateFormat.parse("05/28/2010");
		existBook.setPublishDate(publishDate );
		
		
		String imagePath = "C:\\Users\\nehra\\Downloads\\dummy-data-books\\books\\Effective Java.JPG";
		byte[] imagebytes = Files.readAllBytes(Paths.get(imagePath));
		existBook.setImage(imagebytes);
		
		
		Book updatedBook = bookDAO.update(existBook);
		assertEquals(updatedBook.getTitle(), "Effective Java (3rd Edition)");
			
	}

	@Test(expected=EntityNotFoundException.class)
	public void testDeleteBookFail()
	{
	
		Integer bookId = 100;
		bookDAO.delete(bookId);
		
		assertTrue(true);
		
		
	}
	
	@Test()
	public void testDeleteBookSuccess()
	{
	
		Integer bookId = 1;
		bookDAO.delete(bookId);
		
		assertTrue(true);
	}
	
	
	@Test
	public void testGetBookFail()
	{
		Integer bookId = 98;
		Book book = bookDAO.get(bookId);
		
		
		assertNull(book);
	}

	@Test
	public void testGetBookSuccess()
	{
		Integer bookId = 1;
		Book book = bookDAO.get(bookId);
		assertNotNull(book);
	}
	
	@Test
	public void testlistAll()
	{
		List<Book> listBooks = bookDAO.listAll();
		
		for(Book aBook : listBooks)
		{
			System.out.println(aBook.getTitle() + " "+aBook.getAuthor());
		}
		
		
		assertFalse(listBooks.isEmpty());
	}
	
	@Test
	public void  testFindByTitleExist()
	{
		String title = "Java 8 in Action";
		Book bookTitle = bookDAO.findByTitle(title);
		
//		System.out.println(bookTitle.getAuthor());
//		System.out.println(bookTitle.getPrice());
		assertNotNull(bookTitle);
	}
	
	@Test
	public void  testFindByTitleNotExist()
	{
		String title = "Java 8 in Action001";
		Book bookTitle = bookDAO.findByTitle(title);
		
		assertNull(bookTitle);
	}
	

	
	
	
	
	
	
	
	
}
