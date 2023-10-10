part of 'delete_post_bloc.dart';

sealed class DeletePostState extends Equatable {
  const DeletePostState();
  
  @override
  List<Object> get props => [];
}

final class DeletePostInitial extends DeletePostState {}

final class DeletePostLoading extends DeletePostState {}

final class DeletePostSuccess extends DeletePostState {
  
final int postID;
const DeletePostSuccess({required this.postID});

  @override
  List<Object> get props => [postID];
}

final class DeletePostFailure extends DeletePostState {
  final String message;

  const DeletePostFailure(this.message);

  @override
  List<Object> get props => [message];
}
