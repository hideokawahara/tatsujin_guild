//Packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    @JsonKey(name: 'profile_message') required String profileMessage,
    @JsonKey(name: 'main_photo') required String mainPhoto,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
