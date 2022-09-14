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

class PostsManagePage extends StatelessWidget {
  const PostsManagePage({Key? key}) : super(key: key);

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
            bottom: const TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.emergency_recording_sharp,
                    // color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.favorite,
                    // color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PostsManagePageBody(),
              PostsManagePageBody(),
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
              return Container(
                height: 200,
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: TimeLinePostcard(
                  // rank: rank,
                  likesCounts: timeLineModel.postList[index].likesCounts,
                  contents: timeLineModel.postList[index].contents,
                  authorImage: timeLineModel.postList[index].authorImage,
                  authorName: timeLineModel.postList[index].authorName,
                  isShow: true,
                  addLikeCallback: () {
                    // timeLineModel.addLikeCounter();
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
