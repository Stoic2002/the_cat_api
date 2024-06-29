import 'package:equatable/equatable.dart';

class CatImage extends Equatable {
  final String id;
  final String url;
  final int width;
  final int height;

  const CatImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatImage.fromJson(Map<String, dynamic> json) {
    return CatImage(
      id: json['id'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  @override
  List<Object> get props => [id, url, width, height];
}
