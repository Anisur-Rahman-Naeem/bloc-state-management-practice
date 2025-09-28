// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => _PersonModel(
  name: json['name'] as String? ?? '',
  age: (json['age'] as num?)?.toInt() ?? 0,
  nae:
      (json['nae'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$PersonModelToJson(_PersonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'nae': instance.nae,
    };
