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
    }
    remote function updateBook(Book value) returns Response|error {
    }
    remote function removeBook(string value) returns Response|error {
    }
    remote function locateBook(string value) returns Book|error {
    }
    remote function borrowBook(BorrowBook value) returns Response|error {
    }
    remote function listAvailableBooks() returns stream<Book, error?>|error {
    }
}

