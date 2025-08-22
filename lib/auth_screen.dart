import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final username =TextEditingController();
  final password =TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Login Section")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Email controller
            TextField(
              controller: username,
              decoration: InputDecoration(labelText: "Username",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
            SizedBox(height:height*0.02 ),
            // Password Controller
            TextField(
              controller: password,
              decoration: InputDecoration(labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
SizedBox(height: height*0.03,),
            // button to login

            ElevatedButton(onPressed: (){
login(username.text.trim(), password.text.trim());

            }, child: Text("Login")),

            // register screen direction
            

          ],
        ),
      ),
    );

  }
  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("http://192.168.18.40:8084/api/users/login?username=$username&password=$password"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      print("Login successful: ${response.body}");
    } else {
      print("Login failed: ${response.statusCode} - ${response.body}");
    }
  }

}
