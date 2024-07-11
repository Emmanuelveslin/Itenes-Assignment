import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes_assignment/features/itunes_playlist/models/song_model.dart';
import 'package:itunes_assignment/features/itunes_playlist/repo/itunes_services.dart';

import '../../../core/constants.dart';

class ItunesViewState {
  final bool isLoading;
  final List<SongModel> songs;
  final String? errorMessage;

  ItunesViewState({
    required this.isLoading,
    required this.songs,
    this.errorMessage,
  });

  ItunesViewState copyWith({
    bool? isLoading,
    List<SongModel>? songs,
    String? errorMessage,
  }) {
    return ItunesViewState(
      isLoading: isLoading ?? this.isLoading,
      songs: songs ?? this.songs,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class ItunesViewModel extends StateNotifier<ItunesViewState> {
  ItunesViewModel(this.ref) : super(ItunesViewState(isLoading: false, songs: []));

  final Ref ref;

  Future<void> getSongs() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final songs = await ref.read(itunesServiceProvider).getSongs();
      state = state.copyWith(isLoading: false, songs: songs);
    } on SocketException {
      state = state.copyWith(isLoading: false, errorMessage: noInternetText);
    } on TimeoutException {
      state = state.copyWith(isLoading: false, errorMessage: requestTimeOutText);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: errorOccuredText);
    }
  }
}

final itunesViewModelProvider = StateNotifierProvider<ItunesViewModel, ItunesViewState>((ref) {
  return ItunesViewModel(ref);
});

final homeViewFutureProvider = FutureProvider(
    (ref) async => ref.watch(itunesViewModelProvider.notifier).getSongs());
