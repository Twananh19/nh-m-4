class User {
  int userId;
  String name;
  String email;
  String password;

  User({required this.userId, required this.name, required this.email, required this.password});

  void register() {
    print('$name has registered successfully.');
  }

  bool login(String email, String password) {
    return this.email == email && this.password == password;
  }

  void updateProfile(String name, String email) {
    this.name = name;
    this.email = email;
    print('Profile updated successfully.');
  }
}

// Define the Book class
class Book {
  int bookId;
  String title;
  String author;
  String genre;
  bool availability;

  Book({required this.bookId, required this.title, required this.author, required this.genre, this.availability = true});

  void viewDetails() {
    print('Title: $title, Author: $author, Genre: $genre, Available: $availability');
  }
}

// Define the Loan class
class Loan {
  int loanId;
  User user;
  Book book;
  DateTime loanDate;
  DateTime? returnDate;

  Loan({required this.loanId, required this.user, required this.book, required this.loanDate, this.returnDate});

  void borrowBook() {
    if (book.availability) {
      book.availability = false;
      print('${user.name} borrowed ${book.title}.');
    } else {
      print('${book.title} is currently unavailable.');
    }
  }

  void returnBook() {
    book.availability = true;
    returnDate = DateTime.now();
    print('${user.name} returned ${book.title}.');
  }
}

// Define the Admin class
class Admin {
  int adminId;
  String name;
  String email;

  Admin({required this.adminId, required this.name, required this.email});

  void addBook(Book book) {
    print('Book titled "${book.title}" added successfully.');
  }

  void removeBook(Book book) {
    print('Book titled "${book.title}" removed successfully.');
  }

  void manageUsers() {
    print('Managing users...');
  }
}

// Define the Review class
class Review {
  int reviewId;
  User user;
  Book book;
  int rating;
  String comment;

  Review({required this.reviewId, required this.user, required this.book, required this.rating, required this.comment});

  void addReview() {
    print('${user.name} added a review for ${book.title}: $comment (Rating: $rating)');
  }

  void viewReviews() {
    print('Review for ${book.title}: $comment (Rating: $rating)');
  }
}

// Define the Payment class
class Payment {
  int paymentId;
  User user;
  double amount;
  DateTime paymentDate;

  Payment({required this.paymentId, required this.user, required this.amount, required this.paymentDate});

  void processPayment() {
    print('Payment of \$${amount.toStringAsFixed(2)} by ${user.name} processed successfully on $paymentDate.');
  }

  void viewPaymentHistory() {
    print('Payment of \$${amount.toStringAsFixed(2)} on $paymentDate by ${user.name}.');
  }
}
