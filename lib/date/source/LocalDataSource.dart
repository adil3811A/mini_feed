// import 'package:hive/hive.dart';
import 'package:mini_feed/date/models/Post_Model.dart';
import 'package:mini_feed/domain/entities/Post.dart';

abstract interface class LocalDataSource{

  List<PostModel> getPost();

  void uploadPost(List<PostModel> post);
}

// class LocalDataSourceImple implements LocalDataSource{
  // final Box box;

/*  LocalDataSourceImple({required this.box});
  @override
  List<PostModel> getPost() {
    List<PostModel> list= [];
    box.read(() {
      for(int i =0 ; i<box.length ;i++ ){
        list.add(PostModel.fromJson(box.get(i.toString())));
      }
    },);
    return list;
  }

  @override
  void uploadPost(List<PostModel> post) {
    box.clear();
    box.write(() {
      for(int i =0 ; i<post.length; i++){
        box.put(i.toString(), post[i].toJson());
      }
    },);
  }*/

// }