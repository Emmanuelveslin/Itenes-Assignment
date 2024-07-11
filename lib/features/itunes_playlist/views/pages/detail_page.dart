import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:video_player/video_player.dart';

import 'package:itunes_assignment/core/utils.dart';

import '../../models/song_model.dart';
import '../../view_models/detail_page_view_model.dart';
import '../widgets/common/network_image_widget.dart';
import '../widgets/common/page_app_bar.dart';
import '../widgets/detail_page_widgets/buy_now_button.dart';
import '../widgets/detail_page_widgets/song_info_widget.dart';
import '../widgets/detail_page_widgets/song_preview_widget.dart';

class DetailPage extends ConsumerWidget {
  final SongModel song;
  const DetailPage({required this.song, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoPlayerState = ref.watch(videoPlayerProvider(song));
    final controller = videoPlayerState.controller;

    return Scaffold(
      appBar: DetailPageAppBar(
        title: Text(
          capitalizeFirstLetter(song.wrapperType),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (videoPlayerState.isPreviewMode ||
                        (controller != null && !controller.value.isInitialized))
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: NetworkImageWidget(
                          height: MediaQuery.of(context).size.height * 0.65,
                          imageUrl: song.artworkUrl100,
                        ),
                      )
                    else if (controller != null &&
                        controller.value.isInitialized)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: VideoPlayer(controller),
                      )
                    else
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (videoPlayerState.isPreviewMode &&
                        (controller == null || !controller.value.isInitialized))
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SongPreviewWidget(
                trackName: song.trackCensoredName,
                videoPlayerState: videoPlayerState,
                onPlayButtonPressed: () {
                  ref.read(videoPlayerProvider(song).notifier).playPause();
                },
              ),
              const SizedBox(height: 12),
              SongInfoWidget(
                artistName: song.artistName,
                collectionName: song.collectionName,
                releaseDate: song.releaseDate,
              ),
              BuyNowButton(collectionPrice: song.collectionPrice.toString()),
            ],
          ),
        ),
      ),
    );
  }
}



