

// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mini_feed/date/source/LocalDataSource.dart';
import 'package:mini_feed/date/source/RemoteDateSource.dart';
import 'package:mini_feed/domain/entities/Post.dart';
import 'package:mini_feed/domain/repos/MainRepository.dart';

class MainRepositoryImpl implements MainRepository{

  final RemoteDataSource remoteDataSource;


  MainRepositoryImpl( {required this.remoteDataSource});

  @override
  Future<List<Post>> getPost() async{
      return await remoteDataSource.getPost();
  }

  @override
  void loginUser(String email , String password) {
    remoteDataSource.loginUser(email, password);
  }
}