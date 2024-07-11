import 'package:flutter/material.dart';

import '../../../models/song_model.dart';
import 'list_widget.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
    required this.filteredSongs,
  });

  final List<SongModel> filteredSongs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
        itemBuilder: (context, index) =>
            ListWidget(song: filteredSongs[index]),
        itemCount: filteredSongs.length,
      ));
  }
}