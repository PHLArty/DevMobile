import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostDetailScreen extends StatefulWidget {
  final int postId; // ID of the post to fetch details

  const PostDetailScreen({Key? key, required this.postId}) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = ApiService().fetchPost(widget.postId); // Fetch the specific post by ID
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: FutureBuilder<Post>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            Post post = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    post.body ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Không có dữ liệu'),
            );
          }
        },
      ),
    );
  }
}
