import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'news_provider.dart';
import 'news_source_repository.dart';

part 'selected_news_provider.g.dart';

@riverpod
class SelectedNews extends _$SelectedNews {
  @override
  String build() {
    final sources = ref.watch(newsSourceRepositoryProvider).getSources();
    return sources[0].url;
  }

  void set(String url) {
    state = url;
    ref.invalidate(getNewsProvider);
  }
}
