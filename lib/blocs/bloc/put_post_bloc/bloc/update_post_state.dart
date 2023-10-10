part of 'update_post_bloc.dart';

sealed class UpdatePostState extends Equatable {
  const UpdatePostState();
  
  @override
  List<Object> get props => [];
}

final class UpdatePostInitial extends UpdatePostState {}

final class UpdatePostLoading extends UpdatePostState {}

final class UpdatePostSuccess extends UpdatePostState {
  final int post;

 const UpdatePostSuccess({required this.post});

  
  @override
  List<Object> get props => [post];
}

final class UpdatePostFailure extends UpdatePostState {
  final String message;

  const UpdatePostFailure(this.message);

  @override
  List<Object> get props => [message];
}
