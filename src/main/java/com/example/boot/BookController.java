package com.example.boot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BookController {
    private final BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/")
    public String getBooks(Model model) {
        List<Book> books = bookService.getAllBooks();
        if (books.isEmpty()) {
            model.addAttribute("message", "The list is empty, add books using the form below");
        } else {
            model.addAttribute("books", books);
        }
        return "Main";
    }

    @PostMapping("/add_books")
    public String addBook(@RequestParam String name, @RequestParam String author, @RequestParam String genre) {
        Book book = new Book();
        book.setName(name);
        book.setAuthor(author);
        book.setGenre(genre);
        bookService.saveBook(book);
        return "redirect:/";
    }
    @GetMapping("/book/{id}")
    public String getBookDetails(@PathVariable int id, Model model) {
        Book book = bookService.getBookById(id);
        if (book != null) {
            model.addAttribute("book", book);
        } else {
            model.addAttribute("message", "Book not found");
        }
        return "BookDetails";
    }

}
