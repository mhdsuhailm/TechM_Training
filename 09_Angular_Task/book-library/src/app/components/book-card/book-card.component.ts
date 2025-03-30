import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Router } from '@angular/router';
import { Book } from '../../models/book.model';

@Component({
  selector: 'app-book-card',
  templateUrl: './book-card.component.html',
  styleUrl: './book-card.component.css',
})
export class BookCardComponent {
  @Input() book!: Book;
  @Output() bookSelected = new EventEmitter<Book>();

  constructor(private router: Router) {}

  onSelect() {
    this.router.navigate(['/book-details', this.book.id]); 
    this.bookSelected.emit(this.book);
  }
}
