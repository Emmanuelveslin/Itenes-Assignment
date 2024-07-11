import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes_assignment/features/itunes_playlist/models/song_model.dart';
import 'package:itunes_assignment/features/itunes_playlist/view_models/itunes_view_model.dart';


class SearchControllerNotifier extends StateNotifier<TextEditingController> {
  SearchControllerNotifier() : super(TextEditingController());

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}

// Provider for search controller
final searchControllerProvider = StateNotifierProvider<SearchControllerNotifier, TextEditingController>((ref) {
  return SearchControllerNotifier();
});

// Provider for ListView/Grid view mode
final isListViewProvider = StateProvider<bool>((ref) {
  return true; // Initial value of isListView
});

// Provider to filter songs based on search and view mode
final filteredSongsProvider = StateProvider<List<SongModel>>((ref) {
  final searchTerm = ref.watch(searchControllerProvider).text.toLowerCase();
 final List<SongModel> songs =
      ref.watch(itunesViewModelProvider.select((state) => state.songs));

  return songs.where((song) {
    return song.artistName.toLowerCase().contains(searchTerm) || song.trackName.toLowerCase().contains(searchTerm);
  }).toList();
});
