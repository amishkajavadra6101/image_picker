import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerExample extends StatefulWidget {
  const AudioPlayerExample({super.key});

  @override
  State<AudioPlayerExample> createState() => _AudioPlayerExampleState();
}

class _AudioPlayerExampleState extends State<AudioPlayerExample> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String audioUrl = 'example audi link';

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else if (state == PlayerState.stopped || state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      Source audioSource = UrlSource(audioUrl);
      audioPlayer.play(audioSource);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 48.0,
              onPressed: _playPause,
            ),
            Text(
              isPlaying ? 'Playing' : 'Paused',
              style: const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}