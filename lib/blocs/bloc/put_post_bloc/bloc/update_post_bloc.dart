import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_flutter/repositry/repositry_post.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

part 'update_post_event.dart';
part 'update_post_state.dart';

class UpdatePostBloc extends Bloc<UpdatePostEvent, UpdatePostState> {
  ViewPostModel? viewPostModel;
  final PostsRepostiry postsRepostiry;
  
  UpdatePostBloc(this.postsRepostiry) : super(UpdatePostInitial()) {
    on<UpdatePostEvent>((event, emit) async{
      if(event is UpdateMyPost){
       emit(UpdatePostLoading());
       try{
        await postsRepostiry.updatePost(viewPostModel!.postModel).then((value){
        // var post = ViewPostModel(postModel: value);
         emit(UpdatePostSuccess(post: value));
        });

       }catch(e){
        emit(UpdatePostFailure(e.toString()));
       }
      }
    });
  }
}
