//11. Get the day of a week and perform the following using switch statement. If its Monday, display "Start of the week!" If its Tuesday, Wednesday or Thursday, display "Mid of the week!". If its Friday, display "Last working day of the week!". If its Saturday, display "WeekEnd - Saturday!". If its Sunday, display "WeekEnd - Sunday!".  If the input is not a day of the week, display "Invalid input!".

let day = 'Tuesday'.toLowerCase() 

switch (day) {
  case 'monday':
    console.log('Start of the week!')
    break
  case 'tuesday':
  case 'wednesday':
  case 'thursday':
    console.log('Mid of the week!')
    break
  case 'friday':
    console.log('Last working day of the week!')
    break
  case 'saturday':
    console.log('WeekEnd - Saturday!')
    break
  case 'sunday':
    console.log('WeekEnd - Sunday!')
    break
  default:
    console.log('Invalid input!')
}
