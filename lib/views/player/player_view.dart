import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_star/views/player/play_pause_button_view.dart';
import '../../providers/player/player_provider.dart';

class PlayerView extends ConsumerStatefulWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  ConsumerState<PlayerView> createState() => PlayerViewState();
}

class PlayerViewState extends ConsumerState<PlayerView>
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Now Playing'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Big thumbnail image
            Center(
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.music_note,
                  size: 120,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Radio Station Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Radio Station',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            PlayPauseButtonView(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
