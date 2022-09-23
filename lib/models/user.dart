class User {
  User({
    required this.name,
    required this.profileMessage,
    required this.mainPhoto,
  });
  final String name;
  String profileMessage;
  //Todo: 将来的にfinalにする
  String mainPhoto;

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      profileMessage: json['profile_message'],
      mainPhoto: json['main_photo'],
    );
  }
}
