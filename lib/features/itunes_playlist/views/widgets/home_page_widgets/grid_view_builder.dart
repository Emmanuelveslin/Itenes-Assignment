import 'package:flutter/material.dart';

import '../../../models/song_model.dart';
import 'grid_widget.dart';


class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    super.key,
    required this.filteredSongs,
  });

  final List<SongModel> filteredSongs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
          childAspectRatio:.5,
          crossAxisCount: 3,
        ),
        itemCount: filteredSongs.length,
        itemBuilder: (context, index) => GridWidget(
          song: filteredSongs[index],
        ),
      ));
  }
}