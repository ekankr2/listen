// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoiceMessageImpl _$$VoiceMessageImplFromJson(Map<String, dynamic> json) =>
    _$VoiceMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String?,
      senderAvatar: json['senderAvatar'] as String?,
      audioUrl: json['audioUrl'] as String,
      localPath: json['localPath'] as String?,
      durationMs: (json['durationMs'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isPlaying: json['isPlaying'] as bool? ?? false,
      isFromCurrentUser: json['isFromCurrentUser'] as bool? ?? false,
    );

Map<String, dynamic> _$$VoiceMessageImplToJson(_$VoiceMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'audioUrl': instance.audioUrl,
      'localPath': instance.localPath,
      'durationMs': instance.durationMs,
      'createdAt': instance.createdAt.toIso8601String(),
      'isPlaying': instance.isPlaying,
      'isFromCurrentUser': instance.isFromCurrentUser,
    };
