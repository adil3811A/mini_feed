
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_feed/core/error/GenralErrors.dart';
import 'package:mini_feed/domain/repos/MainRepository.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthEvents.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthSatate.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedEvents.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedState.dart';

class FeedBloc extends Bloc<FeedEvents , FeedState>{
  final MainRepository mainRepository;
  FeedBloc(this.mainRepository): super(FeedStateInit()){
    on<FeedEventLoadPost>((event, emit) async{
      try{
        final posts =  await mainRepository.getPost();
        emit(FeedStateSuccess(posts: posts));
      }on GeneralException catch(e){
        emit(FeedStateError(message: e.message));
      }
    },);
  }
}
