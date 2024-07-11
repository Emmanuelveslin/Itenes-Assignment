

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:itunes_assignment/features/itunes_playlist/models/song_model.dart';

class VideoPlayerState {
  final bool isPlaying;
  final bool isPreviewMode;
  final VideoPlayerController? controller;

  VideoPlayerState({
    required this.isPlaying,
    required this.isPreviewMode,
    required this.controller,
  });

  VideoPlayerState copyWith({
    bool? isPlaying,
    bool? isPreviewMode,
    VideoPlayerController? controller,
  }) {
    return VideoPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      isPreviewMode: isPreviewMode ?? this.isPreviewMode,
      controller: controller ?? this.controller,
    );
  }
}

class VideoPlayerNotifier extends StateNotifier<VideoPlayerState> {
  VideoPlayerNotifier(SongModel song)
      : super(VideoPlayerState(isPlaying: false, isPreviewMode: true, controller: null)) {
    _initializeController(song.previewUrl);
  }

  Future<void> _initializeController(String url) async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(url) );
    await controller.initialize();
    controller.addListener(() {
      if (controller.value.position == controller.value.duration) {
        state = state.copyWith(isPlaying: false, isPreviewMode: true);
      } else {
        state = state.copyWith(isPlaying: controller.value.isPlaying, isPreviewMode: false);
      }
    });
    state = state.copyWith(controller: controller);
  }

  void playPause() {
    if (state.controller == null) return;

    if (state.isPlaying) {
      state.controller?.pause();
    } else {
      if (state.controller!.value.position == state.controller!.value.duration) {
        state.controller!.seekTo(Duration.zero); // Rewind to start if video has ended
      }
      state.controller?.play();
    }
  }

  @override
  void dispose() {
    state.controller?.dispose();
    super.dispose();
  }
}

final videoPlayerProvider = StateNotifierProvider.family<VideoPlayerNotifier, VideoPlayerState, SongModel>(
  (ref, song) => VideoPlayerNotifier(song),
);
