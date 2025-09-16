import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:counter_app/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async{
    try{
     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'),
     headers: {
       "User-Agent": "FlutterApp/1.0",
       "Accept": "application/json",
     },
     );

     if(response.statusCode == 200){
       final body = json.decode(response.body) as List;
       return body.map((e){
         return PostModel(
           id: e['id'] as int,
           postId: e['postId'] as int,
           email: e['email'] as String,
           body: e['body'] as String,
         );
       }).toList();
     }
    }on SocketException {
      throw Exception('error while fetching data Socket Exception');
    }on TimeoutException {
      throw Exception('error while fetching data Timeout Exception');
    }
    throw Exception('error while fetching data');
  }
}