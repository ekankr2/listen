import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/storage_service.dart';

part 'settings_provider.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  SettingsState build() {
    _loadSettings();
    return const SettingsState();
  }

  void _loadSettings() {
    final storage = ref.read(storageServiceProvider);
    final isDarkMode = storage.getDarkMode();
    state = state.copyWith(isDarkMode: isDarkMode);
  }

  Future<void> toggleDarkMode() async {
    final newValue = !state.isDarkMode;
    final storage = ref.read(storageServiceProvider);
    await storage.setDarkMode(newValue);
    state = state.copyWith(isDarkMode: newValue);
  }

  Future<void> logout() async {
    final storage = ref.read(storageServiceProvider);
    await storage.clearAll();
    // Navigate to login screen will be handled by router
  }
}

class SettingsState {
  final bool isDarkMode;

  const SettingsState({
    this.isDarkMode = false,
  });

  SettingsState copyWith({
    bool? isDarkMode,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}