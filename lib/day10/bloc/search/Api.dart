import 'dart:convert';

import '../bean/search_result.dart';
import 'package:http/http.dart' as client;


class GithubApi {
  static Future<SearchResult> search(String term) async{
    var api = "https://api.github.com/search/repositories?q=$term";
    var rep = await client.get(api);
    final results = json.decode(rep.body);
    return SearchResult.fromJson(results);
  }
}