import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Instagram'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Mobile number or Email'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
