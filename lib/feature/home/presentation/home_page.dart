import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/news_provider.dart';
import '../data/news_source_repository.dart';
import '../data/news_title_provider.dart';
import '../data/selected_news_provider.dart';
import 'news_item_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rss = ref.watch(getNewsProvider);
    final title = ref.watch(getNewsTitleProvider);
    final sources = ref.watch(newsSourceRepositoryProvider).getSources();

    void setDifferentNewsProvider(String url) {
      ref.read(selectedNewsProvider.notifier).set(url);
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: title.when(
          data: (data) {
            return Text(data ?? "");
          },
          error: (err, stack) {
            return null;
          },
          loading: () {
            return null;
          },
        ),
      ),
      body: rss.when(data: (data) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: 60.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sources.length,
                  itemBuilder: (context, index) {
                    final source = sources[index];
                    return TextButton(
                      onPressed: () {
                        setDifferentNewsProvider(source.url);
                      },
                      child: Text(source.title),
                    );
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListView.builder(
                  itemCount: data.items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final item = data.items[index];
                    final thumbnail = item.media!.thumbnails.isNotEmpty
                        ? item.media?.thumbnails[0]
                        : null;

                    return NewsItemWidget(
                      title: item.title ?? "",
                      description: item.description ?? "",
                      pubDate: item.pubDate ?? "",
                      thumbnail: thumbnail,
                    );
                  },
                ),
              ]),
            ),
          ],
        );
      }, error: (err, stack) {
        throw Error();
      }, loading: () {
        return const CircularProgressIndicator();
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
