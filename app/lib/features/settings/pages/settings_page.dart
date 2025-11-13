import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/style.dart';
import '../providers/settings_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);

    return CupertinoPageScaffold(
      backgroundColor: VoiceColors.background,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              VoiceColors.background,
              VoiceColors.surface.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              _buildSection(
                'Appearance',
                [
                  _buildSwitchTile(
                    context,
                    ref,
                    'Dark Mode',
                    'Enable dark theme',
                    CupertinoIcons.moon_fill,
                    settingsState.isDarkMode,
                    (value) => ref.read(settingsProvider.notifier).toggleDarkMode(),
                  ),
                ],
              ),
              _buildSection(
                'Account',
                [
                  _buildTile(
                    'Profile',
                    'Edit your profile information',
                    CupertinoIcons.person_circle,
                    () {},
                  ),
                  _buildTile(
                    'Privacy',
                    'Manage your privacy settings',
                    CupertinoIcons.lock_shield,
                    () {},
                  ),
                ],
              ),
              _buildSection(
                'Audio',
                [
                  _buildTile(
                    'Audio Quality',
                    'High quality (128kbps)',
                    CupertinoIcons.waveform,
                    () {},
                  ),
                  _buildTile(
                    'Auto-play',
                    'Automatically play next message',
                    CupertinoIcons.play_circle,
                    () {},
                  ),
                ],
              ),
              _buildSection(
                'About',
                [
                  _buildTile(
                    'Version',
                    '1.0.0',
                    CupertinoIcons.info_circle,
                    () {},
                  ),
                  _buildTile(
                    'Terms of Service',
                    'Read our terms',
                    CupertinoIcons.doc_text,
                    () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CupertinoButton(
                  color: VoiceColors.error,
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              ref.read(settingsProvider.notifier).logout();
                              Navigator.of(context).pop();
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Logout'),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: VoiceColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: VoiceColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return CupertinoButton(
      padding: const EdgeInsets.all(16),
      onPressed: onTap,
      child: Row(
        children: [
          Icon(icon, color: VoiceColors.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: VoiceColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: VoiceColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            CupertinoIcons.chevron_right,
            color: VoiceColors.textSecondary,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    WidgetRef ref,
    String title,
    String subtitle,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, color: VoiceColors.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: VoiceColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: VoiceColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: VoiceColors.primary,
          ),
        ],
      ),
    );
  }
}