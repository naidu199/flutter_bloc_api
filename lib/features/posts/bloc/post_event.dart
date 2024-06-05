part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class PostInitialFetchEvent extends PostEvent {}

class PostAddEvent extends PostEvent {}
