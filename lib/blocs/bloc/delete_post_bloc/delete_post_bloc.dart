import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_flutter/repositry/repositry_post.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  final PostsRepostiry postsRepostiry;
   ViewPostModel? viewPostModel;

  DeletePostBloc(this.postsRepostiry) : super(DeletePostInitial()) {
    on<DeletePostEvent>((event, emit) async{
      if(event is DeleteMyPost){
        emit(DeletePostLoading());
      try{
         await postsRepostiry.deletePost(viewPostModel!.postModel.id!).then((value){
          emit(DeletePostSuccess(postID: value!));
       });
      }catch(e){
        emit(DeletePostFailure(e.toString()));
      }
      }
    });
  }
}
