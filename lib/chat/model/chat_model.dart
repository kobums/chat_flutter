import 'package:chatflutter/chat/model/message_model.dart';
import 'package:chatflutter/user/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  final String? id;
  final List<UserModel>? users;
  final List<MessageModel> messages;

  ChatModel({
    required this.id,
    required this.users,
    required this.messages,
  });

  // Chat copyWith({
  //   String? id,
  //   List<User>? users,
  //   List<Message>? messages,
  // }) {
  //   return Chat(
  //     id: id ?? this.id,
  //     users: users ?? this.users,
  //     messages: messages ?? this.messages,
  //   );
  // }

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
