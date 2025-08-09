

import 'package:mini_feed/domain/entities/Post.dart';

abstract interface class MainRepository{
  Future<List<Post>> getPost();
  void loginUser(String email , String password);
  void addPost(Post post);
}