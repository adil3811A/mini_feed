
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_feed/domain/repos/MainRepository.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthEvents.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthSatate.dart';

class AuthBloc extends Bloc<AuthEvents , AuthState>{
  final MainRepository mainRepository;
  AuthBloc(this.mainRepository): super(AuthStateInit()){
    on<AuthEventLogin>((event, emit) {
      mainRepository.loginUser(event.email,event.password);
      emit(AuthStateSuccess());
    },);
  }
}
