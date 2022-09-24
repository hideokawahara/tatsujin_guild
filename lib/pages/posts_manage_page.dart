//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/posts_manage_view_model.dart';

//Widgets
import '../widgets/card.dart';
import 'package:tatsujin_guild/widgets/tab_bar.dart';
import '../widgets/circular_indicator.dart';

class PostsManagePage extends StatelessWidget {
  const PostsManagePage({Key? key}) : super(key: key);

  final List<String> tabContents = const ['投稿', 'お気に入り'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostsManageViewModel(
        postRepository: PostRepositoryImpl(),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: AppColors.settingsBackGroundColor,
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
            body: Builder(
              builder: (BuildContext newContext) {
                return FutureBuilder<void>(
                  future: Provider.of<PostsManageViewModel>(newContext,
                          listen: false)
                      .fetchInitialAllPosts(),
                  builder: (_, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const DefaultCircularIndicator();
                    }
                    return const TabBarView(
                      children: [
                        PostsManagePageBody(),
                        FavoritePostsPageBody(),
                      ],
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}

class PostsManagePageBody extends StatelessWidget {
  const PostsManagePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsManageViewModel>(
      builder: (context, postModel, child) {
        if (postModel.postList.isEmpty) {
          return const Center(
            child: Text('投稿がありません'),
          );
        } else {
          return ListView.builder(
            clipBehavior: Clip.none,
            key: const PageStorageKey(0),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: postModel.postList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext listContext, int index) {
              return MyPostcard(
                likesCounts: postModel.postList[index].likesCounts,
                contents: postModel.postList[index].contents,
                deletePostCallback: () =>
                    postModel.deleteMyPost(postModel.postList[index]),
                //要らなかったら消す
                reloadPostCallback: () => postModel.fetchInitialAllPosts(),
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
      builder: (context, postModel, child) {
        if (postModel.favoriteList.isEmpty) {
          return const Center(
            child: Text('お気に入りの投稿がありません'),
          );
        } else {
          return ListView.builder(
            clipBehavior: Clip.none,
            key: const PageStorageKey(1),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: postModel.favoriteList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext listContext, int index) {
              return FavoritePostcard(
                likesCounts: postModel.favoriteList[index].likesCounts,
                contents: postModel.favoriteList[index].contents,
                authorImage: postModel.favoriteList[index].authorImage,
                authorName: postModel.favoriteList[index].authorName,
                removeLikeCallback: () => postModel.deleteFavorite(
                  postModel.favoriteList[index],
                ),
                reloadPostCallback: postModel.fetchInitialAllPosts,
              );
            },
          );
        }
      },
    );
  }
}
