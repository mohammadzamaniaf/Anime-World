import 'package:flutter/foundation.dart' show immutable;

@immutable
class MainPicture {
  final String medium;
  final String large;

  const MainPicture({
    required this.medium,
    required this.large,
  });

  factory MainPicture.fromJson(Map<String, dynamic> json) {
    return MainPicture(
      medium: json['medium'],
      large: json['large'],
    );
  }
}
