import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_app/app/features/playlist/presentation/search_songs/search_songs_controller.dart';
import 'package:spotify_app/app/features/playlist/presentation/search_songs/widgets/song_list_search.dart';
import 'package:spotify_app/app/shared/presentation/components/background_gradient.dart';
import 'package:spotify_app/app/shared/presentation/components/loading_widget.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class SearchSongsView extends ConsumerWidget {
  const SearchSongsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final isLoading = ref.watch(searchSongsLoaderProvider);

    //Elements
    Widget data = CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: AppColors.grayBar,
          title: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Buscar",
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {},
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10.0),
        ),
        const SongListSearch(),
      ],
    );
    Widget loading = const Column(
      children: [
        Spacer(),
        Center(child: LoadingWidget()),
        Spacer(),
      ],
    );

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundGradient(
              color: Color.fromRGBO(228, 80, 129, 1),
            ),
            SizedBox(
              height: QuerySize.height(context, 1),
              child: isLoading.when(
                  data: (_) => data,
                  error: (_, __) => null,
                  loading: () => loading),
            ),
          ],
        ),
      ),
    );
  }
}
