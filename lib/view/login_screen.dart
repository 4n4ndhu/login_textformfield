import 'package:flutter/material.dart';
import 'package:login_textformfield/main.dart';
import 'package:login_textformfield/view/logout_screen.dart';
import 'package:login_textformfield/view/register_screen.dart';

String Lemail = "";
String Lpass = "";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Sign in to your Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Your Email Address",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (emailController.text.isNotEmpty &&
                        emailController.text.contains("@")) {
                      return null;
                    } else if (emailController.text.isEmpty) {
                      return "Please enter your email adress";
                    } else if (!emailController.text.contains("@")) {
                      return "enter a valid email";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Your Password",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (passwordController.text.isNotEmpty &&
                        passwordController.text.length >= 6) {
                      return null;
                    } else if (passwordController.text.isEmpty) {
                      return "Please enter a password";
                    } else if (passwordController.text.length < 6) {
                      return "password must contain atleast 6 characters";
                    }
                  },
                ),
                Row(
                  children: [
                    Icon(Icons.check_box_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Remember Me"),
                    SizedBox(width: 100),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "forgot Password",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
                SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (emailController.text == email &&
                          passwordController.text == password) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogoutScreen(),
                            ));
                      }
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 17, 7, 153),
                    ),
                  ),
                ),
                SizedBox(
                  height: 244,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
