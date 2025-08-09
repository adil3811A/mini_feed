
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_feed/core/error/GenralErrors.dart';
import 'package:mini_feed/domain/entities/Post.dart';
import 'package:mini_feed/domain/repos/MainRepository.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedEvents.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedState.dart';

class FeedBloc extends Bloc<FeedEvents , FeedState>{
  List<Post> tempost = [];
  final MainRepository mainRepository;
  FeedBloc(this.mainRepository): super(FeedStateInit()){
    on<FeedEventLoadPost>((event, emit) async{
      try{
        final posts =  await mainRepository.getPost();
        tempost=posts ;
        emit(FeedStateSuccess(posts: posts));
      }on GeneralException catch(e){
        emit(FeedStateError(message: e.message));
      }
    },);
    on<FeedEventAddPost>((event, emit) {
      tempost.add(event.post);
      mainRepository.addPost(event.post);
      emit(FeedStateSuccess(posts: tempost));
    },);
  }
}
