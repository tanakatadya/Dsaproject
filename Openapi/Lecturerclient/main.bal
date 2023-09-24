import ballerina/http;
import ballerina/io;

 type Lecturer readonly & record {

    int staffnumber;
    int officenumber?;
    string staffname?;
    string title?;
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

Course course1={coursename: "Mathematics For Computing And informatics 1B",coursecode: "MCI611S",NQFlevel: "7"};

Course course2={coursename: "Database Fundamentals",coursecode: "DBF711S",NQFlevel: "7"};

Course course3={coursename: "Introduction To Programming",coursecode: "IPG711S",NQFlevel: "7"};

Course course4={coursename: "Data Networks",coursecode: "DTN11S",NQFlevel: "7"};

Course course5={coursename: "Software Design",coursecode: "SDN121S",NQFlevel: "7"};

Course course6={coursename: "Communication Networks",coursecode: "CMN620",NQFlevel: "7"};


public function main() returns error?{

    http:Client API_Client = check new("localhost:9090");

    Lecturer lecturer1 = check API_Client->/lecturer.post({staffnumber:1, officenumber:40, staffname:"Tanaka Lynn", title:"Senior Lecturer",courses_taken:"Introduction To Programming"});

    io:println(" \n The post request successful :", lecturer1.toJsonString(), "record added");

     Lecturer lecturer2 = check API_Client->/lecturer.post({staffnumber:2, officenumber:1, staff_name:"Kundai Pindeni", title:"Junior Lecturer",courses_taken:"Introduction To Programming"});

    io:println(" \n The post request succesful :", lecturer2.toJsonString(), "record added");

     Lecturer lecturer3 = check API_Client->/lecturer.post({staffnumber:3, officenumber:100, staffname:"Lana Reece", title:"Senior Lecturer",courses_taken:"Introduction To Programming"});

    io:println(" \n The post request successful :", lecturer3.toJsonString(), "record added");

     Lecturer lecturer4 = check API_Client->/lecturer.post({staffnumber:4, officenumber:201, staffname:" Alleta Chemugarira", title:"Junior Lecturer",courses_taken:"Introduction To Programming"});

    io:println(" \n The post request successful :", lecturer4.toJsonString(), "record added");

    Lecturer[]all_lecturer= check API_Client->get("/all_lecturers");

    io:println("\n Response from the server",all_lecturer.toJsonString());


    Lecturer r1={staffnumber: 1};


    Lecturer update1 = check API_Client->/update_lecturer/[r1.staffnumber].put({staffnumber:r1.staffnumber,title:"Senior Lecturer",coursestaken:"Software Design"});

    io:println("\n The update request successful: ",update1);

    io:println("\n Specific record by staff number  ");

    Lecturer id1={staffnumber: 2};

    Lecturer a_lecturer = check API_Client->/lecturerId/[id1.staffnumber];

 

    io:println("\n Get Request ", a_lecturer.toString());

 
    Lecturer []delete1 = check API_Client->/remove_lecturer/[id1.staffnumber].delete();

    io:println(string `Deleted employee record: ${delete1.toString()}`);

    int officenumber=201;

    Lecturer a_office1 = check API_Client->/lectureroffice/[officenumber];

    io:println("\n Lecturers from office ",officenumber , a_office1.toString());

 

    string courseName=course1.coursename;

    Lecturer|string a_course1 = check API_Client->/LecturerBycourseName/[courseName];

    io:println("\n Lecturers who take the course ",courseName , a_course1.toString());

 }