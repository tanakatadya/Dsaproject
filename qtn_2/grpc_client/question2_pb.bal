import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;
import ballerina/protobuf.types.wrappers;

public const string QUESTION2_DESC = "0A0F7175657374696F6E322E70726F746F120D44534161737369676E6D656E741A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F2298010A04426F6F6B12120A044953424E18012001280952044953424E12140A057469746C6518022001280952057469746C6512180A07617574686F72311803200128095207617574686F723112180A07617574686F72321804200128095207617574686F7232121A0A086C6F636174696F6E18052001280952086C6F636174696F6E12160A067374617475731806200128095206737461747573223B0A045573657212170A07757365725F69641801200128095206757365724964121A0A08757365726E616D651802200128095208757365726E616D6522240A08526573706F6E736512180A076D65737361676518012001280952076D65737361676522390A0A426F72726F77426F6F6B12170A07757365725F6964180120012809520675736572496412120A046973626E18022001280952046973626E32D8030A174C69627261727953797374656D4170705365727669636512370A07616464426F6F6B12132E44534161737369676E6D656E742E426F6F6B1A172E44534161737369676E6D656E742E526573706F6E7365123B0A0B637265617465557365727312132E44534161737369676E6D656E742E557365721A172E44534161737369676E6D656E742E526573706F6E7365123A0A0A757064617465426F6F6B12132E44534161737369676E6D656E742E426F6F6B1A172E44534161737369676E6D656E742E526573706F6E736512430A0A72656D6F7665426F6F6B121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A172E44534161737369676E6D656E742E526573706F6E736512430A126C697374417661696C61626C65426F6F6B7312162E676F6F676C652E70726F746F6275662E456D7074791A132E44534161737369676E6D656E742E426F6F6B3001123F0A0A6C6F63617465426F6F6B121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A132E44534161737369676E6D656E742E426F6F6B12400A0A626F72726F77426F6F6B12192E44534161737369676E6D656E742E426F72726F77426F6F6B1A172E44534161737369676E6D656E742E526573706F6E7365620670726F746F33";

public isolated client class LibrarySystemAppServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, QUESTION2_DESC);
    }

    isolated remote function addBook(Book|ContextBook req) returns Response|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/addBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Response>result;
    }

    isolated remote function addBookContext(Book|ContextBook req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/addBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Response>result, headers: respHeaders};
    }

    isolated remote function createUsers(User|ContextUser req) returns Response|grpc:Error {
        map<string|string[]> headers = {};
        User message;
        if req is ContextUser {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/createUsers", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Response>result;
    }

    isolated remote function createUsersContext(User|ContextUser req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        User message;
        if req is ContextUser {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/createUsers", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Response>result, headers: respHeaders};
    }

    isolated remote function updateBook(Book|ContextBook req) returns Response|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Response>result;
    }

    isolated remote function updateBookContext(Book|ContextBook req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Response>result, headers: respHeaders};
    }

    isolated remote function removeBook(string|wrappers:ContextString req) returns Response|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/removeBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Response>result;
    }

    isolated remote function removeBookContext(string|wrappers:ContextString req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/removeBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Response>result, headers: respHeaders};
    }

    isolated remote function locateBook(string|wrappers:ContextString req) returns Book|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/locateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Book>result;
    }

    isolated remote function locateBookContext(string|wrappers:ContextString req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/locateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Book>result, headers: respHeaders};
    }

    isolated remote function borrowBook(BorrowBook|ContextBorrowBook req) returns Response|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBook message;
        if req is ContextBorrowBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/borrowBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Response>result;
    }

    isolated remote function borrowBookContext(BorrowBook|ContextBorrowBook req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBook message;
        if req is ContextBorrowBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("DSAassignment.LibrarySystemAppService/borrowBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Response>result, headers: respHeaders};
    }

    isolated remote function listAvailableBooks() returns stream<Book, grpc:Error?>|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("DSAassignment.LibrarySystemAppService/listAvailableBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookStream outputStream = new BookStream(result);
        return new stream<Book, grpc:Error?>(outputStream);
    }

    isolated remote function listAvailableBooksContext() returns ContextBookStream|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("DSAassignment.LibrarySystemAppService/listAvailableBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookStream outputStream = new BookStream(result);
        return {content: new stream<Book, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class BookStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|Book value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|Book value;|} nextRecord = {value: <Book>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public type ContextBookStream record {|
    stream<Book, error?> content;
    map<string|string[]> headers;
|};

public type ContextResponse record {|
    Response content;
    map<string|string[]> headers;
|};

public type ContextBorrowBook record {|
    BorrowBook content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextBook record {|
    Book content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: QUESTION2_DESC}
public type Response record {|
    string message = "";
|};

@protobuf:Descriptor {value: QUESTION2_DESC}
public type BorrowBook record {|
    string user_id = "";
    string isbn = "";
|};

@protobuf:Descriptor {value: QUESTION2_DESC}
public type User record {|
    string user_id = "";
    string username = "";
|};

@protobuf:Descriptor {value: QUESTION2_DESC}
public type Book record {|
    string ISBN = "";
    string title = "";
    string author1 = "";
    string author2 = "";
    string location = "";
    string status = "";
|};

