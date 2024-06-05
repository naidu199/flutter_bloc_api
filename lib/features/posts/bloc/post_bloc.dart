import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_api/features/posts/models/post_model.dart';
import 'package:flutter_bloc_api/features/posts/post_repos/post_fetch.dart';
import 'package:meta/meta.dart';
// import 'package:http/http.dart' as http;
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    // on<PostEvent>((event, emit) {
    // });
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingState());
    List<PostData> posts = await PostRepoNetwork.fetchPostData();
    emit(PostFetchSuccessState(posts: posts));
    if (posts.isEmpty) {
      emit(PostErrorState(error: "error in data fetch"));
    }
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostRepoNetwork.addPostData();
    print(success);
    if (success) {
      emit(PostAdditionState());
    } else {
      emit(PostAdditionErrorState());
    }
  }
}
