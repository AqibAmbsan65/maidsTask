class APIEndpoints {
  static const baseURL = "https://dummyjson.com/";
  static const baseURL1 = "https://host2.appsstaging.com:3078/";

  static const socketURL = "https://host2.appsstaging.com:3078/";

  static const String IMAGE_BASE_URL = "https://server.appsstaging.com:3098/";

  static const videoCalling = "https://server1.appsstaging.com:3003/rtctoken";

  static const String ACCEPT = 'application/json';

  static const login = "auth/login";
  static const todos = "todos";
  static const logout = "auth/signout";

  // static const createProfile = "user/complete-profile";
  // static const updateProfile = "user/edit-profile";
  // static const deleteAccount = "user/deleteAccount";
  // static const notification = "user/notificationToggle";
  // static const createmerchants = "payment/create-merchant";
  //
  // static const socialLogin = "auth/sociallogin";
  //
  // // CoreModule
  //
  // static const viewAllCourses = "course-with-reviews";
  // static const viewCoursesDetailed = "course";
  // static const popularCoaches = "user/popular-coaches";
  // static const reportCoaches = "report";
  // static const courseCompleteDetail = "course-with-reviews";
  // static const blockCoaches = "user/block_unblock_user";
  // static const rating = "reviews";
  // static const getQuiz = "module-test";
  // static const getQuizResult = "marks-module-test";
  // static const getOngoingRequest = "appointment/slot-listing";
  // static const enrolledCourse = "enrolled-course";
  // static const Course_modules = "course-module";
  // static const deleteCourseAttachement = "course-module/delete-attachment";
  // static const MarkCompletedCourse = "mark-module-completed";
  // static const ViewCertificates = "get-certificate-list";
  // static const MarkModuleTest = "marks-module-test";
  //
  // static const DeleteCourseList = "course/delete-course-list";
  // static const UserDeleteCourseList = "enrolled-course-deleted";
  // static const createCourse = "course";
  // static const courseCategory = "course-category";
  // static const createModule = "course-module";
  // static const createAttachement = "course-module/add-attachment-media";
  // static const course = "course";
  // static const enrollCourseStudent = "enrolled-course-students";
  // static const getStudent = "user/";
  // static const moduleTest = "module-test";
  //
  // static const DeleteCourseByCoach = "course";
  //
  //
  // // Chat Module
  //
  // static const sendMessageRequest = "chat/send-request";
  // static const acceptMessageRequest = "chat/accept-request";
  // static const deleteMessageRequest = "chat/delete-chat";
  //
  // // Streaming Module
  // static const JoinStream = "streaming/join-stream";
  // static const StartStream = "streaming/start-streaming";
  // static const EndStream = "streaming/end-streaming";
  // static const ListStream = "streaming/get-live-stream-list";
  //
  //
  //
  // // Card Module
  //
  //
  // static const AddCard = "payment/add-card";
  // static const viewallcard = "payment/get-all-card";
  // static const SetDefaultCard = "payment/set-default-card";
  // static const DeleteCard = "payment/delete-card";
  // static const PaymentDetailed = "payment/get-payment-details";
  // static const SendPayment = "payment/send-payment";
  //
  //
  //
  // static const AddAppointmentsTimeandDate = "appointment";
  // static const slotingListByDay = "appointment/slot-listing-by-day";
  // static const requestAppointment = "appointment/request-appointment";
  // static const viewSlotingListforappointment = "appointment/slot-listing";
  // static const cancelAppointment = "appointment/cancel-request";
  // static const acceptOrRejectAppointment = "appointment/accept-reject-request";
  //
  // static const userBlockListing = "user/block-user-listing";




  static const getTcPp = "getTcPp";
  static const NO_INTERNET_CONNECTION = "No Internet";

  static const int SUCCESS_CODE = 200;
  static const int UNAUTHORIZED_USER_CODE = 401;
  static const int API_FAILURE_STATUS = 0;
  static const int NOT_FOUND_CODE = 400;


  static const int API_SUCCESS_STATUS = 1;
  static const int SERVER_NOT_FOUND_CODE = 500;
}

String? token_bearer;
