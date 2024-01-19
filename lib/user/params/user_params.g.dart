// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserParams _$UserParamsFromJson(Map<String, dynamic> json) => UserParams(
      id: json['id'] as int?,
      loginid: json['loginid'] as String?,
      passwd: json['passwd'] as String?,
      name: json['name'] as String?,
      status: json['status'] as int?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$UserParamsToJson(UserParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loginid': instance.loginid,
      'passwd': instance.passwd,
      'name': instance.name,
      'status': instance.status,
      'date': instance.date,
    };
