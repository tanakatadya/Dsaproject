# Dsaproject
DSA assignment 



syntax = "proto3";
import "google/protobuf/wrappers.proto";
import "google/protobuf/empty.proto";
 

package DSAassignment;

service LibrarySystemAppService {

 

    rpc addBook(Book) returns (Response);

 

    rpc createUsers(User) returns (Response);

 

    rpc updateBook(Book) returns (Response);

 

    rpc removeBook(google.protobuf.StringValue) returns (Response);

 

    rpc listAvailableBooks(google.protobuf.Empty) returns (stream Book);

 

    rpc locateBook(google.protobuf.StringValue) returns (Book);

 

    rpc borrowBook(BorrowBook) returns (Response);

 

}

 

 

 

message Book {

    string ISBN = 1;

    string title = 2;

    string author1 = 3;

    string author2 = 4;

    string location = 5;

    string status = 6;
 

}

 
message User {

 

    string user_id = 1;

 

    string username = 2; 

}



message Response {


    string message= 1;

}

message BorrowBook {

    string user_id = 1;
    string isbn = 2;

}
