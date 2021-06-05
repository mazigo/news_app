import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable(nullable: false)
class Article {
  Article();
  @JsonKey(name: 'author')
  late String author;

  @JsonKey(name: 'title')
  late String title;

  @JsonKey(name: 'description')
  late String description;

  @JsonKey(name: 'url')
  late String url;

  @JsonKey(name: 'urlToImage')
  late String urlToImage;

  @JsonKey(name: 'publishedAt')
  late String publishedAt;

  @JsonKey(name: 'content')
  late String content;

  DateTime? get getPublishedAtDate => DateTime.tryParse(publishedAt);
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
