
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mvvm_flutter/models/post_model.dart';
import 'package:mvvm_flutter/repositry/repositry_post.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

class ApiRepositry extends PostsRepostiry{
  
  @override
  Future<List<PostModel>> getAllPosts() async{
    List<PostModel> lists =[];
    try{
    var response = await Dio().get("https://jsonplaceholder.typicode.com/posts");
     var posts = response.data as List;
     lists = posts.map((postModel) => PostModel.fromJson(postModel)).toList();
    
    }catch(e){throw Exception(e.toString());}
    return lists;
  }

  @override
  Future<PostModel> getPost(int id)async {
   try{
    var response = await Dio().get("https://jsonplaceholder.typicode.com/posts/$id");
    return PostModel.fromJson(response.data);

   }catch(e){throw Exception(e.toString());}
  }
  
  @override
  Future<int?> deletePost(int model) async{
   try{
    var response = await  Dio().delete("https://jsonplaceholder.typicode.com/posts" + "/${model}.id");
    var post =  PostModel.fromJson(response.data);
    var viewPostModel = ViewPostModel(postModel: post);
    return viewPostModel.id;
   }catch(e){throw Exception(e.toString());}
   
  }
  
  @override
  Future<int> updatePost(PostModel model) async{
   try{
    var response = await Dio().put("https://jsonplaceholder.typicode.com/posts" + "/${model.id}",data: model.toJson());
     var post =  PostModel.fromJson(response.data);
    return post.id!;
   }catch(e){throw Exception(e.toString());}
  }
  
  @override
  Future<PostModel> createPost(PostModel model) async {
    try{
      var response = await Dio().post("https://jsonplaceholder.typicode.com/posts",data: model.toJson());
      return PostModel.fromJson(response.data);
    }catch(e){throw Exception(e.toString());}
  }

  @override
  Future<int> deletePosts(PostModel model)async{
     try{
    var response = await  Dio().delete("https://jsonplaceholder.typicode.com/posts" + "/${model.id}.id");
    var post =  PostModel.fromJson(response.data);
    return post.id!;
   }catch(e){throw Exception(e.toString());}
  }
    
  
  
}