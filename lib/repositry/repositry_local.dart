import 'dart:async';

import 'package:mvvm_flutter/models/post_model.dart';
import 'package:mvvm_flutter/repositry/repositry_post.dart';

class LocalDataBase extends PostsRepostiry{
  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getPost(int id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }
  
  @override
  Future<int> deletePost(int model) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }
  
  @override
  Future<int> updatePost(PostModel model) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
  
  @override
  Future<PostModel> createPost(PostModel model) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<int> deletePosts(PostModel) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }
  
  
  

  
  }
