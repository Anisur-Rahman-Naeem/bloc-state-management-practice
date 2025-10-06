import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel{
  factory UserModel({
    @Default('') @JsonKey(name: 'access_token') String access_token,
    @Default('') @JsonKey(name: 'refresh_token') String refresh_token,
    @Default('') @JsonKey(name: 'message') String message

}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}