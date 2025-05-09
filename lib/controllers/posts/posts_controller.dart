import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/api/api_constant.dart';
import '../../config/api/api_provider.dart';
import '../../config/dev/dev_helper.dart';
import '../../config/local_storage/local_storage.dart';
import '../../models/post_model.dart';

class PostsController extends GetxController {
  RxList<PostModel> arrPosts = <PostModel>[].obs;
  // For Mainting Search Client Side
  List<PostModel> arrAllPosts = <PostModel>[];
  RxBool loadingPosts = false.obs;
  TextEditingController searchController = TextEditingController();
  RxBool isSearhing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPosts();
    searchController.addListener(() {
      searchPosts(searchController.text.trim());
    });
  }

  void searchPosts(String query) {
    if (query.isNotEmpty) {
      isSearhing.value = true;
      arrPosts.value = arrAllPosts
          .where((element) =>
              element.title
                  .toLowerCase()
                  .contains(query.trim().toLowerCase()) ||
              element.body.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();
    } else {
      isSearhing.value = false;
      arrPosts.value = arrAllPosts;
    }
  }

  void favoritePost(int index) {
    arrPosts[index].isFavorite = !arrPosts[index].isFavorite;
    if (arrPosts[index].isFavorite) {
      List<int> favoritePosts = LocalStorage.favoritePosts;
      favoritePosts.add(arrPosts[index].id);
      LocalStorage.favoritePosts = favoritePosts;
    } else {
      List<int> favoritePosts = LocalStorage.favoritePosts;
      favoritePosts.remove(arrPosts[index].id);
      LocalStorage.favoritePosts = favoritePosts;
    }
    int globalIndex =
        arrAllPosts.indexWhere((element) => element.id == arrPosts[index].id);
    if (globalIndex != -1) {
      arrAllPosts[globalIndex].isFavorite = arrPosts[index].isFavorite;
    }
    arrPosts.refresh();
  }

  void getPosts() async {
    try {
      loadingPosts.value = true;
      dynamic response = await ApiProvider().callService(
        method: 'GET',
        url: ApiUrlConstant.kPosts,
        showSuccessToast: false,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response is List && response.isNotEmpty) {
        arrPosts.value = (response).map((e) => PostModel.fromJson(e)).toList();
        arrAllPosts = arrPosts.toList();
      }
    } catch (e) {
      devPrint(['Error', 'Failed to load posts', e]);
    } finally {
      loadingPosts.value = false;
    }
  }
}
