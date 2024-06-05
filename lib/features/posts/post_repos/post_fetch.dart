import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc_api/features/posts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepoNetwork {
  static Future<List<PostData>> fetchPostData() async {
    var client = http.Client();
    List<PostData> posts = [];
    try {
      var response = await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );

      List jsonRes = jsonDecode(response.body);
      for (int i = 1; i < jsonRes.length; i++) {
        // print(jsonRes[i]);
        PostData postData =
            PostData.fromMap(jsonRes[i] as Map<String, dynamic>);
        // print(postData.title);
        posts.add(postData);
      }
      // print(posts);
      return posts;
    } catch (e) {
      print(e.toString());
      log(e.toString());
      return [];
    } finally {
      client.close();
    }
  }

  static Future<bool> addPostData() async {
    var client = http.Client();
    try {
      var response = await client
          .post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
        'title': "New Post",
        'body': "This is my first bloc work in the part of my bloc learning ",
        'userId': '577',
      });
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
      return false;
    } finally {
      client.close();
    }
  }
}
