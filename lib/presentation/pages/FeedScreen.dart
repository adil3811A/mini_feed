import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mini_feed/domain/entities/Post.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedBloc.dart';
import 'package:mini_feed/presentation/bloc/FeedBloc/FeedState.dart';

import '../bloc/FeedBloc/FeedEvents.dart';

class Feedscreen extends StatefulWidget {
  const Feedscreen({super.key});

  @override
  State<Feedscreen> createState() => _FeedscreenState();
}

class _FeedscreenState extends State<Feedscreen> {
  TextEditingController? titleController;
  TextEditingController? disccription;


  @override
  void initState() {
    context.read<FeedBloc>().add(FeedEventLoadPost());
    titleController=  TextEditingController();
    disccription = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    titleController!.dispose();
    disccription!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Post"),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          hintText: 'Enter title',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: disccription,
                        decoration: const InputDecoration(
                          hintText: 'Enter description',
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<FeedBloc>().add(
                        FeedEventAddPost(
                          post: Post(
                            userId: 0,
                            id: 0,
                            title: titleController!.text.trim(),
                            body: disccription!.text.trim(),
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text("Add Post"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<FeedBloc , FeedState>(
        builder: (context, state) {
          if(state is FeedStateSuccess){
            return LiquidPullToRefresh(
              showChildOpacityTransition: false,
              onRefresh: () async{
                context.read<FeedBloc>().add(FeedEventLoadPost());
              },
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                final currentPost = state.posts[index];
                return ListTile(
                  leading: Text(currentPost.id.toString()),
                  title: Text(currentPost.title),
                  subtitle: Text(currentPost.body),
                );
              },),
            );
          }
          if(state is FeedStateError){
            return Center(child: Text('errors is ${state.message}'));
          }
          if(state is FeedStateLoading){
            return CircularProgressIndicator();
          }
          return Center(child: CircularProgressIndicator());
      },),
    );
  }
}
