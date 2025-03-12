import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BookService } from '../../services/book.service';

@Component({
  selector: 'app-add-book',
  templateUrl: './add-book.component.html',
  styleUrl: './add-book.component.css',
})
export class AddBookComponent {
  bookForm: FormGroup;

  constructor(private fb: FormBuilder, private bookService: BookService) {
    this.bookForm = this.fb.group({
      title: ['', Validators.required],
      author: ['', Validators.required],
      genre: ['', Validators.required],
      rating: [5, [Validators.required, Validators.min(1), Validators.max(5)]],
    });
  }

  onSubmit() {
    if (this.bookForm.valid) {
      const newBook = {
        // id: Date.now(),
        ...this.bookForm.value,
        isAvailable: true,
      };
      this.bookService.addBook(newBook);
      this.bookForm.reset();
    }
  }
}

