import 'package:json_annotation/json_annotation.dart';

part 'src.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class Src {
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  Src(
      {required this.original,
      required this.large2x,
      required this.large,
      required this.medium,
      required this.small,
      required this.portrait,
      required this.landscape,
      required this.tiny});

  factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);

  Map<String, dynamic> toJson() => _$SrcToJson(this);
}