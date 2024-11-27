import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Home.dart';
import 'package:untitled1/UserProvider.dart';
import 'package:untitled1/newacount.dart';

class LoginPage extends StatelessWidget {
  String username = '';
  String password = '';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "                         Login",textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
            fontSize: 25,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 8,
                color: Colors.grey,
              ),
            ],
          ),


        ),
        backgroundColor: Colors.orange,
      ),

      body: Container(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: "Username", fillColor: Colors.white, filled: true),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password", fillColor: Colors.white, filled: true),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                    Provider.of<UserProvider>(context, listen: false).setUsername(usernameController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter both username and password")));
                  }
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white) ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  CreateAccountPage()),
                  );
                },
                child: const Text(
                  "Don't have an account? Create one.",
                  style: TextStyle(decoration: TextDecoration.underline,
                      color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}