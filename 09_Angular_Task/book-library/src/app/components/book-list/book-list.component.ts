import { Component } from '@angular/core';
import { Book } from '../../models/book.model';
import { BookService } from '../../services/book.service';

@Component({
  selector: 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrl: './book-list.component.css',
})
export class BookListComponent {
  books: Book[] = [];
  filter: string = 'all';

  constructor(private bookService: BookService) {}

  ngOnInit() {
    this.bookService.books$.subscribe((books) => {
      this.books = books;
    });
  }

  onBookSelect(book: Book) {
    console.log('Selected book:', book);
  }
  
  setFilter(filter: string) {
    this.filter = filter;
  }
}
