import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Book } from '../../models/book.model';

@Component({
  selector: 'app-book-card',
  templateUrl: './book-card.component.html',
  styleUrl: './book-card.component.css',
})
export class BookCardComponent {
  @Input() book!: Book;
  @Output() bookSelected = new EventEmitter<Book>();

  onSelect() {
    this.bookSelected.emit(this.book);
  }
}
