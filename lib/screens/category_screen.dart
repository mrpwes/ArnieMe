import 'package:flutter/material.dart';

import '../handlers/search.dart';
import '../widgets/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ArnieMe')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            categoryTitle('Top Airing'),
            categoryContent(GetAnime().getTopAiring()),
            categoryTitle('Recent Episodes'),
            categoryContent(GetAnime().getRecentEpisodes()),
          ],
        ),
      ),
    );
  }
}
