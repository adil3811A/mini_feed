import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_feed/core/error/GenralErrors.dart';
import 'package:mini_feed/date/models/Post_Model.dart';

abstract interface class RemoteDataSource {
  Future<List<PostModel>> getPost();
}

class RemoteDataSourceImple implements RemoteDataSource {
  @override
  Future<List<PostModel>> getPost() async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw GeneralException(
          message: 'Failed to load posts: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw GeneralException(message: e.toString());
    }
  }
}
