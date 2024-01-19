import 'package:json_annotation/json_annotation.dart';

part 'user_params.g.dart';

@JsonSerializable()
class UserParams {
  
  final int? id;
  final String? loginid;
  final String? passwd;
  final String? name;
  final int? status;
  final String? date;

  const UserParams({
    
    this.id,
    this.loginid,
    this.passwd,
    this.name,
    this.status,
    this.date,
  });

  factory UserParams.fromJson(Map<String, dynamic> json) =>
      _$UserParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UserParamsToJson(this);
}
