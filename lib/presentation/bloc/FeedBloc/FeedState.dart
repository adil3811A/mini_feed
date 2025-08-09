

import 'package:mini_feed/domain/entities/Post.dart';

sealed class FeedState{}

class FeedStateInit extends FeedState{}

class FeedStateLoading extends FeedState{}

class FeedStateSuccess extends FeedState{
  final List<Post> posts;

  FeedStateSuccess({required this.posts});
}

class FeedStateError extends FeedState{
  final String message;

  FeedStateError({required this.message});
}