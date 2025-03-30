import { Book } from '../models/book.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class BookService {
  private apiUrl = 'http://localhost:4500/books'; 
  private booksSubject = new BehaviorSubject<Book[]>([]);
  books$ = this.booksSubject.asObservable();

  constructor(private http: HttpClient) {
    this.loadInitialBooks();
  }

  private loadInitialBooks() {
    this.http.get<Book[]>(this.apiUrl).subscribe((books) => {
      this.booksSubject.next(books);
    });
  }

  getBookById(id: number): Observable<Book> {
    return this.http.get<Book>(`${this.apiUrl}/${id}`);
  }

  addBook(book: Book) {
    this.http.post<Book>(this.apiUrl, book).subscribe((newBook) => {
      const currentBooks = this.booksSubject.value;
      this.booksSubject.next([...currentBooks, newBook]);
    });
  }
}