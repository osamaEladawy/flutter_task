import 'package:flutter/material.dart';
import 'package:mvvm_flutter/blocs/bloc/add_post_bloc/bloc/add_post_bloc.dart';
import 'package:mvvm_flutter/models/post_model.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

class ADDPostViewModel {
  final String title = "Add Post";
  final String  labelTextWithTitle = "Title";
  final String  hintTextWithTitle = 'Enter text Title';

  final String  labelTextWithBody = "Description";
  final String  hintTextWithBody = 'Enter text Description';

  final Color backGroundButton = const Color.fromARGB(255, 9, 0, 10);

   final AddPostBloc postBloc;
  ADDPostViewModel({required this.postBloc});

  Future<ViewPostModel>addMyPost(PostModel model,)async{
    try{
    var response = await postBloc.postsRepostiry.createPost(model);
    return ViewPostModel(postModel: response);
    }catch(e){throw Exception(e.toString());}
  }
}