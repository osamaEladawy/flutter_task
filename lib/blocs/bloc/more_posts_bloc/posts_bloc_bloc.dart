import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_flutter/repositry/repositry_post.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

part 'posts_bloc_event.dart';
part 'posts_bloc_state.dart';

class PostsBlocBloc extends Bloc<PostsBlocEvent, PostsBlocState> {
  final PostsRepostiry postsRepostiry;

  PostsBlocBloc(this.postsRepostiry) : super(PostsBlocInitial()) {
    on<PostsBlocEvent>((event, emit) async{
      if(event is FetchData){ 
        emit(PostsBlocLoading());
        try{
         await postsRepostiry.getAllPosts().then((value) {
          List<ViewPostModel> posts = value.map((e) => ViewPostModel(postModel: e)).toList();
          emit(PostsBlocLoaded(posts: posts));
        });
        }catch(e){
           emit(PostsError(message: e.toString(),));
        }
      }
    });
  }
}
