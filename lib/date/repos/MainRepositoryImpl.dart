

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mini_feed/date/source/LocalDataSource.dart';
import 'package:mini_feed/date/source/RemoteDateSource.dart';
import 'package:mini_feed/domain/entities/Post.dart';
import 'package:mini_feed/domain/repos/MainRepository.dart';

class MainRepositoryImpl implements MainRepository{
  final InternetConnection internetConnection;
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  MainRepositoryImpl({required this.internetConnection, required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<Post>> getPost() async{
    if(await internetConnection.hasInternetAccess){
      return await remoteDataSource.getPost();
    }else{
      return localDataSource.getPost();
    }
  }
}