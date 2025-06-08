import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_models/player/player_view_model.dart';

class PlayerView extends ConsumerStatefulWidget {
  const PlayerView({super.key});

  @override
  ConsumerState<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends ConsumerState<PlayerView> {
  @override
  Widget build(BuildContext context) {
    final radioPlayer = ref.watch(radioPlayerProvider);

    // Only initialize once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      radioPlayer.initialize([
        {"url": "https://s2-webradio.antenne.de/chillout?icy=https"},
        {
          "title": "SunFM - Sri Lanka",
          "artwork": "images/sample-cover.jpg",
          "url":
              "https://radio.lotustechnologieslk.net:2020/stream/sunfmgarden?icy=https",
        },
        {"url": "http://stream.riverradio.com:8000/wcvofm.aac"},
      ], true);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Plugin example app')),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await radioPlayer.prevSource();
                  },
                  icon: const Icon(Icons.skip_previous_sharp),
                ),
                StreamBuilder(
                  stream: radioPlayer.getPlaybackStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                        onPressed: () {
                          if (snapshot.data!) {
                            radioPlayer.pause();
                          } else {
                            radioPlayer.play();
                          }
                        },
                        icon:
                            !snapshot.data!
                                ? const Icon(Icons.play_arrow)
                                : const Icon(Icons.pause),
                        iconSize: 50.0,
                      );
                    }
                    return const Text("Player unavailable");
                  },
                ),
                IconButton(
                  onPressed: () async {
                    await radioPlayer.nextSource();
                  },
                  icon: const Icon(Icons.skip_next_sharp),
                ),
              ],
            ),
            StreamBuilder(
              stream: radioPlayer.getNowPlayingStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data?.title != null) {
                  return Text("Now playing : ${snapshot.data?.title}");
                }
                return const Text("N/A");
              },
            ),
            StreamBuilder(
              stream: radioPlayer.getDeviceVolumeChangedStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Volume = ${snapshot.data?.volume.floor()} and IsMuted = ${snapshot.data?.isMuted}",
                  );
                }
                return const Text("No Vol data");
              },
            ),
            FutureBuilder(
              future: radioPlayer.getVolume(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Slider(
                    value: snapshot.data ?? 0,
                    min: 0,
                    max: 1,
                    onChanged: (value) {
                      ref
                          .read(radioPlayerProvider.notifier)
                          .onVolumeChanged(value);
                    },
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
