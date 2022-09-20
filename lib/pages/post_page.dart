//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

//Utils
import '../utils/dialog.dart';
import '../utils/progress_function.dart';

//ViewModels
import '../view_models/time_line_view_model.dart';

//Widgets
import 'package:tatsujin_guild/widgets/button.dart';
import 'package:tatsujin_guild/widgets/text_form.dart';
import 'package:tatsujin_guild/widgets/icon.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ChangeNotifierProvider(
        create: (_) => TimeLineViewModel(),
        child: Scaffold(
          backgroundColor: AppColors.defaultBackGroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.defaultBackGroundColor,
            title: const Text(
              '投稿',
              style: AppStyles.titleStyle,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              icon: const CloseIcon(),
            ),
          ),
          body: const PostPageBody(),
        ),
      ),
    );
  }
}

class PostPageBody extends StatefulWidget {
  const PostPageBody({Key? key}) : super(key: key);

  @override
  State<PostPageBody> createState() => _PostPageBodyState();
}

class _PostPageBodyState extends State<PostPageBody> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    void setPostTextCallback(String text) =>
        Provider.of<TimeLineViewModel>(context, listen: false).postText = text;
    return SafeArea(
      child: Column(
        children: [
          PostTextForm(
            setTextCallback: setPostTextCallback,
          ),
          const Spacer(),
          Consumer<TimeLineViewModel>(
            builder: (context, timeLineModel, child) {
              if (timeLineModel.postText.isNotEmpty) {
                return PostButton(
                  isActivate: timeLineModel.postText.isNotEmpty,
                  width: screenWidth,
                  onTap: () async {
                    bool result = await functionUseProgressIndicator(
                      context: context,
                      function: () => timeLineModel.createPost(),
                    );
                    if (result) {
                      await showResultDialog(
                        context: context,
                        dialogText: '投稿しました',
                      );
                      if (!mounted) return;
                      Navigator.of(context, rootNavigator: true).pop(
                        {'update': true},
                      );
                    } else {
                      await showResultDialog(
                        context: context,
                        dialogText: '投稿に失敗しました',
                      );
                    }
                  },
                );
              } else {
                return PostButton(
                  width: screenWidth,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
