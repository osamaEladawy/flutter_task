import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_flutter/repositry/repositry_post.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
   ViewPostModel? viewPostModel ;
   PostsRepostiry postsRepostiry;
  AddPostBloc(this.postsRepostiry) : super(AddPostInitial()) {
    on<AddPostEvent>((event, emit)async{
     if(event is PostAdded){
      emit(AddPostLoading());
      try{
      await postsRepostiry.createPost(viewPostModel!.postModel).then((value){
        var result = ViewPostModel(postModel: value);
        emit(AddMyPost(result)); 
       });
      }catch(e){
        emit(ErroeWhenAddMyPost(e.toString()));
      }
     }
    });
  }
}
