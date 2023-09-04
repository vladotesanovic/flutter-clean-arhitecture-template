import 'package:news/feature/home/data/news_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_title_provider.g.dart';

@riverpod
AsyncValue<String?> getNewsTitle(GetNewsTitleRef ref) {
  final newsResponse = ref.watch(getNewsProvider);

  return newsResponse.whenData((channel) => channel.title);
}
