// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatHash() => r'c2737c24d224af8d2b91699e8945bd15dc8bfdf9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Chat extends BuildlessAutoDisposeNotifier<ChatState> {
  late final String chatId;

  ChatState build(
    String chatId,
  );
}

/// See also [Chat].
@ProviderFor(Chat)
const chatProvider = ChatFamily();

/// See also [Chat].
class ChatFamily extends Family<ChatState> {
  /// See also [Chat].
  const ChatFamily();

  /// See also [Chat].
  ChatProvider call(
    String chatId,
  ) {
    return ChatProvider(
      chatId,
    );
  }

  @override
  ChatProvider getProviderOverride(
    covariant ChatProvider provider,
  ) {
    return call(
      provider.chatId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatProvider';
}

/// See also [Chat].
class ChatProvider extends AutoDisposeNotifierProviderImpl<Chat, ChatState> {
  /// See also [Chat].
  ChatProvider(
    String chatId,
  ) : this._internal(
          () => Chat()..chatId = chatId,
          from: chatProvider,
          name: r'chatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$chatHash,
          dependencies: ChatFamily._dependencies,
          allTransitiveDependencies: ChatFamily._allTransitiveDependencies,
          chatId: chatId,
        );

  ChatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
  }) : super.internal();

  final String chatId;

  @override
  ChatState runNotifierBuild(
    covariant Chat notifier,
  ) {
    return notifier.build(
      chatId,
    );
  }

  @override
  Override overrideWith(Chat Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatProvider._internal(
        () => create()..chatId = chatId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Chat, ChatState> createElement() {
    return _ChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatProvider && other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatRef on AutoDisposeNotifierProviderRef<ChatState> {
  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _ChatProviderElement
    extends AutoDisposeNotifierProviderElement<Chat, ChatState> with ChatRef {
  _ChatProviderElement(super.provider);

  @override
  String get chatId => (origin as ChatProvider).chatId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
