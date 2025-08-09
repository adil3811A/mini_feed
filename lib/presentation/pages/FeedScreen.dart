import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedBloc.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedState.dart';

import '../bloc/FeedBloc/FeedEvents.dart';

class Feedscreen extends StatefulWidget {
  const Feedscreen({super.key});

  @override
  State<Feedscreen> createState() => _FeedscreenState();
}

class _FeedscreenState extends State<Feedscreen> {

  @override
  void initState() {
    context.read<FeedBloc>().add(FeedEventLoadPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FeedBloc , FeedState>(
        builder: (context, state) {
          if(state is FeedStateSuccess){
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
              final currentPost = state.posts[index];
              return ListTile(
                leading: Text(currentPost.id.toString()),
                title: Text(currentPost.title),
                subtitle: Text(currentPost.body),
              );
            },);
          }
          if(state is FeedStateError){
            return Text('erros is ${state.message}');
          }
          if(state is FeedStateLoading){
            return CircularProgressIndicator();
          }
          return Center(child: CircularProgressIndicator());
      },),
    );
  }
}
