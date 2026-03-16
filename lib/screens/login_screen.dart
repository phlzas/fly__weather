import 'package:flutter/material.dart';
import 'package:fly_weather/Request_state.dart';
import 'package:fly_weather/providers/auth_proivders.dart';
import 'package:fly_weather/screens/home_screen.dart';
import 'package:fly_weather/widgets/card.dart';
import 'package:fly_weather/widgets/password_field.dart';
import 'package:fly_weather/widgets/text_feild.dart';
import 'package:provider/provider.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(199, 33, 149, 243),
              Colors.white,
              Colors.white,
              Colors.white
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              MyCard(
                child: Icon(
                  Icons.airplanemode_active_outlined,
                  size: 60,
                  color: Colors.white,
                ),
                color: Colors.blueAccent,
              ),
              Text(
                "FlyWeather",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Text("Check the weather before your flight",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: MyCard(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              MyTextfeild(
                                  lable: "Email",
                                  hint: "User@gmail.com",
                                  icon: Icons.email_outlined,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null; // Valid
                                  },
                                  controller: _emailController),
                              SizedBox(
                                height: 10,
                              ),
                              MyPassfeild(
                                  lable: "Password",
                                  hint: ".......",
                                  icon: Icons.password_outlined,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    return null; // Valid
                                  },
                                  controller: _passwordController),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await context.read<AuthProivders>().login(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Logging in...')),
                                    );
                                    if (context.read<AuthProivders>().state ==
                                        RequestState.success) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text('success')),
                                      );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => HomeScreen()));
                                    }
                                    if (context.read<AuthProivders>().state ==
                                        RequestState.error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text('error')),
                                      );
                                    }
                                    if (context.read<AuthProivders>().state ==
                                        RequestState.empty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.yellow,
                                            content: Text('empty')),
                                      );
                                    }
                                  }
                                },
                                child: Text('Login'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SignupScreen())),
                                child: Text('Don\'t have an account? Sign Up'),
                              ),
                            ],
                          ))
                    ],
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
