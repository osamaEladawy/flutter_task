//this page will send data to view page

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/blocs/bloc/more_posts_bloc/posts_bloc_bloc.dart';
import 'package:mvvm_flutter/models/post_model.dart';
import 'package:mvvm_flutter/view_models/delet_view_model.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

class TestHomeViewModel{
  String title = 'Home Page View All Posts';
  //final DeletePostBloc deletePostBloc;
  final DeleteViewModelWithHome deleteViewModelWithHome;
  final PostsBlocBloc postsBlocBloc;
  TestHomeViewModel(this.deleteViewModelWithHome, {required this.postsBlocBloc});

   Future<List<ViewPostModel>>fetchAllPosts()async{
    List<PostModel> posts = await postsBlocBloc.postsRepostiry.getAllPosts();
    return posts.map((e) =>ViewPostModel(postModel: e)).toList();
  }
  
   nextScreen(context,page){
   Navigator.push(context,MaterialPageRoute(builder: (context)=> page),);
  }

 
}