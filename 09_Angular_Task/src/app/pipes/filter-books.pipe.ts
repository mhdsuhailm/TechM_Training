import { Pipe, PipeTransform } from '@angular/core';
import { Book } from '../models/book.model';

@Pipe({
  name: 'filterBooks',
})
export class FilterBooksPipe implements PipeTransform {
  transform(books: Book[], filterBy: string): Book[] {
    if (!books || !filterBy) {
      return books; 
    }

    switch (filterBy) {
      case 'available':
        return books.filter((book) => book.isAvailable); 
      case 'checked-out':
        return books.filter((book) => !book.isAvailable); 
      default:
        return books; 
    }
  }
}
