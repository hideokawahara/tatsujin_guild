//Packages
import 'package:flutter/material.dart';

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
    return Container(
      width: 200,
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
            children: [
              Text(
                '人気$rank位',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
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
          const Divider(),
          Align(
            alignment: Alignment.centerLeft,
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
              ],
            ),
          ),
        ],
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
                  bool result = await showRemoveFavoritePopup(
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
                  bool result = await showRemoveFavoritePopup(
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
