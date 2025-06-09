// Minimal radio player using just_audio, no media_kit_stub.dart dependency.

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  PlayerViewState createState() => PlayerViewState();
}

class PlayerViewState extends State<PlayerView> with WidgetsBindingObserver {
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black),
    );
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.errorStream.listen((e) {
      print('A stream error occurred: $e');
    });
    try {
      // Use the provided radio stream URL
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse("https://s2-webradio.antenne.de/chillout?icy=https"),
        ),
      );
    } on PlayerException catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlButtons(_player),
              ElevatedButton(
                onPressed: () {
                  _player.setAudioSource(
                    AudioSource.uri(
                      Uri.parse("http://stream.riverradio.com:8000/wcvofm.aac"),
                    ),
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

// Helper class for seek bar data
class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

// Simple SeekBar widget
class SeekBar extends StatelessWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar({
    Key? key,
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChangeEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max:
          duration.inMilliseconds.toDouble() > 0
              ? duration.inMilliseconds.toDouble()
              : 1.0,
      value:
          position.inMilliseconds
              .clamp(
                0,
                duration.inMilliseconds > 0 ? duration.inMilliseconds : 1,
              )
              .toDouble(),
      onChanged: (value) {},
      onChangeEnd: (value) {
        if (onChangeEnd != null) {
          onChangeEnd!(Duration(milliseconds: value.round()));
        }
      },
    );
  }
}
