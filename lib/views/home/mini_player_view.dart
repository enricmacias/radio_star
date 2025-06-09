import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_star/views/player/play_pause_button_view.dart';
import '../../providers/player/player_provider.dart';
import '../player/player_view.dart';

class MiniPlayerView extends ConsumerStatefulWidget {
  const MiniPlayerView({super.key});

  @override
  ConsumerState<MiniPlayerView> createState() => _MiniPlayerViewState();
}

class _MiniPlayerViewState extends ConsumerState<MiniPlayerView>
    with WidgetsBindingObserver {
  AudioPlayer? _player;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player?.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final player = ref.watch(playerProvider);

    // Only initialize once
    if (_player != player) {
      _player = player;
      ref.read(playerProvider.notifier).init();
    }

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const PlayerView(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            // Album Art Placeholder
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 48,
                height: 48,
                color: Colors.grey[300],
                child: const Icon(Icons.music_note, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 12),
            // Radio Station Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Radio Station',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Progress Bar (static for now)
                  LinearProgressIndicator(
                    value: 0.4, // Example progress
                    minHeight: 3,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Play/Pause Button
            PlayPauseButtonView(),
          ],
        ),
      ),
    );
  }
}
