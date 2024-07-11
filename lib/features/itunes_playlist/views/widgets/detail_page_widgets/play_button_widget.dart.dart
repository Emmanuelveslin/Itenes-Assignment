import 'package:flutter/material.dart';

import '../../../view_models/detail_page_view_model.dart';

class PlayButtonWidget extends StatelessWidget {
  final Function() onButtonPressed;
  final VideoPlayerState videoPlayerState;

  const PlayButtonWidget({
    super.key,
    required this.onButtonPressed,
    required this.videoPlayerState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Center(
            child: IconButton(
              onPressed: () {
                onButtonPressed();
              },
              icon: Icon(
                videoPlayerState.isPlaying ? Icons.pause : Icons.play_arrow,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
