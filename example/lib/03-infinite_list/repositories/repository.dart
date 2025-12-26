import 'dart:convert';

import 'package:http/http.dart';

import '../models/post.dart';

class Repository {
  final _client = Client();

  Future<List<Post>> fetch(int skip, int take) async {
    final response = await _client.get(
      Uri.https('jsonplaceholder.typicode.com', '/posts', <String, String>{
        '_start': '$skip',
        '_limit': '$take',
      }),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((json) => Post.fromJson(json)).toList();
    }
    throw Exception('error fetching posts');
  }
}
