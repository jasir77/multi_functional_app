import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Home_Page/Home_Page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> _login() async {
    final String apiUrl = 'https://fakestoreapi.com/auth/login';
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Successful login
        final responseData = json.decode(response.body);
        // Handle the response data here
        print(responseData);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home_Page()));
      } else {
        // Unsuccessful login
        print('Login failed with status code ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred during login
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade500,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                labelText: 'Username',
                suffixIcon: Icon(Icons.mail),
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
