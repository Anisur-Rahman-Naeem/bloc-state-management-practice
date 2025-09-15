import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/posts/posts_events.dart';
import 'package:counter_app/bloc/posts/posts_states.dart';
import 'package:counter_app/repository/posts_repository.dart';
import 'package:counter_app/utils/enums.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {

  PostRepository postRepository = PostRepository();
  PostBloc():super(PostStates()){
    on<PostFetched>(fetchPostApi);
  }

  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async{
    await postRepository.fetchPost().then((value){
      emit(state.copyWith(postStatus: PostStatus.success,
      message: 'success',
      postList: value));
    }).onError((error, stackTrace){
      emit(state.copyWith(postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}