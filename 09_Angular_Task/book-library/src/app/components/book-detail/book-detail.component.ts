import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BookService } from '../../services/book.service';
import { Book } from '../../models/book.model';

@Component({
  selector: 'app-book-detail',
  templateUrl: './book-detail.component.html',
  styleUrl: './book-detail.component.css',
})
export class BookDetailComponent implements OnInit {
  book!: Book;

  constructor(
    private route: ActivatedRoute,
    private bookService: BookService
  ) {}

  ngOnInit() {
    const bookId = Number(this.route.snapshot.paramMap.get('id'));
    this.bookService.getBookById(bookId).subscribe((book) => {
      this.book = book;
    });
  }

  buyNow() {
    const amazonUrl = `https://www.amazon.com/s?k=${encodeURIComponent(
      this.book.title
    )}`;
    window.open(amazonUrl, '_blank'); // Open Amazon link in a new tab
  }
  goBack() {
    window.history.back(); // Navigates back in browser history
  }
}
