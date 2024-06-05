import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/features/home/home_page.dart';
import 'package:flutter_bloc_api/features/posts/post_ui/posts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: const PostsPage(),
    );
  }
}
