import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mini_feed/date/repos/MainRepositoryImpl.dart';
import 'package:mini_feed/date/source/LocalDataSource.dart';
import 'package:mini_feed/date/source/RemoteDateSource.dart';
import 'package:path_provider/path_provider.dart';
import 'domain/repos/MainRepository.dart';


final getit = GetIt.instance;


Future getDependency() async{
  getit.registerFactory<RemoteDataSource>(() => RemoteDataSourceImple());
  // getit.registerFactory<LocalDataSource>(() => LocalDataSourceImple(box: Hive.box(name: 'posts')),);
  // Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  getit.registerFactory<MainRepository>(() => MainRepositoryImpl(remoteDataSource: getit()),);

}

