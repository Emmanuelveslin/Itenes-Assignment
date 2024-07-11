import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/song_model.dart';
import '../../pages/detail_page.dart';
import '../common/network_image_widget.dart';

class ListWidget extends StatelessWidget {
  final SongModel song;
  const ListWidget({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: GestureDetector(
        onTap: () {
           FocusScope.of(context).unfocus();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProviderScope(child: DetailPage(song: song)),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white24),
              color: Colors.white12,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.white)),
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: NetworkImageWidget(
                    imageUrl: song.artworkUrl100,
                
                    height: 90,
                    width: 90,
                  ),
                ),
              ),
             const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SizedBox(
                height: 90,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.trackName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Text(
                      song.collectionName,
                      style: const TextStyle(color: Colors.white54),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      song.artistName,
                      style: const TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
