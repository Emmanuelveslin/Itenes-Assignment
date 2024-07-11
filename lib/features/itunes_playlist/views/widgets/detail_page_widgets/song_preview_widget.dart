import 'package:flutter/material.dart';

import '../../../view_models/detail_page_view_model.dart';
import 'play_button_widget.dart.dart';

class SongPreviewWidget extends StatelessWidget {
  
  final String trackName;
  final VideoPlayerState videoPlayerState;
  final Function() onPlayButtonPressed;

  const SongPreviewWidget({
    super.key,
    required this.trackName,
    required this.videoPlayerState,
    required this.onPlayButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            trackName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 25),
        PlayButtonWidget(
          onButtonPressed: onPlayButtonPressed,
          videoPlayerState: videoPlayerState,
        ),
      ],
    );
  }
}
