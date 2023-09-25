import ballerina/grpc;

listener grpc:Listener ep = new (9090);

table<Book> key(ISBN) BookTable = table[];
table<User> key(user_id) UserTable = table[];
table<BorrowBook> key(user_id)  BorrowTable = table[];


@grpc:Descriptor {value: QUESTION2_DESC}
service "LibrarySystemAppService" on ep {

    remote function addBook(Book value) returns Response|error {
     error? addBook=BookTable.add(value);

if addBook is error {

    return addBook;

}

else {

    return {message:"Book has been successfully added"};

}
    
    }
    remote function createUsers(User value) returns Response|error {

    error? newUser = UserTable.add(value);

 

        if newUser is error {

 

            return newUser;

 

        }

 

        else {

 

        return {message:"User successfully created"};

 

        }

   

    }

    remote function updateBook(Book value) returns Response|error {

        error? updatedBook=BookTable.put(value);

 

        if updatedBook is error {

 

        return updatedBook;

 

        }

 

    else {

 

    return {message:"Book has been successfully updated"};

 

    }

   

    }

    remote function removeBook(string value) returns Response|error {

   

    Book deleteBook=BookTable.remove(value);

 

        return {

 

            message: string`${deleteBook.title} successfully removed book`

 

        };

   

    }

    remote function locateBook(string value) returns Book|error|string {

   

    Book Bookloco = BookTable.get(value);

 

        if (Bookloco.ISBN=="") {

 

            return error("Book requested not found");

 

        }

 

        else {

 

            return Bookloco.location;

 

        }

   

    }

    remote function borrowBook(BorrowBook value) returns Response|error {

   

    error? b_Book = BorrowTable.add(value);

 

 

 

       if(b_Book is error){

 

        return b_Book;

 

      }

 

      else {

 

        return {message: "Borrow request has been successful. Book Borrowed!"};

 

      }

 

 

   

    }

    remote function listAvailableBooks() returns stream<Book, error?>|error {

 

        stream<Book, error?> allBooks = stream from var book in BookTable.toArray() select book;

 

        return allBooks;

 

       

 

    }

   

}

 
   

