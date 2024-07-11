import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes_assignment/core/constants.dart';

import '../../../view_models/list_view_model.dart';
import 'grid_view_builder.dart';
import 'list_view_builder.dart';
import 'search_widget.dart';


class ItunesViewBuilder extends StatefulWidget {
  const ItunesViewBuilder({super.key});

  @override
  State<ItunesViewBuilder> createState() => _ItunesViewBuilderState();
}

class _ItunesViewBuilderState extends State<ItunesViewBuilder> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final searchController = ref.watch(searchControllerProvider);
        final filteredSongs = ref.watch(filteredSongsProvider);
        final isListView = ref.watch(isListViewProvider);

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      discoverText,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ),
                  Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white70,
                  )
                ],
              ),
              SearchWidget(
                isListView: isListView,
                onChangedController: (value) {
                  // ignore: unused_result
                  ref.refresh(filteredSongsProvider);
                },
                onListpressed: () {
                  ref.read(isListViewProvider.notifier).state = true;
                },
                onGridPressed: () {
                  ref.read(isListViewProvider.notifier).state = false;
                },
                searchController: searchController,
              ),
              isListView
                  ? ListViewBuilder(filteredSongs: filteredSongs)
                  : GridViewBuilder(filteredSongs: filteredSongs)
            ],
          ),
        );
      },
    );
  }
}
