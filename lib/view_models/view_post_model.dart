import 'package:mvvm_flutter/models/post_model.dart';

class ViewPostModel{
  var titleAppBar = "View Post";
  final PostModel postModel;
  ViewPostModel({ required this.postModel});
  
  int? get id => postModel.id;
  int? get userId => postModel.userId;
  String? get title => postModel.title;
  String? get body => postModel.body;
 
  @override
  String toString() {
    return "id ${postModel.id}\n title ${postModel.title}\n body ${postModel.body}";
  }

}