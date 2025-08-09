import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_feed/core/error/GenralErrors.dart';
import 'package:mini_feed/date/models/Post_Model.dart';
import 'package:mini_feed/domain/entities/Post.dart';

abstract interface class RemoteDataSource {
  Future<List<PostModel>> getPost();
  void loginUser(String email , String password);
  void addPost(Post post);
}

class RemoteDataSourceImple implements RemoteDataSource {
  @override
  Future<List<PostModel>> getPost() async {
    try {
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => PostModel.fromJson(json)).toList();
      } else {
        print('erros boys is${response.body}');
        throw GeneralException(
          message: 'Failed to load posts: ${response.statusCode}',
        );
      }
    } catch (e) {
      print(e);
      throw GeneralException(message: e.toString());
    }
  }
  @override
  void loginUser(String email , String password) async{
    try{
      final uri = Uri.parse('https://reqres.in/api/login');
       await http.get(uri);
    }catch(e){
      throw GeneralException(message: e.toString());
    }
  }

  @override
  void addPost(Post post) async{
    try{
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      await http.post(uri);
    }catch(e){
      throw GeneralException(message: e.toString());
    }
  }
}
