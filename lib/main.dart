import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramclone/feature/Authentication/bloc/authentication_bloc.dart';
import 'package:instagramclone/feature/Authentication/ui/payment_screen.dart';
import 'package:instagramclone/feature/Authentication/ui/register_screen.dart';
import 'package:instagramclone/feature/chat/bloc/chat_bloc.dart';
import 'package:instagramclone/feature/post/ui/posts_screen.dart';
import 'feature/chat/ui/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatBloc()),
        BlocProvider(create: (context) => AuthenticationBloc()),
      ],
      child: MaterialApp(
        title: 'Chat Application ',
        debugShowCheckedModeBanner: false,
        color: Colors.green,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const RegisterScreen(),
        routes: {
          PostsScreen.routeName:(context)=>PostsScreen(),

        },
      ),
    );
  }
}
  