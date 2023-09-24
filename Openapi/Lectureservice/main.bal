import ballerina/http;

 

public type Lecturer readonly& record {

    # the staff number of the Lecturer

    int staffnumber;

    # the lecture's office number

    int officenumber?;

    # the name of the Lecturer

    string staffname?;

    # the title of the Lecturer

    string title?;

    # the coiurses tutored by the lecturer

    string coursestaken?;

};

type Course readonly & record {

    # the course name

    string coursename;

    # the course code

    string coursecode;

    # the National Qualifications Framework

    string NQFlevel;

};

table<Lecturer> key(staffnumber) lecturer = table [


];

http:Response resp = new;

typedesc<http:ClientError> ncp=http:ClientError;

# A service representing a network-accessible API

# bound to port `9090`.

service / on new http:Listener(9090) {

# Add a new lecturer

    #

    # + payload - parameter description

    # + return - returns can be any of following types

    # Inline_response_201 (Lecturer record was successfully created)

    # http:Response (Error handling user)

    resource function post lecturer( Lecturer payload) returns Lecturer {

        lecturer.add(payload);

        return payload;

    }

    # A resource adding lecturer details into the record

    # + return - array of lecturers

    resource function get all_lecturers() returns Lecturer[] {

       return lecturer.toArray();

    }

 

    # A resource updating an existing lecturers details

    # + return - array of lecturers

    resource function put update_lecturer/[int staffnum]( Lecturer payload) returns Lecturer {

        lecturer.put(payload);

        return payload;

}

    # A resource retrieving a lecturer by staff number

    # + return - a lecturer retrieved by staff id

    resource function get lecturerId/[int id]() returns Lecturer|http:NotFound {

    Lecturer? a_lecturer = lecturer[id];

    if a_lecturer is () {

    return http:NOT_FOUND;

    } else {

    return a_lecturer;

}

}

    resource function delete remove_lecturer/[int staffnumber]() returns string|Lecturer[]{

     _ = lecturer.remove(staffnumber);

         return lecturer.toArray();

        }

    resource function get lecturer_office/[int officenumber]() returns Lecturer|string {

  foreach Lecturer staff in lecturer {

    if(staff.officenumber==officenumber){

        return staff;

    }

  }  

  return "Invalid Office number";

    }

     resource function get LecturerBycourseName/[string courseName]() returns Lecturer|string {

        foreach Lecturer staffRecord in lecturer  {

            if (staffRecord.coursestaken === courseName) {

              return staffRecord ;
              }
                }
         return "Course doesn't exist";
            }
                 }