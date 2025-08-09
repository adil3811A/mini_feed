
import 'package:mini_feed/domain/entities/Post.dart';

sealed class FeedEvents{}

class FeedEventLoadPost extends FeedEvents{}
class FeedEventAddPost extends FeedEvents{
  final Post post;

  FeedEventAddPost({required this.post});

}
class FeedEventLogout extends FeedEvents{}