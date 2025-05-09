import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../config/const/assets_consts.dart';
import '../../config/const/string_consts.dart';
import '../../config/const/theme_consts.dart';
import '../../config/routes/routes_name.dart';
import '../../models/post_model.dart';

class FavoritePostsScreen extends StatelessWidget {
  const FavoritePostsScreen({super.key, required this.favoritePosts});

  final List<PostModel> favoritePosts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Posts'),
      ),
      body: favoritePosts.isNotEmpty
          ? _buildFavoritePostsList(context)
          : _buildEmptyView(context),
    );
  }

  Widget _buildFavoritePostsList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      itemBuilder: (context, index) =>
          _buildPostTile(context, favoritePosts[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: favoritePosts.length,
      physics: const ClampingScrollPhysics(),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            AssetsName.kNoDataFound,
            height: 200,
          ),
          Text(
            StringConsts.kNoFavoritePostsFound,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostTile(BuildContext context, PostModel post) {
    return InkResponse(
      onTap: () {
        Get.toNamed(
          RoutesName.kPostDetails,
          arguments: {'post': post},
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeConsts.kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: ThemeConsts.kPrimaryColor.withValues(alpha: 0.2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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
