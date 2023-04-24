import 'package:flutter/material.dart';

Widget animeListEpisodes(data) {
  return Container(
    decoration: const BoxDecoration(color: Color.fromRGBO(165, 215, 232, 1)),
    child: Container(
      padding: EdgeInsets.all(20),
      child: GridView.count(
        childAspectRatio: 4.0,
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: <Widget>[
          ...data.data['episodes'].map(
            (details) => Container(
              decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border.all(
                    color: Colors.black38,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(
                  "EP ${details['number']} | SUB",
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
