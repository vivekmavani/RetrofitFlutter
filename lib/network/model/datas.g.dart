// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      yearbook_name: json['yearbook_name'] as String,
      yearbook_description: YearbookDescription.fromJson(
          json['yearbook_description'] as Map<String, dynamic>),
      img_http_thumb: json['img_http_thumb'] as String,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'yearbook_name': instance.yearbook_name,
      'yearbook_description': instance.yearbook_description,
      'img_http_thumb': instance.img_http_thumb,
    };
