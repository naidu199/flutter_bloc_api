import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/features/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostBloc postBloc = PostBloc();
  @override
  void initState() {
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("posts page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.add(PostAddEvent());
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (PostLoadingState):
              return const Center(
                child: CircularProgressIndicator(),
              );
            case const (PostErrorState):
              final errorMsg = state as PostErrorState;
              // print(errorMsg.error);
              return Center(
                child: Text(errorMsg.error),
              );
            case const (PostFetchSuccessState):
              final successState = state as PostFetchSuccessState;
              return ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: ((context, index) {
                  return Container(
                    color: Colors.grey.shade300,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(successState.posts[index].title),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(successState.posts[index].body),
                      ],
                    ),
                  );
                }),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
