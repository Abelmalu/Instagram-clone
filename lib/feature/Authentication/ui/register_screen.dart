import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramclone/feature/Authentication/bloc/authentication_bloc.dart';

import '../../post/ui/posts_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController identifierController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.of(context).pushNamed(PostsScreen.routeName);
        }
      },
      builder: (context, state) {
        // if (state is RegisterInitialState){

        //   return Scaffold(
        //     body:Text('data')
        //   );
        // }
        return Scaffold(
          body: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Instagram'),
                TextField(
                  controller: identifierController,
                  decoration:
                      const InputDecoration(labelText: 'Mobile number or Email'),
                ),
                TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                ),
                TextField(
                  controller: userNameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                TextField(
                  controller: passwordConfirmationController,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 0, left: 0),
                    ),
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(
                          RegisterButtonPressedEvent(
                              identifier: identifierController.text,
                              fullName: fullNameController.text,
                              userName: userNameController.text,
                              password: passwordController.text,
                              passwordConfirmation:
                                  passwordConfirmationController.text));
                    },
                    child: (state is RegisterLoadingState
                        ? CircularProgressIndicator()
                        :  Text('Register',
                            style: TextStyle(color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
