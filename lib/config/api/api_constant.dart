class ApiUrlConstant {
  ApiUrlConstant._privateConstructor();

  static final ApiUrlConstant _instance = ApiUrlConstant._privateConstructor();

  factory ApiUrlConstant() {
    return _instance;
  }
  static const String kBaseUrl = "https://jsonplaceholder.typicode.com";
  static const String kPosts = "$kBaseUrl/posts";
}
