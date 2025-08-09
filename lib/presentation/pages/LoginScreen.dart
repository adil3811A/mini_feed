import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthBloc.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthEvents.dart';
import 'package:mini_feed/presentation/bloc/AuthBloc/AuthSatate.dart';
import 'package:mini_feed/presentation/pages/FeedScreen.dart';


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
  void dispose() {
    emailController!.dispose();
    passWorrdController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc , AuthState>(
        listener: (context, state) {
          if(state is AuthStateSuccess){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Feedscreen(),));
          }
        },
        builder: (context, state) {
          return Column(
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
                context.read<AuthBloc>().add(AuthEventLogin(email: emailController!.text.trim(), password: passWorrdController!.text.trim()));
              }, child: Text('Login'))
            ],
          );
        },
      ),
    );
  }
}
