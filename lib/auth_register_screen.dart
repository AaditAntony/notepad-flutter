import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class AuthRegisterScreen extends StatefulWidget {
  const AuthRegisterScreen({super.key});

  @override
  State<AuthRegisterScreen> createState() => _AuthRegisterScreenState();
}

class _AuthRegisterScreenState extends State<AuthRegisterScreen> {
  final username=TextEditingController();
  final password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Register Screen"),),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
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

            // button to login
SizedBox(height: height*0.03,),
            ElevatedButton(onPressed: (){
              register(username.text.trim(), password.text.trim());

            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}

Future<void> register(String username, String password) async{
  String baseUrl="http://192.168.18.40:8084/api/users/register?username=$username&password=$password";
  final response=await http.post(Uri.parse(baseUrl),headers: {
    "Content-Type": "application/json"
  });
  if (response.statusCode == 200) {
    print("Register successful: ${response.body}");
  } else {
    print("Register failed: ${response.statusCode} - ${response.body}");
  }
}

