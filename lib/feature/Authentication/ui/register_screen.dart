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
            margin: EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Instagram'),
                TextField(
                  controller: identifierController,
                  decoration:
                      InputDecoration(labelText: 'Mobile number or Email'),
                ),
                TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                TextField(
                  controller: passwordConfirmationController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    child: (state is RegisterLoadingState
                        ? CircularProgressIndicator()
                        : Text('Register',
                            style: TextStyle(color: Colors.white))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.only(
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
