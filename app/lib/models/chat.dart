import 'package:freezed_annotation/freezed_annotation.dart';
import 'voice_message.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String id,
    required String participantId,
    required String participantName,
    String? participantAvatar,
    VoiceMessage? lastMessage,
    required DateTime updatedAt,
    @Default(0) int unreadCount,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) =>
      _$ChatFromJson(json);
}