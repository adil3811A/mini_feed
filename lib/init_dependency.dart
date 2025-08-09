import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mini_feed/date/repos/MainRepositoryImpl.dart';
import 'package:mini_feed/date/source/LocalDataSource.dart';
import 'package:mini_feed/date/source/RemoteDateSource.dart';
import 'package:path_provider/path_provider.dart';
import 'domain/repos/MainRepository.dart';


final getit = GetIt.instance;


Future getDependency() async{
  getit.registerFactory<RemoteDataSource>(() => RemoteDataSourceImple());
  getit.registerFactory<LocalDataSource>(() => LocalDataSourceImple(box: Hive.box(name: 'posts')),);
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  getit.registerFactory<MainRepository>(() => MainRepositoryImpl(
    internetConnection:InternetConnection(),
    remoteDataSource: getit(),
    localDataSource: getit())
  );

}

