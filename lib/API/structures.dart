class Course {
  /* stores data of course

     purpose: to store and retrieve data related to course
     */

  int cid; // Unique id of courses
  String cname; // course name
  String uname; //user name
  String desc; //description
  String type; //type of course
  String link; //link of course
  String platform; //platform providing course(like udemy,coursera)
  int upvCount; //no. of upvotes/likes on course
  int free; //represent boolean value free=1 and paid=0
  String preReq; //Prerequisites for course

  //Constructor for Course
  Course(int cid, String cname, String uname, String desc,
      String type, String link, String platform, int upvCount, int free, String preReq) {
    this.cid = cid;
    this.cname = cname;
    this.uname = uname;
    this.desc = desc;
    this.type = type;
    this.link = link;
    this.platform = platform;
    this.upvCount = upvCount;
    this.free = free;
    this.preReq = preReq;
  }
}

class CourseReview {
  int cid; //course id
  String uname; //user name
  String review; //review on course

  //constructor for CourseReview
  CourseReview(int cid, String uname, String review) {
    this.cid = cid;
    this.uname = uname;
    this.review = review;
  }

}

class User {
  int uid; //user id
  String uname;  //user name
  List<int> addedCourses;  //courses added  by user
  List<int> upvotedCourses;  //courses upvoted by user
  List<int> reviewedCourses;  //courses reviewed by user
  String interest1;  //first interest
  String interest2;  //second interest
  String interest3;  //third interest

  //constructor User
  User(int uid, String uname, List<int> addedCourses,
      List<int> upvotedCourses, List<int> reviewedCourses, String interest1,
      String interest2, String interest3,) {
        this.uid = uid;
        this.uname =uname;
        this.addedCourses =addedCourses;
        this.upvotedCourses =upvotedCourses;
        this.reviewedCourses =reviewedCourses;
        this.interest1 =interest1;
        this.interest2 =interest2;
        this.interest3 =interest3;
  }
}

Course findCourse(String courseName, List<Course> courseList){

  Course foundCourse;

  for(int i=0; i<courseList.length; i++){
    if(courseList[i].cname == courseName){
      foundCourse =  courseList[i];
      break;
    }

    else{
      continue;
    }
  }
  return foundCourse;
}

String iffree(int value){
  if (value == 0){
    return('Paid');
  }

  else if (value==1){
    return("Free");
  }

  else {
    return(null);
  }

}