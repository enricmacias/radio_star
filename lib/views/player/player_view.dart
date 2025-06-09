import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import '../../view_models/player/player_view_model.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlButtons(player),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(playerProvider.notifier)
                      .onAudioSourceChanged(
                        "http://stream.riverradio.com:8000/wcvofm.aac",
                      );
                },
                child: const Text('new radio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Text("Adjust volume"),
                    content: StreamBuilder<double>(
                      stream: player.volumeStream,
                      builder: (context, snapshot) {
                        final volume = snapshot.data ?? player.volume;
                        return Slider(
                          min: 0.0,
                          max: 1.0,
                          divisions: 10,
                          value: volume,
                          onChanged: player.setVolume,
                        );
                      },
                    ),
                  ),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay),
                iconSize: 64.0,
                onPressed: () => player.seek(Duration.zero),
              );
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.stop),
          iconSize: 64.0,
          onPressed: player.stop,
        ),
        StreamBuilder<double>(
          stream: player.speedStream,
          builder:
              (context, snapshot) => IconButton(
                icon: Text(
                  "${(snapshot.data ?? player.speed).toStringAsFixed(1)}x",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Adjust speed"),
                          content: StreamBuilder<double>(
                            stream: player.speedStream,
                            builder: (context, snapshot) {
                              final speed = snapshot.data ?? player.speed;
                              return Slider(
                                min: 0.5,
                                max: 1.5,
                                divisions: 10,
                                value: speed,
                                onChanged: player.setSpeed,
                              );
                            },
                          ),
                        ),
                  );
                },
              ),
        ),
      ],
    );
  }
}
