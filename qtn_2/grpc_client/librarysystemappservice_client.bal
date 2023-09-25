import ballerina/io;

LibrarySystemAppServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Book addBookRequest = {ISBN: "ballerina", title: "ballerina", author1: "ballerina", author2: "ballerina", location: "ballerina", status: "ballerina"};
    Response addBookResponse = check ep->addBook(addBookRequest);
    io:println(addBookResponse);

    User createUsersRequest = {user_id: "ballerina", username: "ballerina"};
    Response createUsersResponse = check ep->createUsers(createUsersRequest);
    io:println(createUsersResponse);

    Book updateBookRequest = {ISBN: "ballerina", title: "ballerina", author1: "ballerina", author2: "ballerina", location: "ballerina", status: "ballerina"};
    Response updateBookResponse = check ep->updateBook(updateBookRequest);
    io:println(updateBookResponse);

    string removeBookRequest = "ballerina";
    Response removeBookResponse = check ep->removeBook(removeBookRequest);
    io:println(removeBookResponse);

    string locateBookRequest = "ballerina";
    Book locateBookResponse = check ep->locateBook(locateBookRequest);
    io:println(locateBookResponse);

    BorrowBook borrowBookRequest = {user_id: "ballerina", isbn: "ballerina"};
    Response borrowBookResponse = check ep->borrowBook(borrowBookRequest);
    io:println(borrowBookResponse);
    stream<

Book, error?> listAvailableBooksResponse = check ep->listAvailableBooks();
    check listAvailableBooksResponse.forEach(function(Book value) {
        io:println(value);
    });
}

