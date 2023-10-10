part of 'posts_bloc_bloc.dart';

sealed class PostsBlocEvent extends Equatable {
  const PostsBlocEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'PostsBlocEvent';
}

  class FetchData extends PostsBlocEvent{}
  class DeleteData extends PostsBlocEvent{}
  class UpdateData extends PostsBlocEvent{}
  class AddData extends PostsBlocEvent{}
  class RefreshData extends PostsBlocEvent{}



