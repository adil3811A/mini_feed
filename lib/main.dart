import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_feed/init_dependency.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthBloc.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedBloc.dart';
import 'package:mini_feed/presentation/pages/FeedScreen.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await getDependency();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthBloc(),),
      BlocProvider(create: (context) => FeedBloc(getit()),)
    ],
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Feedscreen(),
    );
  }
}

