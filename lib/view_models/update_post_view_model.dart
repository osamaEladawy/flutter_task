import 'package:mvvm_flutter/blocs/bloc/put_post_bloc/bloc/update_post_bloc.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

class PutPostViewModel{
  String title = "Update Post";
  final UpdatePostBloc updatePostBloc;

  PutPostViewModel({required this.updatePostBloc});

  Future<int>updateMyPost(ViewPostModel model,)async{
    try{
    var response = await updatePostBloc.postsRepostiry.updatePost(model.postModel);
    return response;
    }catch(e){throw Exception(e.toString());}
  }
}