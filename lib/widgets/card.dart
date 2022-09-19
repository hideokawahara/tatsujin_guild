//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';

//Utils
import 'package:tatsujin_guild/utils/popup.dart';

//Widgets
import 'package:tatsujin_guild/widgets/icon.dart';

class HomePostCard extends StatelessWidget {
  const HomePostCard({
    Key? key,
    required this.rank,
    required this.likesCounts,
    required this.contents,
    required this.authorImage,
    required this.authorName,
    this.margin,
    // required this.authorAge,
  }) : super(key: key);
  final int rank;
  final int likesCounts;
  final String contents;
  final String authorImage;
  final String authorName;
  final EdgeInsetsGeometry? margin;
  // final int authorAge;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context, rootNavigator: true).push(
        //   MaterialPageRoute(
        //     builder: (_) => FemaleDetailsPage(
        //       index: index,
        //       name: name,
        //       age: age,
        //       profileMessage: profileMessage,
        //       mainPhoto: mainPhoto,
        //       photoList: photoList,
        //       preference: preference,
        //     ),
        //   ),
        // );
      },
      child: Container(
        width: 200,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.defaultBackGroundColor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: Offset(10, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Hero(
                      tag: 'imageHero$rank',
                      child: Image.network(
                        authorImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.center,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.0),
                                Colors.black.withOpacity(1.0),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                authorName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 16,
                bottom: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'rankingHero$rank',
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainAppColor,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              // icon,
                              Text(
                                '第$rank位',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeLinePostcard extends StatefulWidget {
  const TimeLinePostcard({
    Key? key,
    // required this.rank,
    required this.isShow,
    required this.likesCounts,
    required this.contents,
    required this.authorImage,
    required this.authorName,
    required this.addLikeCallback,
  }) : super(key: key);
  // final int rank;
  final bool isShow;
  final int likesCounts;
  final String contents;
  final String authorImage;
  final String authorName;
  final void Function() addLikeCallback;

  @override
  State<TimeLinePostcard> createState() => _TimeLinePostcardState();
}

class _TimeLinePostcardState extends State<TimeLinePostcard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.defaultBackGroundColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.black12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1.0,
            blurRadius: 10.0,
            offset: Offset(10, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // const Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.contents,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                //Todo: fontを追加する
                // fontFamily: 'Shippori_Antique',
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                widget.isShow
                    ? CircleAvatar(
                        //Todo: image networkを差し替える
                        backgroundImage: Image.network(
                          widget.authorImage,
                          fit: BoxFit.cover,
                        ).image,
                      )
                    : Container(
                        height: 40,
                        width: 40,
                        // color: Colors.redAccent,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                const SizedBox(
                  width: 8,
                ),
                widget.isShow
                    ? Text(
                        widget.authorName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(
                        '???',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                const Spacer(),
                widget.isShow
                    ? Row(
                        children: [
                          const Icon(
                            Icons.favorite_rounded,
                            color: Colors.redAccent,
                          ),
                          Text(
                            '${widget.likesCounts}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : isFavorite
                        ? const Icon(
                            Icons.favorite_rounded,
                            color: Colors.redAccent,
                          )
                        : InkWell(
                            onTap: () {
                              widget.addLikeCallback();
                              setState(() {
                                isFavorite = true;
                              });
                            },
                            child: const Icon(
                              Icons.favorite_border,
                            ),
                          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritePostcard extends StatelessWidget {
  const FavoritePostcard({
    Key? key,
    required this.likesCounts,
    required this.contents,
    required this.authorImage,
    required this.authorName,
    required this.removeLikeCallback,
  }) : super(key: key);
  final int likesCounts;
  final String contents;
  final String authorImage;
  final String authorName;
  final void Function() removeLikeCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 200,
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.black12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1.0,
            blurRadius: 10.0,
            offset: Offset(10, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  contents,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //Todo: fontを追加する
                    // fontFamily: 'Shippori_Antique',
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  bool result = await showDeletePopup(
                    context: context,
                    messageText: 'お気に入りから削除しますか？',
                    deleteText: '削除する',
                    cancelText: 'キャンセル',
                    removeFavoriteCallback: () async {
                      await Future.delayed(Duration(milliseconds: 1000));
                      return true;
                    },
                  );
                  print('result: $result');
                },
                icon: const MoreHorizIcon(),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                CircleAvatar(
                  //Todo: image networkを差し替える
                  backgroundImage: Image.network(
                    authorImage,
                    fit: BoxFit.cover,
                  ).image,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  authorName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.favorite_rounded,
                      color: Colors.redAccent,
                    ),
                    Text(
                      '$likesCounts',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyPostcard extends StatelessWidget {
  const MyPostcard({
    Key? key,
    required this.likesCounts,
    required this.contents,
    required this.deletePostCallback,
  }) : super(key: key);
  final int likesCounts;
  final String contents;
  final Future<bool> Function() deletePostCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 200,
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.black12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1.0,
            blurRadius: 10.0,
            offset: Offset(10, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  contents,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //Todo: fontを追加する
                    // fontFamily: 'Shippori_Antique',
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  bool result = await showDeletePopup(
                    context: context,
                    messageText: '投稿を削除しますか？',
                    deleteText: '削除する',
                    cancelText: 'キャンセル',
                    removeFavoriteCallback: deletePostCallback,
                  );
                  print('result: $result');
                },
                icon: const MoreHorizIcon(),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                const Spacer(),
                const Icon(
                  Icons.favorite_rounded,
                  color: Colors.redAccent,
                ),
                Text(
                  '$likesCounts',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
