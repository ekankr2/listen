// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: json['id'] as String,
      participantId: json['participantId'] as String,
      participantName: json['participantName'] as String,
      participantAvatar: json['participantAvatar'] as String?,
      lastMessage: json['lastMessage'] == null
          ? null
          : VoiceMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantId': instance.participantId,
      'participantName': instance.participantName,
      'participantAvatar': instance.participantAvatar,
      'lastMessage': instance.lastMessage,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'unreadCount': instance.unreadCount,
    };
