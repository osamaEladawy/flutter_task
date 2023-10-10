part of 'add_post_bloc.dart';

sealed class AddPostState extends Equatable {
  const AddPostState();
  
  @override
  List<Object> get props => [];
}

final class AddPostInitial extends AddPostState {}

final class AddPostLoading extends AddPostState {}

final class AddMyPost extends AddPostState{
  final ViewPostModel post;
  const AddMyPost(this.post);

  @override
  List<Object> get props => [post];
}

final class ErroeWhenAddMyPost extends AddPostState{
  final String message;
  const ErroeWhenAddMyPost(this.message);

  @override
  List<Object> get props => [message];
}