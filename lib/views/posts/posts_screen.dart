import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/const/assets_consts.dart';
import '../../config/const/string_consts.dart';
import '../../config/const/theme_consts.dart';
import '../../config/routes/routes_name.dart';
import '../../controllers/posts/posts_controller.dart';

class PostsScreen extends GetView<PostsController> {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostsController>(builder: (_) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildSearchBar(context),
            Expanded(child: _buildPostList(context)),
          ],
        ),
      );
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('ArticleX'),
      titleSpacing: 10,
      automaticallyImplyLeading: false,
      actions: [
        Obx(() {
          return Visibility(
            visible: controller.arrPosts.isNotEmpty,
            child: IconButton(
              onPressed: () {
                Get.toNamed(RoutesName.kFavoritePosts, arguments: {
                  'posts': controller.arrAllPosts
                      .where((element) => element.isFavorite)
                      .toList()
                });
              },
              icon: const Icon(
                IconsName.kFavorite,
                color: ThemeConsts.kButtonPrimaryColor,
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Obx(() {
      return TextField(
        controller: controller.searchController,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: controller.isSearhing.value
              ? IconButton(
                  onPressed: () {
                    controller.searchController.clear();
                    controller.isSearhing.value = false;
                  },
                  icon: const Icon(Icons.close),
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
      ).paddingSymmetric(horizontal: 15, vertical: 10);
    });
  }

  Widget _buildPostList(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.searchController.clear();
        controller.getPosts();
      },
      child: Obx(() {
        if (controller.loadingPosts.value) return _buildShimmerList();
        if (controller.arrPosts.isEmpty) return _buildEmptyView(context);
        return _buildPostsListView(context);
      }),
    );
  }

  Widget _buildShimmerList() {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeConsts.kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: ThemeConsts.kPrimaryColor.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: ThemeConsts.kShimmerBaseColor,
              highlightColor: ThemeConsts.kShimmerHighLightColor,
              child: Container(
                height: 20,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ThemeConsts.kShimmerBaseColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Shimmer.fromColors(
              baseColor: ThemeConsts.kShimmerBaseColor,
              highlightColor: ThemeConsts.kShimmerHighLightColor,
              child: Container(
                height: 45,
                width: 275,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ThemeConsts.kShimmerBaseColor,
                ),
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: 7,
      physics: const ClampingScrollPhysics(),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              AssetsName.kNoDataFound,
              height: 200,
            ),
            Text(
              StringConsts.kNoPostsFound,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPostsListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      itemBuilder: (context, index) =>
          _buildPostTile(context, controller.arrPosts[index], index),
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: controller.arrPosts.length,
      physics: const ClampingScrollPhysics(),
    );
  }

  Widget _buildPostTile(BuildContext context, post, int index) {
    return InkResponse(
      onTap: () {
        Get.toNamed(RoutesName.kPostDetails, arguments: {'post': post});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeConsts.kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: ThemeConsts.kPrimaryColor.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    post.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const SizedBox(width: 5),
                InkResponse(
                  onTap: () => controller.favoritePost(index),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: ThemeConsts.kCardBorderColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      post.isFavorite
                          ? IconsName.kFavorite
                          : IconsName.kFavoriteBorder,
                      size: 18,
                      color: ThemeConsts.kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            ReadMoreText(
              post.body,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeConsts.kGreyTextColor,
                  ),
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: '   ${StringConsts.kReadMore}',
              trimExpandedText: '   ${StringConsts.kShowLess}',
              lessStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ThemeConsts.kPrimaryColor,
              ),
              moreStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ThemeConsts.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
