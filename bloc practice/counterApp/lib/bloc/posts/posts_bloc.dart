import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/posts/posts_events.dart';
import 'package:counter_app/bloc/posts/posts_states.dart';
import 'package:counter_app/model/posts_model.dart';
import 'package:counter_app/repository/posts_repository.dart';
import 'package:counter_app/utils/enums.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {

  List<PostModel> temPostList = [];

  PostRepository postRepository = PostRepository();
  PostBloc():super(PostStates()){
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_filterList);
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
  void _filterList(SearchItem event, Emitter<PostStates> emit) async{

    if(event.stSearch.isEmpty){
      emit(state.copyWith(temPostList: [], searchMessage: ''));
    }else{
      // temPostList = state.postList.where((element) => element.email.toString() == event.stSearch.toString()).toList();
      temPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toLowerCase())).toList();
      if(temPostList.isEmpty){
        emit(state.copyWith(temPostList: temPostList, searchMessage: 'No data found'));
      }else{
        emit(state.copyWith(temPostList: temPostList, searchMessage: ''));
      }
    }

    emit(state.copyWith(temPostList: temPostList));
  }
}