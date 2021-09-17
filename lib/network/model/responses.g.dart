// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Responses _$ResponsesFromJson(Map<String, dynamic> json) => Responses(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponsesToJson(Responses instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
