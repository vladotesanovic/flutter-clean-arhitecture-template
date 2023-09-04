import 'package:dart_rss/domain/media/thumbnail.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.pubDate,
    required this.description,
  });
  final Thumbnail? thumbnail;
  final String title;
  final String pubDate;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      padding: const EdgeInsets.only(
          right: Sizes.p16, left: Sizes.p16, bottom: Sizes.p8, top: Sizes.p8),
      child: Row(
        children: [
          if (thumbnail != null)
            Container(
              padding: const EdgeInsets.only(right: Sizes.p16),
              child: Image.network(thumbnail?.url ?? "", height: Sizes.p64),
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  pubDate,
                  style: const TextStyle(fontSize: Sizes.p12),
                ),
                gapH12,
                Text(
                  description,
                  style: const TextStyle(fontSize: Sizes.p16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
