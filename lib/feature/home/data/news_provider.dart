import 'package:dart_rss/dart_rss.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../infrastructure/network/dio_provider.dart';
import 'selected_news_provider.dart';

part 'news_provider.g.dart';

@riverpod
Future<RssFeed> getNews(GetNewsRef ref) async {
  final newsResponse =
      await ref.read(getDioProvider).get(ref.read(selectedNewsProvider));

  final channel = RssFeed.parse(newsResponse.data);

  return channel;
}
