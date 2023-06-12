import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_service.dart';

class Test extends StatelessWidget {
  const Test({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Doank')),
      body: Card(
        child: PostList(),
      ),
    )
  }
}

class PloList extends StatefulWidget {
  const PostList({Key? key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PosrList> {
  late Future<List<dynamic> _posts;

  @override
  voi
}