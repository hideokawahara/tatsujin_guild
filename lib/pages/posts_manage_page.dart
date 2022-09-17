//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/posts_manage_view_model.dart';

//Widgets
import '../widgets/card.dart';
import 'package:tatsujin_guild/widgets/tab_bar.dart';

class PostsManagePage extends StatelessWidget {
  const PostsManagePage({Key? key}) : super(key: key);

  final List<String> tabContents = const ['投稿', 'お気に入り'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostsManageViewModel(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.defaultBackGroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.defaultBackGroundColor,
            title: const Text(
              '投稿した',
              style: AppStyles.titleStyle,
            ),
            bottom: DefaultTabBar(
              tabContents: tabContents,
            ),
          ),
          body: const TabBarView(
            children: [
              PostsManagePageBody(),
              FavoritePostsPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class PostsManagePageBody extends StatelessWidget {
  const PostsManagePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsManageViewModel>(
      builder: (context, timeLineModel, child) {
        if (timeLineModel.postList.isEmpty) {
          return const Center(
            child: Text('投稿がありません'),
          );
        } else {
          return ListView.builder(
            clipBehavior: Clip.none,
            // scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: timeLineModel.postList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext listContext, int index) {
              return MyPostcard(
                likesCounts: timeLineModel.postList[index].likesCounts,
                contents: timeLineModel.postList[index].contents,
                deletePostCallback: () async {
                  await Future.delayed(Duration(milliseconds: 1000));
                  return true;
                },
              );
            },
          );
        }
      },
    );
  }
}

class FavoritePostsPageBody extends StatelessWidget {
  const FavoritePostsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsManageViewModel>(
      builder: (context, timeLineModel, child) {
        if (timeLineModel.favoriteList.isEmpty) {
          return const Center(
            child: Text('お気に入りの投稿がありません'),
          );
        } else {
          return ListView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: timeLineModel.favoriteList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext listContext, int index) {
              return FavoritePostcard(
                likesCounts: timeLineModel.favoriteList[index].likesCounts,
                contents: timeLineModel.favoriteList[index].contents,
                authorImage: timeLineModel.favoriteList[index].authorImage,
                authorName: timeLineModel.favoriteList[index].authorName,
                removeLikeCallback: () {
                  // timeLineModel.addLikeCounter();
                },
              );
            },
          );
        }
      },
    );
  }
}
