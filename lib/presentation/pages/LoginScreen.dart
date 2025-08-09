import 'package:flutter/material.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController? emailController;
  TextEditingController? passWorrdController;

  @override
  void initState() {
    emailController = TextEditingController();
    passWorrdController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Enter Email'
            ),
          ),
          TextField(
            controller: passWorrdController,
            decoration: InputDecoration(
              hintText: 'Enter Password'
            ),
          ),
          ElevatedButton(onPressed: () {
            // here nee to do implementation
          }, child: Text('Login'))
        ],
      ),
    );
  }
}
