import ballerina/http;
import ballerina/graphql;

public function main() {
   
    endpoint graphql:User graphqlUser {
        UserConfig: {
            url: "http://management-graphql-service-endpoint",
        }
    };

    string query = `
        query {
            getUser {
                firstName
                lastName
		jobTitle
		position
                role
		records
		objectives
               
            }
        }
    `;
    var response = graphqlUser->execute(query);
    
   
    if (response is graphql:Response) {
        if (response.statusCode == 200) {
            
            json data = check response.data;
            
        } else {
            
            io:println("HTTP Error: " + response.statusCode);
        }
    } else {
        
        io:println("GraphQL Error: " + response);
    }
}   
