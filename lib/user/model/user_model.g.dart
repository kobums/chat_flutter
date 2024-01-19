// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      loginid: json['loginid'] as String,
      passwd: json['passwd'] as String,
      name: json['name'] as String,
      status: json['status'] as int,
      date: json['date'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'loginid': instance.loginid,
      'passwd': instance.passwd,
      'name': instance.name,
      'status': instance.status,
      'date': instance.date,
    };
