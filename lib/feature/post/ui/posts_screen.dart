import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});
  static String routeName = '/posts';

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title:const Text('Posts '),


      
      ),
      body:const Column(children:[
        Text('Abebe '),
        Text('hellow')
      ])

    );
  }
}
