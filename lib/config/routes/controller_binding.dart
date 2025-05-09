import 'package:get/get.dart';

import '../../controllers/posts/posts_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsController>(() => PostsController());
  }
}
