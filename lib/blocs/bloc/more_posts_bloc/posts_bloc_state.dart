part of 'posts_bloc_bloc.dart';

sealed class PostsBlocState extends Equatable {
  const PostsBlocState();
  
  @override
  List<Object> get props => [];
}

final class PostsBlocInitial extends PostsBlocState {}

class PostsBlocLoading extends PostsBlocState {}

class PostsBlocLoaded extends PostsBlocState {
  final List<ViewPostModel> posts;

  const PostsBlocLoaded({required this.posts});
 
}

class PostsError extends PostsBlocState{
  final String message;
  const PostsError({required this.message});
}
