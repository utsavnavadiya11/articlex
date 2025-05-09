import 'package:articlex/views/posts/favorite_posts_screen.dart';
import 'package:get/get.dart';

import '../../views/posts/post_details_screen.dart';
import '../../views/posts/posts_screen.dart';
import 'routes_name.dart';

class GetRoutes {
  List<GetPage> generateRoutes() {
    return <GetPage<dynamic>>[
      GetPage(name: RoutesName.kPosts, page: () => const PostsScreen()),
      GetPage(
        name: RoutesName.kFavoritePosts,
        page: () => FavoritePostsScreen(
          favoritePosts: Get.arguments['posts'],
        ),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: RoutesName.kPostDetails,
        page: () => PostDetailsScreen(
          post: Get.arguments['post'],
        ),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ];
  }
}
