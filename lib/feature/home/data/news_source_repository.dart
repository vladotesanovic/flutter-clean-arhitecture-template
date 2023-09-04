import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/news_source.dart';

part 'news_source_repository.g.dart';

class NewsSourceRepository {
  List<NewsSource> getSources() {
    return [
      NewsSource(
        title: 'BBC',
        url: 'http://feeds.bbci.co.uk/news/rss.xml#',
      ),
      NewsSource(
        title: 'NY TIMES',
        url: 'https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml',
      ),
      NewsSource(
        title: 'CNN',
        url: 'http://rss.cnn.com/rss/cnn_topstories.rss',
      ),
      NewsSource(
        title: 'WIRED',
        url: 'https://www.wired.com/feed/',
      ),
      NewsSource(
        title: 'ESPN',
        url: 'https://www.espn.com/espn/rss/news',
      ),
      NewsSource(
        title: 'SCIENCE DAILY',
        url: 'https://www.sciencedaily.com/rss/top.xml',
      ),
      NewsSource(
        title: 'LIFE HACKER',
        url: 'https://lifehacker.com/rss',
      )
    ];
  }
}

@riverpod
NewsSourceRepository newsSourceRepository(NewsSourceRepositoryRef ref) {
  return NewsSourceRepository();
}
