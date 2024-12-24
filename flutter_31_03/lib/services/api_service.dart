import 'package:flutter_31_03/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://my-json-server.typicode.com/PHLArty/restapi_DevMobile/posts';

  //Get all post
  Future<List<Post>> fetchAllPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Post.fromJson(json)).toList();
    }else {
      throw Exception("Have error when load post!");
    }
  } 

  Future<Post> fetchPost(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if(response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Have error when load post");
    }
  }
}