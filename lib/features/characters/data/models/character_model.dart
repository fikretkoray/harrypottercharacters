import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    String? id,
    String? name,
    @Default([]) List<String> alternateNames,
    String? species,
    String? gender,
    String? house,
    String? dateOfBirth,
    int? yearOfBirth,
    bool? wizard,
    String? ancestry,
    String? eyeColour,
    String? hairColour,
    WandModel? wand,
    String? patronus,
    bool? hogwartsStudent,
    bool? hogwartsStaff,
    String? actor,
    bool? alive,
    String? image,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}

@freezed
class WandModel with _$WandModel {
  const factory WandModel({
    String? wood,
    String? core,
    double? length,
  }) = _WandModel;

  factory WandModel.fromJson(Map<String, dynamic> json) =>
      _$WandModelFromJson(json);
}
