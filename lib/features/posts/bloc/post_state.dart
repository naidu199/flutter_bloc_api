part of 'post_bloc.dart';

@immutable
sealed class PostState {}

abstract class PostActionState extends PostState {}

class PostInitial extends PostState {}

class PostLoadingState extends PostState {}

class PostErrorState extends PostState {
  final String error;

  PostErrorState({required this.error});
}

class PostFetchSuccessState extends PostState {
  final List<PostData> posts;

  PostFetchSuccessState({required this.posts});
}

class PostAdditionState extends PostActionState {}

class PostAdditionErrorState extends PostActionState {}
