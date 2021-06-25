import 'dart:convert';

class UserModel {
  final String name;
  final String? photoURL;

  UserModel({required this.name, this.photoURL});

  Map<String, dynamic> toMap() => {'name': name, 'photoURL': photoURL};

  factory UserModel.fromMap(Map<String, dynamic> data) =>
      UserModel(name: data['name']!, photoURL: data['photoURL']);

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
