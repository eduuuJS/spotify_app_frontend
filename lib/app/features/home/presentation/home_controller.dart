import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
Future<void> homeLoader(HomeLoaderRef ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
}
