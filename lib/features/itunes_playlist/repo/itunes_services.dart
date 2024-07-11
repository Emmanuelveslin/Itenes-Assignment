import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:itunes_assignment/core/constants.dart';

import '../models/song_model.dart';

final itunesServiceProvider = Provider((ref) => ItunesServicesImpl());

abstract class ItunesServices {
  Future getSongs();
}

class ItunesServicesImpl implements ItunesServices {
  @override
  Future<List<SongModel>> getSongs() async {
    try {
      var response = await http.get(
        Uri.parse(itunesServiceUrl),
      );

      var data = jsonDecode(response.body);

      List<SongModel> songs = (data['results'] as List<dynamic>)
          .map((e) => SongModel.fromJson(e))
          .toList();

      return songs;
    } catch (e) {
      rethrow;
    }
  }
}

