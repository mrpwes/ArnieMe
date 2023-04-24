import 'package:arnieme/handlers/search.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/anime_list_info.dart';
import '../widgets/anime_list_episodes.dart';

class AnimeList extends StatelessWidget {
  static const routeName = '/animelist';

  const AnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String imageUrl = routeArgs['imageUrl'];
    final String animeId = routeArgs['animeId'];

    return Scaffold(
      appBar: AppBar(title: const Text('ArnieMe')),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: GetAnime().getAnimeInfo(animeId),
          builder: (context, data) {
            if (data.hasData) {
              return Column(
                children: [
                  SizedBox(
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator()),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  animeListInfo(data),
                  animeListEpisodes(data)
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Loading Data . . .',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
