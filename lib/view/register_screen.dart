import 'package:flutter/material.dart';
import 'package:login_textformfield/main.dart';
import 'package:login_textformfield/view/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_back)),
        ),
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
                      height: 70,
                    ),
                    Center(
                      child: Text(
                        "Sign up for Free",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
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
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: "Confirm your password",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (confirmPasswordController.text.isNotEmpty &&
                            confirmPasswordController.text ==
                                passwordController.text) {
                          return null;
                        } else if (confirmPasswordController.text.isEmpty) {
                          return "please enter the password";
                        } else if (confirmPasswordController.text !=
                            passwordController.text) {
                          return "Paswword not match";
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
                          email = emailController.text;
                          password = passwordController.text;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        }
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "Sign up",
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
                      height: 168,
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text(
                            "Sign in",
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
