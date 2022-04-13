// https://app.quicktype.io/?l=dart

import 'dart:convert';

class Character {
  Character({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.image,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  final int charId;
  final String name;
  final String birthday;
  final List<String> occupation;
  final String image;
  final String status;
  final String nickname;
  final List<int> appearance;
  final String portrayed;
  final String category;
  final List<dynamic> betterCallSaulAppearance;

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        charId: json['char_id'],
        name: json['name'],
        birthday: json['birthday'],
        occupation: List<String>.from(json['occupation'].map((x) => x)),
        image: json['img'],
        status: json['status'],
        nickname: json['nickname'],
        appearance: List<int>.from(json['appearance'].map((x) => x)),
        portrayed: json['portrayed'],
        category: json['category'],
        betterCallSaulAppearance: List<dynamic>.from(
            json['better_call_saul_appearance'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'char_id': charId,
        'name': name,
        'birthday': birthday,
        'occupation': List<dynamic>.from(occupation.map((x) => x)),
        'img': image,
        'status': status,
        'nickname': nickname,
        'appearance': List<dynamic>.from(appearance.map((x) => x)),
        'portrayed': portrayed,
        'category': category,
        'better_call_saul_appearance':
            List<dynamic>.from(betterCallSaulAppearance.map((x) => x)),
      };

  Character copyWith({
    int? charId,
    String? name,
    String? birthday,
    List<String>? occupation,
    String? image,
    String? status,
    String? nickname,
    List<int>? appearance,
    String? portrayed,
    String? category,
    List<dynamic>? betterCallSaulAppearance,
  }) =>
      Character(
        charId: charId ?? this.charId,
        name: name ?? this.name,
        birthday: birthday ?? this.birthday,
        occupation: occupation ?? this.occupation,
        image: image ?? this.image,
        status: status ?? this.status,
        nickname: nickname ?? this.nickname,
        appearance: appearance ?? this.appearance,
        portrayed: portrayed ?? this.portrayed,
        category: category ?? this.category,
        betterCallSaulAppearance:
            betterCallSaulAppearance ?? this.betterCallSaulAppearance,
      );
}
