import 'package:mvvm_flutter/blocs/bloc/delete_post_bloc/delete_post_bloc.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

class DeleteViewModelWithHome{
 final DeletePostBloc deletePostBloc;

  DeleteViewModelWithHome({required this.deletePostBloc});

    Future<int?>deleteMyPost(ViewPostModel model)async{
    try{
      var respone =await deletePostBloc.postsRepostiry.deletePost(model.postModel.id!);
      return respone;
    }catch(e){throw Exception(e.toString());}
  }


}