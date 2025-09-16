import 'package:counter_app/model/posts_model.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {

  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String message;
  final String searchMessage;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.temPostList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  PostStates copyWith({PostStatus? postStatus, List<PostModel>? postList, String? message, List<PostModel>? temPostList, String? searchMessage}){
    return PostStates(
      postList: postList ?? this.postList,
      temPostList: temPostList ?? this.temPostList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
}
  @override
  List<Object?> get props => [postStatus, postStatus, temPostList, message, searchMessage];

}