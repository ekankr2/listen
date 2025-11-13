// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String?,
      audioUrl: json['audioUrl'] as String,
      localPath: json['localPath'] as String?,
      durationMs: (json['durationMs'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      isViewed: json['isViewed'] as bool? ?? false,
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'audioUrl': instance.audioUrl,
      'localPath': instance.localPath,
      'durationMs': instance.durationMs,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'viewCount': instance.viewCount,
      'isViewed': instance.isViewed,
    };
