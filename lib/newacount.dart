import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Home.dart';
import 'package:untitled1/UserProvider.dart';

class CreateAccountPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("         Create Account",
          style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 8,
                color: Colors.grey,
              ),
            ],
          ),),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white,),
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
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email", fillColor: Colors.white, filled: true),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone", fillColor: Colors.white, filled: true),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {

                  Provider.of<UserProvider>(context, listen: false).setUsername(usernameController.text);


                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields")));
                }
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white) ),
              child: const Text("Create Account",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),),
            ),
          ],
        ),
        ),
      ),
    );
  }
}