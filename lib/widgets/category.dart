import 'package:arnieme/screens/anime_list.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget categoryTitle(String categoryName) {
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10, top: 20),
      child: Text(
        categoryName,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}

Widget categoryContent(Future categoryGetter) {
  return FutureBuilder(
    future: categoryGetter,
    builder: (context, data) {
      if (data.hasData) {
        return Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ...data.data['results'].map(
                (details) => Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AnimeList.routeName, arguments: {
                        'imageUrl': details['image'],
                        'animeTitle': details['title'],
                        'animeId': details['id'],
                      });
                    },
                    child: SizedBox(
                      width: 150,
                      height: 200,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: CachedNetworkImage(
                                imageUrl: details['image'],
                                placeholder: (context, url) => const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator()),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(165, 215, 232, 1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                details['title'],
                                style: const TextStyle(color: Colors.black),
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        return const Padding(
          padding: EdgeInsets.all(10),
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
