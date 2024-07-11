import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_models/itunes_view_model.dart';
import '../widgets/home_page_widgets/error_widget.dart';
import '../widgets/home_page_widgets/view_builder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  getSongs() {
    ref.read(itunesViewModelProvider.notifier).getSongs();
  }

  refreshSongs() {
    ref.refresh(itunesViewModelProvider.notifier).getSongs();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSongs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itunesViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.errorMessage != null
                ? ErrorRetryWidget(
                    errorMessage: state.errorMessage!, onRetry: refreshSongs)
                : const SafeArea(child: ItunesViewBuilder()),
      ),
    );
  }
}
