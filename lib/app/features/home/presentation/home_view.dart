import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_app/app/features/home/presentation/home_controller.dart';
import 'package:spotify_app/app/features/home/presentation/widgets/home_appbar_delegate.dart';
import 'package:spotify_app/app/features/home/presentation/widgets/playlist_grid.dart';
import 'package:spotify_app/app/shared/presentation/components/background_gradient.dart';
import 'package:spotify_app/app/shared/presentation/components/custom_navigation_bar.dart';
import 'package:spotify_app/app/shared/presentation/components/loading_widget.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final isLoading = ref.watch(homeLoaderProvider);

    //Elements
    Widget data = RefreshIndicator(
      onRefresh: () async {},
      child: const CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 85.0,
            flexibleSpace: FlexibleSpaceBar(
              background: HomeAppbar(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.0),
          ),
          PlaylistGrid()
        ],
      ),
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
              const BackgroundGradient(),
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
        bottomNavigationBar: const CustomNavigationBar());
  }
}
