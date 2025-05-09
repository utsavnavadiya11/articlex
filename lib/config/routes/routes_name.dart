class RoutesName {
  RoutesName._privateConstructor();

  static final RoutesName _instance = RoutesName._privateConstructor();

  factory RoutesName() {
    return _instance;
  }

  // New
  static const String kPosts = "/posts";
  static const String kFavoritePosts = "/posts/favorite";
  static const String kPostDetails = "/posts/details";
}
