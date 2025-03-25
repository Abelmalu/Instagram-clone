import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramclone/feature/Authentication/bloc/authentication_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        // TODO: implement listener
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
                  decoration:
                      InputDecoration(labelText: 'Mobile number or Email'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    child: (state is RegisterLoadingState ? CircularProgressIndicator():
                        Text('Register', style: TextStyle(color: Colors.white))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                        padding: EdgeInsets.only(top:20,bottom: 20, right:0,left: 0),
                    ),
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(
                        RegisterButtonPressedEvent()
                      );
                     
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
