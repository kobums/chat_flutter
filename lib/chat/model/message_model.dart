import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String senderId;
  final String recipientId;
  final String text;
  final DateTime createdAt;

  MessageModel({
    required this.senderId,
    required this.recipientId,
    required this.text,
    required this.createdAt,
  });

  // static List<Message> messages = [
  //   Message(
  //     senderId: '4',
  //     recipientId: '1',
  //     text: 'Hey, I am good, thanks. What are you dong here today?',
  //     createdAt: DateTime(2024, 01, 15, 10, 10, 10).add(
  //       const Duration(seconds: 250),
  //     ),
  //   ),
  // ];

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
