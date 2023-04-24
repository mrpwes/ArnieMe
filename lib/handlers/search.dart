import 'dart:convert';
import 'package:http/http.dart' as http;

class GetAnime {
  Future getTopAiring() async {
    var url = Uri.https('api.consumet.org', '/anime/gogoanime/top-airing');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final topAiring = json.decode(response.body);
      return topAiring;
    } else {
      return ('Request failed with status: ${response.statusCode}.');
    }
  }

  Future getRecentEpisodes() async {
    var url = Uri.https('api.consumet.org', '/anime/gogoanime/recent-episodes');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final recentEpisodes = json.decode(response.body);
      return recentEpisodes;
    } else {
      return ('Request failed with status: ${response.statusCode}.');
    }
  }

  Future getAnimeInfo(String queryParameters) async {
    var url =
        Uri.https('api.consumet.org', '/anime/gogoanime/info/$queryParameters');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final animeInfo = json.decode(response.body);
      return animeInfo;
    } else {
      return ('Request failed with status: ${response.statusCode}.');
    }
  }
}
