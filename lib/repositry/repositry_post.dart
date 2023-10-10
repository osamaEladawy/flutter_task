import 'dart:async';

import 'package:mvvm_flutter/models/post_model.dart';

abstract class PostsRepostiry{

  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getPost(int id);
  Future<int> updatePost(PostModel model);
  Future<PostModel> createPost(PostModel model);
  Future<int?> deletePost(int model);
  Future<int>deletePosts(PostModel model);
  

}