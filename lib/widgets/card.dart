//Packages
import 'package:flutter/material.dart';

class HomePostCard extends StatelessWidget {
  const HomePostCard({
    Key? key,
    required this.rank,
    required this.likesCounts,
    required this.contents,
    required this.authorImage,
    required this.authorName,
    // required this.authorAge,
  }) : super(key: key);
  final int rank;
  final int likesCounts;
  final String contents;
  final String authorImage;
  final String authorName;
  // final int authorAge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
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
