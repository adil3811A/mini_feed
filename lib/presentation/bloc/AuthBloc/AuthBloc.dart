
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthEvents.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthSatate.dart';

class AuthBloc extends Bloc<AuthEvents , AuthState>{
  AuthBloc(): super(AuthStateInit()){
    
  }
}
