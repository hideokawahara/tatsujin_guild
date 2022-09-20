//Packages
import 'package:flutter/material.dart';

class PostTextForm extends StatefulWidget {
  const PostTextForm({
    Key? key,
    required this.setTextCallback,
  }) : super(key: key);
  final void Function(String) setTextCallback;

  @override
  State<PostTextForm> createState() => _PostTextFormState();
}

class _PostTextFormState extends State<PostTextForm> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: TextFormField(
        autofocus: true,
        onChanged: (String value) {
          // widget.controller.text = value;
          widget.setTextCallback(value);
        },
        controller: controller,
        maxLines: 4,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          //Todo: フォントを追加する
          fontFamily: 'Shippori_Antique',
        ),
        decoration: InputDecoration(
          hintText: '投稿する',
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          fillColor: Colors.grey[50],
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.grey[100]!,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
