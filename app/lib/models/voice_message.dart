import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_message.freezed.dart';
part 'voice_message.g.dart';

@freezed
class VoiceMessage with _$VoiceMessage {
  const factory VoiceMessage({
    required String id,
    required String senderId,
    String? senderName,
    String? senderAvatar,
    required String audioUrl,
    required String? localPath,
    required int durationMs,
    required DateTime createdAt,
    @Default(false) bool isPlaying,
    @Default(false) bool isFromCurrentUser,
  }) = _VoiceMessage;

  factory VoiceMessage.fromJson(Map<String, dynamic> json) =>
      _$VoiceMessageFromJson(json);
}