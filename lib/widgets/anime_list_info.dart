import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

Widget animeListInfo(data) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(color: Color.fromRGBO(165, 215, 232, 1)),
    child: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 5, right: 10, left: 10),
          child: Text(
            data.data['title'],
            style: const TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
        ),
        Column(
          children: [
            Text("Episodes: ${data.data['totalEpisodes'].toString()}"),
            Text(data.data['genres'].join(", ")),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 20, left: 20, bottom: 20),
              child: ReadMoreText(
                "     ${data.data['description']}",
                trimLines: 4,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' SHOW MORE',
                trimExpandedText: '    SHOW LESS',
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                lessStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
