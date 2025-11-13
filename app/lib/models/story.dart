import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    required String userId,
    required String userName,
    String? userAvatar,
    required String audioUrl,
    String? localPath,
    required int durationMs,
    required DateTime createdAt,
    required DateTime expiresAt,
    @Default(0) int viewCount,
    @Default(false) bool isViewed,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) =>
      _$StoryFromJson(json);
}