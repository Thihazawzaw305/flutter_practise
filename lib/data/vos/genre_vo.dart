import 'package:flutter_practise/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'genre_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_GENRE_VO,adapterName: "GenreVOAdapter")
class GenreVO {

  @HiveField(0)
  @JsonKey(name: "id")
  int? id;

  @HiveField(1)
  @JsonKey(name: "name")
  String? name;

  GenreVO(this.id, this.name);



  factory GenreVO.fromJson(Map<String, dynamic> json) => _$GenreVOFromJson(json);
  Map<String,dynamic> toJson() => _$GenreVOToJson(this);

}
